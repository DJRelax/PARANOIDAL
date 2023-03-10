-- Copyright (C) 2022  veden

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

local vanillaBuildings = require("prototypes/buildings/UpdatesVanilla")

local swarmUtils = require("prototypes/SwarmUtils")

local constants = require("libs/Constants")


if settings.startup["rampant--newEnemies"].value then
    swarmUtils.processFactions()
    swarmUtils.generateSpawnerProxy(data.raw["unit-spawner"]["neutral-biter-spawner-v1-t10-rampant"].result_units)

    if mods["SchallAlienLoot"] then
        local SizeLootRampant = {1, 2, 3, 3, 4, 4, 4, 5, 5, 6}
        for _,faction in pairs(constants.FACTION_SET) do
            for v=1,settings.startup["rampant--newEnemyVariations"].value do
                for factionSize = 1, 10 do
                    SchallAlienLoot_add_spawner(faction.type.."-hive-v"..v.."-t"..factionSize.."-rampant")
                    SchallAlienLoot_add_spawner(faction.type.."-spitter-spawner-v"..v.."-t"..factionSize.."-rampant")
                    SchallAlienLoot_add_spawner(faction.type.."-biter-spawner-v"..v.."-t"..factionSize.."-rampant")
                    SchallAlienLoot_add_worm(faction.type.."-worm-v"..v.."-t"..factionSize.."-rampant", factionSize)
                    SchallAlienLoot_add_mover(faction.type.."-spitter-v"..v.."-t"..factionSize.."-rampant", SizeLootRampant[factionSize])
                    SchallAlienLoot_add_mover(faction.type.."-biter-v"..v.."-t"..factionSize.."-rampant", SizeLootRampant[factionSize])
                end
            end
        end
    end
else
    swarmUtils.generateSpawnerProxy(data.raw["unit-spawner"]["biter-spawner"].result_units)
end

if settings.startup["rampant--removeBloodParticles"].value then
    local explosions = data.raw["explosion"]

    for k,v in pairs(explosions) do
        if string.find(k, "blood") then
            v["created_effect"] = nil
        end
    end
end

if settings.startup["rampant--unitSpawnerBreath"].value then
    for _, unitSpawner in pairs(data.raw["unit-spawner"]) do
        if (string.find(unitSpawner.name, "hive") or string.find(unitSpawner.name, "biter") or
            string.find(unitSpawner.name, "spitter")) then
            if not unitSpawner.flags then
                unitSpawner.flags = {}
            end
            unitSpawner.flags[#unitSpawner.flags+1] = "breaths-air"
        end
    end
end


for k, unit in pairs(data.raw["unit"]) do
    if (string.find(k, "biter") or string.find(k, "spitter")) and unit.collision_box then
        if settings.startup["rampant--enableSwarm"].value then
            unit.collision_box = {
                {unit.collision_box[1][1] * 0.20, unit.collision_box[1][2] * 0.20},
                {unit.collision_box[2][1] * 0.20, unit.collision_box[2][2] * 0.20}
            }
        end

        unit.affected_by_tiles = settings.startup["rampant--unitsAffectedByTiles"].value

        unit.ai_settings = {
            destroy_when_commands_fail = false,
            allow_try_return_to_spawner = true
        }
    end
end

if settings.startup["rampant--enableShrinkNestsAndWorms"].value then
    for k, unit in pairs(data.raw["unit-spawner"]) do
        if (string.find(k, "biter") or string.find(k, "spitter") or string.find(k, "hive")) and unit.collision_box then
            unit.collision_box = {
                {unit.collision_box[1][1] * 0.50, unit.collision_box[1][2] * 0.50},
                {unit.collision_box[2][1] * 0.50, unit.collision_box[2][2] * 0.50}
            }
        end
    end

    for k, unit in pairs(data.raw["turret"]) do
        if string.find(k, "worm") and unit.collision_box then
            unit.collision_box = {
                {unit.collision_box[1][1] * 0.50, unit.collision_box[1][2] * 0.50},
                {unit.collision_box[2][1] * 0.50, unit.collision_box[2][2] * 0.50}
            }
        end
    end
end

if settings.startup["rampant--enableFadeTime"].value then
    for k, corpse in pairs(data.raw["corpse"]) do
        if (string.find(k, "biter") or string.find(k, "spitter") or string.find(k, "hive") or
            string.find(k, "worm") or string.find(k, "spawner")) then
            corpse.time_before_removed = settings.startup["rampant--unitAndSpawnerFadeTime"].value * 60
        end
    end
end

if settings.startup["rampant--addWallResistanceAcid"].value then
    vanillaBuildings.addWallAcidResistance()
end
