-- Sets up the global table and parses settings

local setup = {}
local util = scripts.util
local metatables = scripts.metatables
local defaultTrash = require("default-trash")

function setup.on_init()
	global.cache = global.cache or {}
	global.distrEvents = global.distrEvents or {}
	global.settings = {}
	global.defaultTrash = setup.generateTrashItemList()
	
	for player_index,_ in pairs(game.players) do
		setup.createPlayerCache(player_index)
		setup.parsePlayerSettings(player_index)
	end

	for _,force in pairs(game.forces) do
		setup.applyEarlyAutotrash(force) 
	end
end

setup.on_configuration_changed = setup.on_init

function setup.on_player_created(event)
	setup.createPlayerCache(event.player_index)
	setup.parsePlayerSettings(event.player_index)
	
	-- local player = game.players[event.player_index]
	-- player.print({"message.usage"}, {r=1, g=0.85, b=0})
end

function setup.on_runtime_mod_setting_changed(event)
	local setting = setup.parsedSettings[event.setting]
	if setting then 
		setting.parse(event.player_index)
	elseif event.setting == "early-autotrash-research" then 
		for _,force in pairs(game.forces) do
			setup.applyEarlyAutotrash(force) 
		end
	end
end

function setup.on_force_created(event)
	setup.applyEarlyAutotrash(event.force or event.destination)
end
setup.on_forces_merged = setup.on_force_created
setup.on_technology_effects_reset = setup.on_force_created

function setup.applyEarlyAutotrash(force)
	if settings.global["early-autotrash-research"].value then -- enable logistic tab
		force.character_logistic_requests = true
		force.auto_character_trash_slots = true
		if force.character_trash_slot_count == 0 then
			force.character_trash_slot_count = 10
		end

	else -- revert changes
		setup.resetLogisticTechEffects(force)
	end
end

function setup.resetLogisticTechEffects(force)
	local trashslots = 0
	local autotrash = false
	local requests = false

	for _,tech in pairs(force.technologies) do
		if tech.researched then
			for _,effect in pairs(tech.effects) do
				if effect.type == "character-logistic-trash-slots" then
					trashslots = trashslots + effect.modifier
				elseif effect.type == "auto-character-logistic-trash-slots" then
					autotrash = autotrash or effect.modifier
				elseif effect.type == "character-logistic-requests" then
					requests = requests or effect.modifier
				end
			end
		end
	end

	force.character_trash_slot_count  = trashslots
	force.auto_character_trash_slots  = autotrash
	force.character_logistic_requests = requests
end

function setup.createPlayerCache(index)
	global.cache[index] = global.cache[index] or {}
	global.cache[index].items = global.cache[index].items or {}
	global.cache[index].markers = global.cache[index].markers or {}
	metatables.use(global.cache[index].markers, "entityAsIndex")
	global.cache[index].entities = global.cache[index].entities or {}
	metatables.use(global.cache[index].entities, "entityAsIndex")
end

function setup.parsePlayerSettings(index)
	global.settings[index] = {}
	for __,setting in pairs(setup.parsedSettings) do setting.parse(index) end
end

local function logSettingParseError(playerIndex, setting, value)
	local player, playerName = game.players[playerIndex], "<UNKNOWN>"
	local msg = {"message.setting-parse-error", {"mod-setting-name."..setting}, value, ""}
	
	if util.isValid(player) then
		player.print(msg)
		playerName = player.name
	end
	
	msg[4] = {"message.for-user", playerName}
	log(msg)
end

local function parsedListSetting(settingName, settingInternal, regex, toString, isValid)
	return {
		parse = function (index)
			local setting = game.players[index].mod_settings[settingName].value
			local parsed = {}
			
			for name,value in string.gmatch(setting, regex) do
				name = string.lower(name)
				value = value and tonumber(value)
				
				if isValid(name, value) then
					parsed[name] = value or true
				else
					logSettingParseError(index, settingName, toString(name, value))
				end
			end
			
			global.settings[index][settingInternal] = parsed
		end
	}
end

setup.parsedSettings = {
	["inventory-cleanup-custom-trash"] = parsedListSetting(
		"inventory-cleanup-custom-trash", "customTrash", "%s*([^ :]+):(%d+)%s*",
		function (name, value) return tostring(name)..":"..tostring(value) end, -- toString
		function (name, value) return game.item_prototypes[name] and type(value) == "number" and value >= 0 end -- isValid
	),
	["ignored-entities"] = parsedListSetting(
		"ignored-entities", "ignoredEntities", "%s*([^ ]+)%s*",
		function (name) return tostring(name) end, -- toString
		function (name) return game.entity_prototypes[name] end -- isValid
	),
}

function setup.generateTrashItemList()
	local items = {}
	
	for name,item in pairs(game.item_prototypes) do
		if not (item.place_result or item.place_as_equipment_result or item.has_flag("hidden")) then -- or item.place_as_tile_result
			local default = defaultTrash[name] or defaultTrash[item.subgroup.name] or defaultTrash[item.group.name]
			
			if default and default ~= "ignore" then
				if item.fuel_category and not defaultTrash[name] then -- fuels default to 2 stacks as desired amount
					items[name] = 2 * item.stack_size
				else
					items[name] = default
				end
			end
		end
	end
	
	return items
end

function setup.on_load()
	metatables.refresh(global)
end

return setup