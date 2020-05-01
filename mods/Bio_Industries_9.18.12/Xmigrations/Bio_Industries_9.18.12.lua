local BioInd = require('common')('Bio_Industries')
------------------------------------------------------------------------------------
-- Some tables were removed entirely from global in 0.18.11. Restore them!
------------------------------------------------------------------------------------
for _, table in ipairs({"bi_solar_boiler_table", "bi_solar_farm_table", "bi_bio_farm_table"}) do
--~ global.bi_solar_boiler_table = global.bi_solar_boiler_table or {}
--~ global.bi_solar_farm_table = global.bi_solar_farm_table or {}
    global[table] = global[table] or {}
log(table .. ": " .. serpent.block(global[table]))
end
--~ ------------------------------------------------------------------------------------
--~ -- Restore hidden power poles and hidden lamps accidentally removed in the
--~ -- previous version.
--~ ------------------------------------------------------------------------------------
--~ local pole_name = "bi-hidden-power-pole"
--~ local lamp_name = "bi-bio-farm-light"

--~ local pole_count = 0
--~ local lamp_count = 0

--~ -- Restoring hidden power pole for solar boilers
--~ for index, solar_boiler in pairs(global.bi_solar_boiler_table) do
  --~ -- Remove invalid solar boilers from list
  --~ if not solar_boiler.base.valid then
    --~ BioInd.writeDebug("Removing invalid solar boiler " .. tostring(index) .. " from global list.")
    --~ if solar_boiler.boiler.valid then
      --~ solar_boiler.boiler.destroy()
    --~ end
    --~ if solar_boiler.pole.valid then
      --~ solar_boiler.pole.destroy()
    --~ end
    --~ global.bi_solar_boiler_table = nil

  --~ -- Restore hidden power pole if necessary
  --~ elseif not solar_boiler.pole.valid then
    --~ BioInd.writeDebug("Creating new hidden power pole for solar boiler " .. tostring(index) .. ".")
    --~ local new_pole = solar_boiler.base.surface.create_entity({
      --~ name = pole_name,
      --~ position = solar_boiler.base.position,
      --~ direction = solar_boiler.base.direction,
      --~ force = solar_boiler.base.force
    --~ })
    --~ global.bi_solar_boiler_table[index].pole = new_pole
    --~ pole_count = pole_count + 1
  --~ end
--~ end
--~ log("Restored " .. tostring(pole_count) .. " hidden power poles for solar boilers.")
--~ game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles for solar boilers.")


--~ -- Restoring hidden power pole for solar farms
--~ pole_count = 0

--~ for index, solar_farm in pairs(global.bi_solar_farm_table) do
  --~ -- Remove invalid solar boilers from list
  --~ if not solar_farm.base.valid then
    --~ BioInd.writeDebug("Removing invalid solar farm " .. tostring(index) .. " from global list.")
    --~ if solar_farm.pole.valid then
      --~ solar_farm.pole.destroy()
    --~ end
    --~ global.bi_solar_farm_table = nil

  --~ -- Restore hidden power pole if necessary
  --~ elseif not solar_farm.pole.valid then
    --~ BioInd.writeDebug("Creating new hidden power pole for solar farm " .. tostring(index) .. ".")
    --~ local new_pole = solar_farm.base.surface.create_entity({
      --~ name = pole_name,
      --~ position = solar_farm.base.position,
      --~ direction = solar_farm.base.direction,
      --~ force = solar_farm.base.force
    --~ })
    --~ global.bi_solar_farm_table[index].pole = new_pole
    --~ pole_count = pole_count + 1
  --~ end
--~ end
--~ log("Restored " .. tostring(pole_count) .. " hidden power poles for solar farms.")
--~ game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles for solar farms.")


--~ -- Restoring hidden power pole and hidden lamps for bio farms
--~ pole_count = 0

--~ for index, bio_farm in pairs(global.bi_bio_farm_table) do
  --~ -- Remove invalid solar boilers from list
  --~ if not bio_farm.base.valid then
    --~ BioInd.writeDebug("Removing invalid solar farm " .. tostring(index) .. " from global list.")
    --~ if bio_farm.pole.valid then
      --~ bio_farm.pole.destroy()
    --~ end
    --~ if bio_farm.panel.valid then
      --~ bio_farm.panel.destroy()
    --~ end
    --~ if bio_farm.lamp.valid then
      --~ bio_farm.lamp.destroy()
    --~ end
    --~ global.bi_bio_farm_table = nil

  --~ -- Restore hidden entities if necessary
  --~ else
    --~ -- Restore hidden power pole
    --~ if not bio_farm.pole.valid then
      --~ BioInd.writeDebug("Creating new hidden power pole for solar farm " .. tostring(index) .. ".")
      --~ local new_pole = bio_farm.base.surface.create_entity({
        --~ name = pole_name,
        --~ position = bio_farm.base.position,
        --~ direction = bio_farm.base.direction,
        --~ force = bio_farm.base.force
      --~ })
      --~ global.bi_bio_farm_table[index].pole = new_pole
      --~ pole_count = pole_count + 1
    --~ end
    --~ -- Restore hidden lamp
    --~ if not bio_farm.lamp.valid then
      --~ BioInd.writeDebug("Creating new hidden lamp for solar farm " .. tostring(index) .. ".")
      --~ local new_lamp = bio_farm.base.surface.create_entity({
      --~ name = lamp_name,
      --~ position = bio_farm.base.position,
      --~ force = bio_farm.base.force
    --~ })

      --~ global.bi_bio_farm_table[index].lamp = new_lamp
      --~ lamp_count = lamp_count + 1
    --~ end
  --~ end
