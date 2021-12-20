data:extend(
  {
    {
      type = "item",
      name = "ore-refinery",
      icons = angelsmods.functions.add_number_icon_layer(
        {
          {
            icon = "__angelsrefining__/graphics/icons/ore-refinery.png",
            icon_size = 64, icon_mipmaps = 4
          }
        },
        1, angelsmods.refining.number_tint),
      subgroup = "ore-refining",
      order = "a[ore-refinery]",
      place_result = "ore-refinery",
      stack_size = 10
    },
    {
      type = "assembling-machine",
      name = "ore-refinery",
      icons = angelsmods.functions.add_number_icon_layer(
        {
          {
            icon = "__angelsrefining__/graphics/icons/ore-refinery.png",
            icon_size = 64, icon_mipmaps = 4
          }
        },
        1, angelsmods.refining.number_tint),
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 1, result = "ore-refinery"},
      fast_replaceable_group = "ore-refinery",
      next_upgrade = "ore-refinery-2",
      max_health = 300,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
      selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
      module_specification = {
        module_slots = 1
      },
      allowed_effects = {"consumption", "speed", "pollution", "productivity"},
      crafting_categories = {"ore-refining-t4"},
      crafting_speed = 0.75,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.02 * 60
      },
      energy_usage = "300kW",
      ingredient_count = 4,
      animation = {
        layers = {
          {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-base.png",
            priority = "extra-high",
            width = 221,
            height = 256,
            shift = util.by_pixel(0, -16),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-base.png",
              priority = "extra-high",
              width = 440,
              height = 509,
              shift = util.by_pixel(0.5, -16),
              scale = 0.5,
            } or nil
          },
          {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-shadow.png",
            priority = "extra-high",
            width = 261,
            height = 170,
            shift = util.by_pixel(22, 30),
            draw_as_shadow = true,
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-shadow.png",
              priority = "extra-high",
              width = 522,
              height = 340,
              shift = util.by_pixel(21.5, 29),
              draw_as_shadow = true,
              scale = 0.5,
            } or nil
          },
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      working_sound = {
        sound = {filename = "__angelsrefining__/sound/ore-refinery.ogg", volume = 0.7},
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
        audible_distance_modifier = 0.5,
        apparent_volume = 2.5
      },
      working_visualisations = {
        {
          fadeout = true,
          effect = "uranium-glow",
          animation = {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-lights.png",
            priority = "extra-high",
            width = 221,
            height = 256,
            shift = util.by_pixel(0, -16),
            draw_as_glow = true,
            blend_mode = "additive-soft",
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-lights.png",
              priority = "extra-high",
              width = 440,
              height = 509,
              shift = util.by_pixel(0.5, -16),
              draw_as_glow = true,
              blend_mode = "additive-soft",
              scale = 0.5,
            } or nil
          }
        },
        {
          fadeout = true,
          constant_speed = true,
          apply_recipe_tint = "primary",
          north_position = util.by_pixel_hr(-63, -255),
          east_position = util.by_pixel_hr(-63, -255),
          south_position = util.by_pixel_hr(-63, -255),
          west_position = util.by_pixel_hr(-63, -255),
          render_layer = "wires",
          animation = {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 46,
            height = 94,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            tint = util.color("808080"),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.5,
              shift = util.by_pixel(-2, -40),
              tint = util.color("808080"),
              scale = 0.5
            } or nil
          }
        },
        {
          fadeout = true,
          constant_speed = true,
          --apply_recipe_tint = "primary",
          north_position = util.by_pixel_hr(-63, -255),
          east_position = util.by_pixel_hr(-63, -255),
          south_position = util.by_pixel_hr(-63, -255),
          west_position = util.by_pixel_hr(-63, -255),
          render_layer = "wires",
          animation = {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 20,
            height = 42,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            tint = util.color("b3b3b3"),
            scale = 1.2,
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-inner.png",
              frame_count = 47,
              line_length = 16,
              width = 40,
              height = 84,
              animation_speed = 0.5,
              shift = util.by_pixel(0, -14),
              tint = util.color("b3b3b3"),
              scale = 0.5*1.2,
            } or nil
          }
        },
        {
          always_draw = true,
          apply_recipe_tint = "primary",
          render_layer = "wires",
          animation = {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/stack-patch-overlay.png",
            priority = "extra-high",
            width = 22,
            height = 12,
            shift = util.by_pixel(-30, -123),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-stack-patch-overlay.png",
              priority = "extra-high",
              width = 46,
              height = 25,
              shift = util.by_pixel_hr(-61, -246),
              scale = 0.5,
            } or nil
          }
        }
      }
    },
    {
      type = "item",
      name = "ore-refinery-2",
      icons = angelsmods.functions.add_number_icon_layer(
        {
          {
            icon = "__angelsrefining__/graphics/icons/ore-refinery.png",
            icon_size = 64, icon_mipmaps = 4
          }
        },
        2, angelsmods.refining.number_tint),
      subgroup = "ore-refining",
      order = "b[ore-refinery-2]",
      place_result = "ore-refinery-2",
      stack_size = 10
    },
    {
      type = "assembling-machine",
      name = "ore-refinery-2",
      icons = angelsmods.functions.add_number_icon_layer(
        {
          {
            icon = "__angelsrefining__/graphics/icons/ore-refinery.png",
            icon_size = 64, icon_mipmaps = 4
          }
        },
        2, angelsmods.refining.number_tint),
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 1, result = "ore-refinery-2"},
      fast_replaceable_group = "ore-refinery",
      max_health = 300,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
      selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
      module_specification = {
        module_slots = 2
      },
      allowed_effects = {"consumption", "speed", "pollution", "productivity"},
      crafting_categories = {"ore-refining-t4"},
      crafting_speed = 1.5,
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.03 * 60
      },
      energy_usage = "350kW",
      ingredient_count = 4,
      animation = {
        layers = {
          {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-base.png",
            priority = "extra-high",
            width = 221,
            height = 256,
            shift = util.by_pixel(0, -16),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-base.png",
              priority = "extra-high",
              width = 440,
              height = 509,
              shift = util.by_pixel(0.5, -16),
              scale = 0.5,
            } or nil
          },
          {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-shadow.png",
            priority = "extra-high",
            width = 261,
            height = 170,
            shift = util.by_pixel(22, 30),
            draw_as_shadow = true,
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-shadow.png",
              priority = "extra-high",
              width = 522,
              height = 340,
              shift = util.by_pixel(21.5, 29),
              draw_as_shadow = true,
              scale = 0.5,
            } or nil
          },
        }
      },
      vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
      working_sound = {
        sound = {filename = "__angelsrefining__/sound/ore-refinery.ogg", volume = 0.7},
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
        audible_distance_modifier = 0.5,
        apparent_volume = 2.5
      },
      working_visualisations = {
        {
          fadeout = true,
          effect = "uranium-glow",
          animation = {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/ore-refinery-lights.png",
            priority = "extra-high",
            width = 221,
            height = 256,
            shift = util.by_pixel(0, -16),
            draw_as_glow = true,
            blend_mode = "additive-soft",
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-ore-refinery-lights.png",
              priority = "extra-high",
              width = 440,
              height = 509,
              shift = util.by_pixel(0.5, -16),
              draw_as_glow = true,
              blend_mode = "additive-soft",
              scale = 0.5,
            } or nil
          }
        },
        {
          fadeout = true,
          constant_speed = true,
          apply_recipe_tint = "primary",
          north_position = util.by_pixel_hr(-63, -255),
          east_position = util.by_pixel_hr(-63, -255),
          south_position = util.by_pixel_hr(-63, -255),
          west_position = util.by_pixel_hr(-63, -255),
          render_layer = "wires",
          animation = {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 46,
            height = 94,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            tint = util.color("808080"),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.5,
              shift = util.by_pixel(-2, -40),
              tint = util.color("808080"),
              scale = 0.5
            } or nil
          }
        },
        {
          fadeout = true,
          constant_speed = true,
          --apply_recipe_tint = "primary",
          north_position = util.by_pixel_hr(-63, -255),
          east_position = util.by_pixel_hr(-63, -255),
          south_position = util.by_pixel_hr(-63, -255),
          west_position = util.by_pixel_hr(-63, -255),
          render_layer = "wires",
          animation = {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 20,
            height = 42,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            tint = util.color("b3b3b3"),
            scale = 1.2,
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-smoke-inner.png",
              frame_count = 47,
              line_length = 16,
              width = 40,
              height = 84,
              animation_speed = 0.5,
              shift = util.by_pixel(0, -14),
              tint = util.color("b3b3b3"),
              scale = 0.5*1.2,
            } or nil
          }
        },
        {
          always_draw = true,
          render_layer = "wires",
          animation = {
            filename = "__angelsrefining__/graphics/entity/ore-refinery/stack-patch-overlay.png",
            priority = "extra-high",
            width = 22,
            height = 12,
            shift = util.by_pixel(-30, -123),
            hr_version = angelsmods.trigger.enable_hq_graphics and {
              filename = "__angelsrefining__/graphics/entity/ore-refinery/hr-stack-patch-overlay.png",
              priority = "extra-high",
              width = 46,
              height = 25,
              shift = util.by_pixel_hr(-61, -246),
              scale = 0.5,
            } or nil
          }
        }
      }
    }
  }
)