-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

local inputs = {
    type = "movement-bonus-equipment",
    icon_name = "exoskeleton",
    mod = "bobs",
    group = "equipment",
}

-- Setup defaults
reskins.lib.parse_inputs(inputs)

local exoskeletons = {
    ["exoskeleton-equipment"] = {tier = 1, prog_tier = 2},
    ["exoskeleton-equipment-2"] = {tier = 2, prog_tier = 3},
    ["exoskeleton-equipment-3"] = {tier = 3, prog_tier = 4},
}

-- Reskin equipment
for name, map in pairs(exoskeletons) do
    -- Fetch equipment
    local equipment = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not equipment then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = reskins.lib.tint_index[tier]

    if reskins.bobs and reskins.bobs.triggers.equipment.technologies then
        -- Construct technology icon
        inputs.technology_icon_extras = { reskins.lib.technology_equipment_overlay() }

        reskins.lib.construct_technology_icon(name, inputs)
    end

    if reskins.bobs and reskins.bobs.triggers.equipment.equipment then
        -- Construct icon
        reskins.lib.construct_icon(name, tier, inputs)

        -- Reskin the equipment
        equipment.sprite = {
            layers = {
                -- Base
                {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/exoskeleton/exoskeleton-equipment-base.png",
                    width = 64,
                    height = 128,
                    priority = "medium",
                    flags = { "no-crop" },
                },
                -- Mask
                {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/exoskeleton/exoskeleton-equipment-mask.png",
                    width = 64,
                    height = 128,
                    priority = "medium",
                    flags = { "no-crop" },
                    tint = inputs.tint,
                },
                -- Highlights
                {
                    filename = reskins.bobs.directory.."/graphics/equipment/equipment/exoskeleton/exoskeleton-equipment-highlights.png",
                    width = 64,
                    height = 128,
                    priority = "medium",
                    flags = { "no-crop" },
                    blend_mode = reskins.lib.blend_mode, -- "additive",
                }
            }
        }
    end

    -- Label to skip to next iteration
    ::continue::
end