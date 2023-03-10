data:extend({
    {
        type = "item",
        name = "JunkTrain",
        icon = "__JunkTrain3__/graphics/junk-train-icon.png",
        icon_size = 32,
        subgroup = "transport",
        order = "a[train-system]-f[JunkTrain]",
        place_result = "JunkTrain",
        stack_size = 5,
    },
	{
		type = "item",
		name = "ScrapTrailer",
		icon = "__JunkTrain3__/graphics/junk-wagon-icon.png",
        icon_size = 32,
		subgroup = "transport",
		order = "a[train-system]-g[ScrapTrailer]",
		place_result = "ScrapTrailer",
		stack_size = 5
	},
	{
		type = "rail-planner",
		name = "scrap-rail",
		icon = "__JunkTrain3__/graphics/icons/rail.png",
        icon_size = 32,
		subgroup = "transport",
		order = "a[train-system]-a[scrap-rail]",
		place_result = "straight-scrap-rail",
		stack_size = 100,
		straight_rail = "straight-scrap-rail",
		curved_rail = "curved-scrap-rail"
	},
	{
		type = "item",
		name = "train-stop-scrap",
		icon = "__base__/graphics/icons/train-stop.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "transport",
		order = "a[train-system]-c[train-stop]",
		place_result = "train-stop-scrap",
		stack_size = 10
	},
	{
		type = "item",
		name = "rail-signal-scrap",
		icon = "__base__/graphics/icons/rail-signal.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "transport",
		order = "a[train-system]-c[rail-signal-scrap]",
		place_result = "rail-signal-scrap",
		stack_size = 10
	},
	{
		type = "item",
		name = "rail-chain-signal-scrap",
		icon = "__base__/graphics/icons/rail-chain-signal.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "transport",
		order = "a[train-system]-c[rail-chain-signal-scrap]",
		place_result = "rail-chain-signal-scrap",
		stack_size = 10
	},
})
