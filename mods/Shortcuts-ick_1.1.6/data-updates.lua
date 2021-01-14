--[[ Copyright (c) 2019 npc_strider
 * For direct use of code or graphics, credit is appreciated and encouraged. See LICENSE.txt for more information.
 * This mod may contain modified code sourced from base/core Factorio.
 * This mod has been modified by ickputzdirwech.
]]

--[[ Overview of data-updates.lua:
	* Remote hiding
	* Generation of disabled equipment
]]

require("prototypes.shortcuts-artillery-updates")


---------------------------------------------------------------------------------------------------
-- REMOTE HIDING
---------------------------------------------------------------------------------------------------
local function hide_the_remote(recipe, technology, item)
	if item then
		if item.flags then
			table.insert(item.flags, "only-in-cursor")
			table.insert(item.flags, "spawnable")
		else
			item.flags = {"only-in-cursor", "spawnable"}
		end
	end
	local recipe_prototype = data.raw.recipe[recipe]
	local tech_prototype = data.raw.technology[technology]
	if recipe_prototype then
		recipe_prototype.hidden = true
		recipe_prototype.ingredients = {{"iron-plate", 1}}
		if technology ~= nil and tech_prototype then
			local effect = tech_prototype.effects
			for i, e in pairs(effect) do
				if effect[i].type == "unlock-recipe" then
					if effect[i].recipe == recipe then
						table.remove(effect, i)
						return
					end
				end
			end
		end
	end
end

if settings.startup["artillery-targeting-remote"].value == true then
	hide_the_remote("artillery-targeting-remote", "artillery", data.raw.capsule["artillery-targeting-remote"])
end

if settings.startup["discharge-defense-remote"].value == true then
	hide_the_remote("discharge-defense-remote", "discharge-defense-equipment", data.raw.capsule["discharge-defense-remote"])
end

--[[if settings.startup["spidertron-remote"].value == "enabled" then
	hide_the_remote("spidertron-remote", "spidertron")
end]]
if settings.startup["spidertron-remote"].value == "enabled-hidden" then
	hide_the_remote("spidertron-remote", "spidertron", data.raw["spidertron-remote"]["spidertron-remote"])
end

-- SUPPORTED MODS
if mods["aai-programmable-vehicles"] then
	if data.raw["selection-tool"]["unit-remote-control"] then
		hide_the_remote("unit-remote-control", nil, data.raw["selection-tool"]["unit-remote-control"])
	end
	if data.raw["selection-tool"]["path-remote-control"] then
		hide_the_remote("path-remote-control", nil, data.raw["selection-tool"]["path-remote-control"])
	end
end

if mods["AdvArtilleryRemotes"] then
	if data.raw.capsule["artillery-cluster-remote"] then
		hide_the_remote("artillery-cluster-remote", "artillery", data.raw.capsule["artillery-cluster-remote"])
	end
	if data.raw.capsule["artillery-discovery-remote"] then
		hide_the_remote("artillery-discovery-remote", "artillery", data.raw.capsule["artillery-discovery-remote"])
	end
end

if (mods["Orbital Ion Cannon"] or mods["Kux-OrbitalIonCannon"]) and data.raw.item["ion-cannon-targeter"] and data.raw.technology["orbital-ion-cannon"] and settings.startup["ion-cannon-targeter"].value == true then
	hide_the_remote("ion-cannon-targeter", "orbital-ion-cannon", data.raw.item["ion-cannon-targeter"])
end

if mods["MIRV"] and data.raw.capsule["mirv-targeting-remote"] and data.raw.technology["mirv-technology"] and settings.startup["mirv-targeting-remote"].value == true then
	hide_the_remote("mirv-targeting-remote", "mirv-technology", data.raw.capsule["mirv-targeting-remote"])
end


if (mods["OutpostPlanner"] or mods["OutpostPlannerUpdated"] or mods["OutpostPlanner1-1"]) and (mods["PlannerCore"] or mods["PlannerCore1-1"]) and data.raw["selection-tool"]["outpost-builder"] and settings.startup["outpost-builder"].value == true then
	hide_the_remote("outpost-builder", nil, data.raw["selection-tool"]["outpost-builder"])
end

if mods["WellPlanner"] and data.raw["selection-tool"]["well-planner"] and settings.startup["well-planner"].value == true then
	hide_the_remote("well-planner", nil, data.raw["selection-tool"]["well-planner"])
end

if mods["VehicleWagon2"] and settings.startup["winch"].value == true then
	hide_the_remote("winch", "vehicle-wagons", data.raw.capsule["winch"])
end

-- OTHER MODS
if mods["circuit-checker"] and data.raw["selection-tool"]["circuit-checker"] then
	hide_the_remote(nil, nil, data.raw["selection-tool"]["circuit-checker"])
end

if mods["RailSignalPlanner"] and data.raw["selection-tool"]["rail-signal-planner"] then
	hide_the_remote(nil, nil, data.raw["selection-tool"]["rail-signal-planner"])
end

if mods["OreEraser"] and data.raw["selection-tool"]["Ore Eraser"] then
	hide_the_remote(nil, nil, data.raw["selection-tool"]["Ore Eraser"])
end

--Remove shortcuts from PickerInventoryTools
if mods["PickerInventoryTools"] then
	if data.raw.shortcut["toggle-active-defense-equipment"] then
		data.raw.shortcut["toggle-active-defense-equipment"] = nil
	end
	if data.raw.shortcut["toggle-night-vision-equipment"] then
		data.raw.shortcut["toggle-night-vision-equipment"] = nil
	end
