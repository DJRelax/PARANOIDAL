data:extend(
{
	{
		type = "item",
		name = "solid-uranium-hexafluoride",
		icon = "__Clowns-Processing__/graphics/icons/solid-uranium-hexafluoride.png",
		icon_size = 32,
		subgroup = "clowns-uranium",
		order = "e",
		stack_size = 200,
	},
	{
		type = "item",
		name = "solid-uranium-tetrafluoride",
		icon = "__Clowns-Processing__/graphics/icons/solid-uranium-tetrafluoride.png",
		icon_size = 32,
		subgroup = "clowns-uranium",
		order = "d",
		stack_size = 200,
	},
	{
		type = "item",
		name = "solid-uranium-oxide",
		icon = "__Clowns-Processing__/graphics/icons/solid-uranium-oxide.png",
		icon_size = 32,
		subgroup = "clowns-uranium",
		order = "c",
		stack_size = 200,
	},
	{
		type = "item",
		name = "solid-ammonium-diuranate",
		icon = "__Clowns-Processing__/graphics/icons/solid-ammonium-diuranate.png",
		icon_size = 32,
		subgroup = "clowns-uranium",
		order = "b",
		stack_size = 200,
	},
	{
		type = "item",
		name = "solid-uranyl-nitrate",
		icon = "__Clowns-Processing__/graphics/icons/solid-uranyl-nitrate.png",
		icon_size = 32,
		subgroup = "clowns-uranium",
		order = "a",
		stack_size = 200,
	},
	{
		type = "fluid",
		name = "gas-fluorine",
		icons =  angelsmods.functions.create_gas_fluid_icon({ "__Clowns-Processing__/graphics/icons/fluorine.png", 128 }, "fff"),-- "__Clowns-Processing__/graphics/icons/gas-fluorine.png", --Drd to 128
		--icon_size = 32,
		default_temperature = 25,
		heat_capacity = "0.1KJ",
		base_color = {r = 0.71, g = 0.816, b = 0},
		flow_color = {r = 0.71, g = 0.816, b = 0},
		max_temperature = 100,
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
	},
}
)