--~ end
--~ log("Restored " .. tostring(pole_count) .. " hidden power poles and " .. tostring(lamp_count) ..
    --~ " hidden lamps for bio farms.")
--~ game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles and " .. tostring(lamp_count) ..
    --~ " hidden lamps for bio farms.")

------------------------------------------------------------------------------------
-- Restore hidden power poles and hidden lamps accidentally removed in the
-- previous version.
------------------------------------------------------------------------------------

local pole_name = "bi-hidden-power-pole"
local lamp_name = "bi-bio-farm-light"

local pole_count = 0
local lamp_count = 0

-- Restoring hidden power pole for solar boilers
for index, solar_boiler in pairs(global.bi_solar_boiler_table) do
  -- Remove invalid solar boilers from list
  if not solar_boiler.base.valid then
    BioInd.writeDebug("Removing invalid solar boiler " .. tostring(index) .. " from global list.")
    if solar_boiler.boiler.valid then
      solar_boiler.boiler.destroy()
    end
    if solar_boiler.pole.valid then
      solar_boiler.pole.destroy()
    end
    global.bi_solar_boiler_table = nil

  -- Restore hidden power pole if necessary
  elseif not solar_boiler.pole.valid then
    BioInd.writeDebug("Creating new hidden power pole for solar boiler " .. tostring(index) .. ".")
    local new_pole = solar_boiler.base.surface.create_entity({
      name = pole_name,
      position = solar_boiler.base.position,
      direction = solar_boiler.base.direction,
      force = solar_boiler.base.force
    })
    global.bi_solar_boiler_table[index].pole = new_pole
    pole_count = pole_count + 1
  end
end
log("Restored " .. tostring(pole_count) .. " hidden power poles for solar boilers.")
game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles for solar boilers.")


-- Restoring hidden power pole for solar farms
pole_count = 0

for index, solar_farm in pairs(global.bi_solar_farm_table) do
  -- Remove invalid solar boilers from list
  if not solar_farm.base.valid then
    BioInd.writeDebug("Removing invalid solar farm " .. tostring(index) .. " from global list.")
    if solar_farm.pole.valid then
      solar_farm.pole.destroy()
    end
    global.bi_solar_farm_table = nil

  -- Restore hidden power pole if necessary
  elseif not solar_farm.pole.valid then
    BioInd.writeDebug("Creating new hidden power pole for solar farm " .. tostring(index) .. ".")
    local new_pole = solar_farm.base.surface.create_entity({
      name = pole_name,
      position = solar_farm.base.position,
      direction = solar_farm.base.direction,
      force = solar_farm.base.force
    })
    global.bi_solar_farm_table[index].pole = new_pole
    pole_count = pole_count + 1
  end
end
log("Restored " .. tostring(pole_count) .. " hidden power poles for solar farms.")
game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles for solar farms.")


-- Restoring hidden power pole and hidden lamps for bio farms
pole_count = 0

for index, bio_farm in pairs(global.bi_bio_farm_table) do
  -- Remove invalid solar boilers from list
  if not bio_farm.base.valid then
    BioInd.writeDebug("Removing invalid solar farm " .. tostring(index) .. " from global list.")
    if bio_farm.pole.valid then
      bio_farm.pole.destroy()
    end
    if bio_farm.panel.valid then
      bio_farm.panel.destroy()
    end
    if bio_farm.lamp.valid then
      bio_farm.lamp.destroy()
    end
    global.bi_bio_farm_table = nil

  -- Restore hidden entities if necessary
  else
    -- Restore hidden power pole
    if not bio_farm.pole.valid then
      BioInd.writeDebug("Creating new hidden power pole for solar farm " .. tostring(index) .. ".")
      local new_pole = bio_farm.base.surface.create_entity({
        name = pole_name,
        position = bio_farm.base.position,
        direction = bio_farm.base.direction,
        force = bio_farm.base.force
      })
      global.bi_bio_farm_table[index].pole = new_pole
      pole_count = pole_count + 1
    end
    -- Restore hidden lamp
    if not bio_farm.lamp.valid then
      BioInd.writeDebug("Creating new hidden lamp for solar farm " .. tostring(index) .. ".")
      local new_lamp = bio_farm.base.surface.create_entity({
      name = lamp_name,
      position = bio_farm.base.position,
      force = bio_farm.base.force
    })

      global.bi_bio_farm_table[index].lamp = new_lamp
      lamp_count = lamp_count + 1
    end
  end
end
log("Restored " .. tostring(pole_count) .. " hidden power poles and " .. tostring(lamp_count) ..
    " hidden lamps for bio farms.")
game.print("[Bio Industries] Restored " .. tostring(pole_count) .. " hidden power poles and " .. tostring(lamp_count) ..
    " hidden lamps for bio farms.")
