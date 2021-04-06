-- Copyright (c) 2021 Kirazy
-- Part of Artisanal Reskins: Bob's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.bobs and reskins.bobs.triggers.warfare.technologies) then return end

-- Setup inputs
local inputs = {
    mod = "bobs",
    group = "warfare",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 4,
    flat_icon = true,
}

local technology = {
    -- Radars
    ["radars"] = {tier = 2, icon_name = "radar", flat_icon = false, technology_icon_size = 128},
    ["radars-2"] = {tier = 3, icon_name = "radar", flat_icon = false, technology_icon_size = 128},
    ["radars-3"] = {tier = 4, icon_name = "radar", flat_icon = false, technology_icon_size = 128},
    ["radars-4"] = {tier = 5, icon_name = "radar", flat_icon = false, technology_icon_size = 128},

    -- Miscellaneous
    ["reinforced-wall"] = {technology_icon_size = 128},
    ["bob-laser-rifle"] = {},
    ["bob-scatter-cannon-shells"] = {},
    ["cordite-processing"] = {},

    -- Laser rifle ammo
    ["bob-laser-rifle-ammo-1"] = {subgroup = "laser-rifle-ammo"},
    ["bob-laser-rifle-ammo-2"] = {subgroup = "laser-rifle-ammo"},
    ["bob-laser-rifle-ammo-3"] = {subgroup = "laser-rifle-ammo"},
    ["bob-laser-rifle-ammo-4"] = {subgroup = "laser-rifle-ammo"},
    ["bob-laser-rifle-ammo-5"] = {subgroup = "laser-rifle-ammo"},
    ["bob-laser-rifle-ammo-6"] = {subgroup = "laser-rifle-ammo"},

    -- Rocketry
    ["rocketry"] = {subgroup = "rocketry"},
    ["bob-rocket"] = {subgroup = "rocketry"},
    ["bob-piercing-rocket"] = {subgroup = "rocketry"},
    ["bob-electric-rocket"] = {subgroup = "rocketry"},
    ["bob-acid-rocket"] = {subgroup = "rocketry"},
    ["bob-explosive-rocket"] = {subgroup = "rocketry"},
    ["bob-poison-rocket"] = {subgroup = "rocketry"},
    ["bob-flame-rocket"] = {subgroup = "rocketry"},
    ["bob-plasma-rocket"] = {subgroup = "rocketry"},

    -- Artillery shells
    ["bob-poison-artillery-shells"] = {subgroup = "artillery-shells"},
    ["bob-fire-artillery-shells"] = {subgroup = "artillery-shells"},
    ["bob-explosive-artillery-shells"] = {subgroup = "artillery-shells"},
    ["bob-distractor-artillery-shells"] = {subgroup = "artillery-shells"},
    ["bob-atomic-artillery-shell"] = {subgroup = "artillery-shells"},

    -- Mines
    ["poison-mine"] = {subgroup = "mines"},
    ["slowdown-mine"] = {subgroup = "mines"},
    ["distractor-mine"] = {subgroup = "mines"},
}

if mods["aai-industry"] then
    technology["radar"] = {tier = 1, icon_name = "radar", flat_icon = false, technology_icon_size = 128}
end

reskins.lib.create_icons_from_list(technology, inputs)