data.raw.gun["tank-flamethrower"].attack_parameters.range = 15 --9
data.raw.gun["tank-cannon"].attack_parameters.range = 27 -- 25
data.raw.gun["tank-cannon"].attack_parameters.min_range = 5
data.raw.gun["tank-cannon"].attack_parameters.damage_modifier = 1.5 --1
data.raw.gun["tank-machine-gun"].attack_parameters.damage_modifier = 1.5 --1

local caliber_H1_icon_layer = {icon = "__SchallTankPlatoon__/graphics/icons/H1.png", icon_size = 128, icon_mipmaps = 3}
local caliber_H2_icon_layer = {icon = "__SchallTankPlatoon__/graphics/icons/H2.png", icon_size = 128, icon_mipmaps = 3}

local tankMG = table.deepcopy(data.raw.gun["tank-machine-gun"])
tankMG.name = "tank-machine-gun-single"
tankMG.attack_parameters.cooldown = tankMG.attack_parameters.cooldown * 2

local tankAC = table.deepcopy(data.raw.gun["tank-cannon"])
tankAC.name = "tank-autocannon"
tankAC.attack_parameters.ammo_category = "autocannon-shell" --"cannon-shell"
tankAC.attack_parameters.cooldown = tankAC.attack_parameters.cooldown/10 --90
tankAC.attack_parameters.range = 20 --25
tankAC.attack_parameters.sound[1].volume = 0.5 --1.0

local tankCH1 = table.deepcopy(data.raw.gun["tank-cannon"])
tankCH1.name = "tank-cannon-H1"
tankCH1.icon = nil
tankCH1.icons = { {icon = "__base__/graphics/icons/tank-cannon.png"},
                  caliber_H1_icon_layer }
tankCH1.attack_parameters.ammo_category = "cannon-H1-shell" --"cannon-shell"
tankCH1.attack_parameters.cooldown = tankCH1.attack_parameters.cooldown*2 --90
tankCH1.attack_parameters.range = 30 --25
-- tankCH1.attack_parameters.damage_modifier = 1.2

local tankCH2 = table.deepcopy(data.raw.gun["tank-cannon"])
tankCH2.name = "tank-cannon-H2"
tankCH2.icon = nil
tankCH2.icons = { {icon = "__base__/graphics/icons/tank-cannon.png"},
                  caliber_H2_icon_layer }
tankCH2.attack_parameters.ammo_category = "cannon-H2-shell" --"cannon-shell"
tankCH2.attack_parameters.cooldown = tankCH2.attack_parameters.cooldown*4 --90
tankCH2.attack_parameters.range = 35 --25
-- tankCH2.attack_parameters.damage_modifier = 1.5

local htTML = table.deepcopy(data.raw.gun["rocket-launcher"])
htTML.flags = {"hidden"}
htTML.name = "Schall-tactical-missile-launcher"
htTML.attack_parameters.cooldown = htTML.attack_parameters.cooldown*4 --60
htTML.attack_parameters.range = 48 --40 --22
htTML.attack_parameters.damage_modifier = 1.2

local htMRL = table.deepcopy(data.raw.gun["rocket-launcher"])
htMRL.flags = {"hidden"}
htMRL.name = "Schall-multiple-rocket-launcher"
htMRL.attack_parameters.cooldown = htMRL.attack_parameters.cooldown*0.5 --60
htMRL.attack_parameters.range = 36 --25 --22
htMRL.attack_parameters.damage_modifier = 0.8



data:extend(
{
  tankMG,
  tankAC,
  tankCH1,
  tankCH2,
  htTML,
  htMRL,
  {
    type = "gun",
    name = "Schall-sniper-rifle",
    icon = "__SchallTankPlatoon__/graphics/icons/sniper-rifle.png",
    icon_size = 128, icon_mipmaps = 3,
    subgroup = "gun",
    order = "a[basic-clips]-s[sniper-rifle]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "Schall-sniper-bullet",
      cooldown = 120, --6,
      movement_slow_down_factor = 1.0, --0.7,
      movement_slow_down_cooldown = 120, --0,
      damage_modifier = 8, --4, --1,
      min_range = 8, --0,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 40, --36, --18,
      sound = 
      {
        filename = "__SchallTankPlatoon__/sound/sniper-rifle-gunshot.ogg",
        volume = 0.6
      },
    },
    stack_size = 5
  }
}
)
