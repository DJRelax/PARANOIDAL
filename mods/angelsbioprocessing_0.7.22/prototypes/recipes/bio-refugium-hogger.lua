data:extend(
  {
    -- HOGGING
    {
      type = "recipe",
      name = "hogger-hogging-1",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {type = "item", name = "bio-hogger-1", amount = 4},
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-1", amount_min = 3, amount_max = 5},
        {type = "item", name = "copper-ore", amount = 10}
      },
      icon = "__angelsbioprocessing__/graphics/icons/hogger-1-icon.png",
      icon_size = 32,
      order = "a"
    },
    {
      type = "recipe",
      name = "hogger-hogging-2",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {type = "item", name = "bio-hogger-2", amount = 4},
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-2", amount_min = 3, amount_max = 5},
        {type = "item", name = "copper-ore", amount = 10}
      },
      icon = "__angelsbioprocessing__/graphics/icons/hogger-2-icon.png",
      icon_size = 32,
      order = "b"
    },
    {
      type = "recipe",
      name = "hogger-hogging-3",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {type = "item", name = "bio-hogger-3", amount = 4},
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-3", amount_min = 3, amount_max = 5},
        {type = "item", name = "copper-ore", amount = 10}
      },
      icon = "__angelsbioprocessing__/graphics/icons/hogger-3-icon.png",
      icon_size = 32,
      order = "c"
    },
    {
      type = "recipe",
      name = "hogger-hogging-4",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {type = "item", name = "bio-hogger-4", amount = 4},
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-4", amount_min = 3, amount_max = 5},
        {type = "item", name = "copper-ore", amount = 10}
      },
      icon = "__angelsbioprocessing__/graphics/icons/hogger-4-icon.png",
      icon_size = 32,
      order = "d"
    },
    {
      type = "recipe",
      name = "hogger-hogging-5",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger",
      enabled = false,
      energy_required = 30,
      ingredients = {
        {type = "item", name = "bio-hogger-5", amount = 4},
        {type = "item", name = "iron-ore", amount = 10},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-5", amount_min = 3, amount_max = 5},
        {type = "item", name = "copper-ore", amount = 10}
      },
      icon = "__angelsbioprocessing__/graphics/icons/hogger-5-icon.png",
      icon_size = 32,
      order = "d"
    },
    -- BREEDING
    {
      type = "recipe",
      name = "hogger-breeding-1",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger-breeding",
      enabled = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-1", amount = 2},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-1", amount = 2},
        {type = "item", name = "bio-hogger-1", amount = 1, probability = 0.5},
        {type = "item", name = "bio-hogger-2", amount = 1, probability = 0.1},
        {type = "item", name = "bio-hogger-3", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-4", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-5", amount = 1, probability = 0.05}
      },
      icons = {
        {
          icon = "__angelsbioprocessing__/graphics/icons/breeding.png"
        },
        {
          icon = "__angelsbioprocessing__/graphics/icons/hogger-1-icon.png"
        }
      },
      icon_size = 32,
      order = "a"
    },
    {
      type = "recipe",
      name = "hogger-breeding-2",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger-breeding",
      enabled = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-2", amount = 2},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-2", amount = 2},
        {type = "item", name = "bio-hogger-1", amount = 1, probability = 0.5},
        {type = "item", name = "bio-hogger-2", amount = 1, probability = 0.1},
        {type = "item", name = "bio-hogger-3", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-4", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-5", amount = 1, probability = 0.05}
      },
      icons = {
        {
          icon = "__angelsbioprocessing__/graphics/icons/breeding.png"
        },
        {
          icon = "__angelsbioprocessing__/graphics/icons/hogger-2-icon.png"
        }
      },
      icon_size = 32,
      order = "b"
    },
    {
      type = "recipe",
      name = "hogger-breeding-3",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger-breeding",
      enabled = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-3", amount = 2},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-3", amount = 2},
        {type = "item", name = "bio-hogger-1", amount = 1, probability = 0.5},
        {type = "item", name = "bio-hogger-2", amount = 1, probability = 0.1},
        {type = "item", name = "bio-hogger-3", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-4", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-5", amount = 1, probability = 0.05}
      },
      icons = {
        {
          icon = "__angelsbioprocessing__/graphics/icons/breeding.png"
        },
        {
          icon = "__angelsbioprocessing__/graphics/icons/hogger-3-icon.png"
        }
      },
      icon_size = 32,
      order = "c"
    },
    {
      type = "recipe",
      name = "hogger-breeding-4",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger-breeding",
      enabled = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-4", amount = 2},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-4", amount = 2},
        {type = "item", name = "bio-hogger-1", amount = 1, probability = 0.5},
        {type = "item", name = "bio-hogger-2", amount = 1, probability = 0.1},
        {type = "item", name = "bio-hogger-3", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-4", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-5", amount = 1, probability = 0.05}
      },
      icons = {
        {
          icon = "__angelsbioprocessing__/graphics/icons/breeding.png"
        },
        {
          icon = "__angelsbioprocessing__/graphics/icons/hogger-4-icon.png"
        }
      },
      icon_size = 32,
      order = "d"
    },
    {
      type = "recipe",
      name = "hogger-breeding-5",
      category = "bio-refugium-hogger",
      subgroup = "bio-hogger-breeding",
      enabled = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-5", amount = 2},
        {type = "item", name = "iron-plate", amount = 1},
        {type = "fluid", name = "liquid-nutrient-pulp", amount = 20}
      },
      results = {
        {type = "item", name = "bio-hogger-5", amount = 2},
        {type = "item", name = "bio-hogger-1", amount = 1, probability = 0.5},
        {type = "item", name = "bio-hogger-2", amount = 1, probability = 0.1},
        {type = "item", name = "bio-hogger-3", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-4", amount = 1, probability = 0.05},
        {type = "item", name = "bio-hogger-5", amount = 1, probability = 0.05}
      },
      icons = {
        {
          icon = "__angelsbioprocessing__/graphics/icons/breeding.png"
        },
        {
          icon = "__angelsbioprocessing__/graphics/icons/hogger-5-icon.png"
        }
      },
      icon_size = 32,
      order = "d"
    },
    -- BUTCHERY
    {
      type = "recipe",
      name = "hogger-butchery-1",
      category = "bio-butchery",
      subgroup = "bio-hogger-butchery",
      enabled = false,
      hidden = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-1", amount = 1}
      },
      results = {
        {type = "item", name = "bio-raw-meat", amount = 1}
      },
      icon = "__angelsbioprocessing__/graphics/icons/raw-meat.png",
      icon_size = 32,
      order = "a"
    },
    {
      type = "recipe",
      name = "hogger-butchery-2",
      category = "bio-butchery",
      subgroup = "bio-hogger-butchery",
      enabled = false,
      hidden = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-2", amount = 1}
      },
      results = {
        {type = "item", name = "bio-raw-meat", amount = 1}
      },
      icon = "__angelsbioprocessing__/graphics/icons/raw-meat.png",
      icon_size = 32,
      order = "b"
    },
    {
      type = "recipe",
      name = "hogger-butchery-3",
      category = "bio-butchery",
      subgroup = "bio-hogger-butchery",
      enabled = false,
      hidden = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-3", amount = 1}
      },
      results = {
        {type = "item", name = "bio-raw-meat", amount = 1}
      },
      icon = "__angelsbioprocessing__/graphics/icons/raw-meat.png",
      icon_size = 32,
      order = "c"
    },
    {
      type = "recipe",
      name = "hogger-butchery-4",
      category = "bio-butchery",
      subgroup = "bio-hogger-butchery",
      enabled = false,
      hidden = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-4", amount = 1}
      },
      results = {
        {type = "item", name = "bio-raw-meat", amount = 1}
      },
      icon = "__angelsbioprocessing__/graphics/icons/raw-meat.png",
      icon_size = 32,
      order = "d"
    },
    {
      type = "recipe",
      name = "hogger-butchery-5",
      category = "bio-butchery",
      subgroup = "bio-hogger-butchery",
      enabled = false,
      hidden = false,
      energy_required = 60,
      ingredients = {
        {type = "item", name = "bio-hogger-5", amount = 1}
      },
      results = {
        {type = "item", name = "bio-raw-meat", amount = 1}
      },
      icon = "__angelsbioprocessing__/graphics/icons/raw-meat.png",
      icon_size = 32,
      order = "d"
    }
  }
)