end

--Remove technology_to_unlock and/or change action for mod shortcuts in order to make them available based in researched in a specific game.
if mods["circuit-checker"] and data.raw.shortcut["check-circuit"] then
	data.raw.shortcut["check-circuit"].action = "lua"
	data.raw.shortcut["check-circuit"].item_to_spawn = nil
	data.raw.shortcut["check-circuit"].technology_to_unlock = nil
end
if mods["Spider_Control"] and data.raw.shortcut["squad-spidertron-follow"] then
	data.raw.shortcut["squad-spidertron-follow"].technology_to_unlock = nil
end
if mods["Spider_Control"] and data.raw.shortcut["squad-spidertron-remote"] then
	data.raw.shortcut["squad-spidertron-remote"].action = "lua"
	data.raw.shortcut["squad-spidertron-remote"].item_to_spawn = nil
	data.raw.shortcut["squad-spidertron-remote"].technology_to_unlock = nil
end
if mods["pump"] and data.raw.shortcut["pump-shortcut"] then
	data.raw.shortcut["pump-shortcut"].action = "lua"
	data.raw.shortcut["pump-shortcut"].item_to_spawn = nil
	data.raw.shortcut["pump-shortcut"].technology_to_unlock = nil
end
if mods["RailSignalPlanner"] and data.raw.shortcut["give-rail-signal-planner"] then
	data.raw.shortcut["give-rail-signal-planner"].action = "lua"
	data.raw.shortcut["give-rail-signal-planner"].item_to_spawn = nil
end
if mods["ModuleInserter"] and data.raw.shortcut["module-inserter"] then
	data.raw.shortcut["module-inserter"].action = "lua"
	data.raw.shortcut["module-inserter"].item_to_spawn = nil
end


---------------------------------------------------------------------------------------------------
-- GENERATION OF DISABLED EQUIPMENT
---------------------------------------------------------------------------------------------------

local disabled_equipment = {}
local disabled_equipment_item = {}
local equipment_list = {}

if settings.startup["night-vision-equipment"].value == true then
	equipment_list[#equipment_list+1] = "night-vision-equipment"
end
if settings.startup["belt-immunity-equipment"].value == true then
	equipment_list[#equipment_list+1] = "belt-immunity-equipment"
end
if settings.startup["active-defense-equipment"].value == true then
	equipment_list[#equipment_list+1] = "active-defense-equipment"
end

--[[if mods["GunEquipment"] then
	local NoMagazine = table.deepcopy(data.raw["item"]["personal-turret-equipment"])
	NoMagazine.name = "personal-turret-no-magazine-equipment"
	NoMagazine.localised_name = {"", {"equipment-name.personal-turret-no-magazine-equipment"}, " (", {"gui-constant.off"}, ")"}
	local FirearmMagazine = table.deepcopy(data.raw["item"]["personal-turret-equipment"])
	FirearmMagazine.name = "personal-turret-firearm-magazine-equipment"
	local PiercingRoundsMagazine = table.deepcopy(data.raw["item"]["personal-turret-equipment"])
	PiercingRoundsMagazine.name = "personal-turret-piercing-rounds-magazine-equipment"
	local UraniumRoundsMagazine = table.deepcopy(data.raw["item"]["personal-turret-equipment"])
	UraniumRoundsMagazine.name = "personal-turret-uranium-rounds-magazine-equipment"
	data:extend{NoMagazine, FirearmMagazine, PiercingRoundsMagazine, UraniumRoundsMagazine}
end]]


for i, e in pairs(equipment_list) do

	for _, equipment in pairs(data.raw[equipment_list[i]]) do
		local i = #disabled_equipment+1
		disabled_equipment[i] = util.table.deepcopy(equipment)

		--make it compatible with NightvisionToggles, GunEquipment and Nanobots
		if disabled_equipment[i].name ~= "nvt-night-vision-equipment" and string.sub(disabled_equipment[i].name,1,16) ~= "personal-turret-" then
			if string.sub(disabled_equipment[i].name,1,7) ~= "picker-" then
				local name = equipment.name

				if (equipment.type == "active-defense-equipment" and equipment.automatic == true) or equipment.type ~= "active-defense-equipment" then
					disabled_equipment[i].name = "disabled-" .. name
					disabled_equipment[i].localised_name = {"", {"equipment-name." .. name}, " (", {"gui-constant.off"}, ")"}
				elseif (equipment.type == "active-defense-equipment" and equipment.automatic == false) then
					disabled_equipment[i].name = "disabledinactive-" .. name
					disabled_equipment[i].localised_name = {"equipment-name." .. name}
				end

				disabled_equipment[i].energy_input = "0kW"
				disabled_equipment[i].take_result = name
				disabled_equipment[i].flags = {"hidden"}
				disabled_equipment[i].sprite.tint = {0.5, 0.5, 0.5}

				if equipment_list[i] == "belt-immunity-equipment" or (equipment.type == "active-defense-equipment" and equipment.automatic == true) then
					disabled_equipment[i].energy_source.input_flow_limit = "0kW"
					disabled_equipment[i].energy_source.buffer_capacity = "0kJ"
					disabled_equipment[i].energy_source.drain = "1kW"
				end

			end
		end
	end

end

for i=1,(#disabled_equipment),1 do
	data:extend({disabled_equipment[i]})
end