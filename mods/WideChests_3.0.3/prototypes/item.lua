local mergeTool =
{
	type = "selection-tool",
	name = "merge-chest-selector",
	icon = "__WideChests__/graphics/icons/merge-chest-selector.png",
	icon_size = 32,
	subgroup = "tool",
	order = "c[automated-construction]-a[merge-chest]",
	stack_size = 1,
	stackable = false,
	draw_label_for_cursor_render = true,
	selection_color = { r = 0, g = 0, b = 1 },
	alt_selection_color = { r = 1, g = 0, b = 0 },
	selection_mode = { "buildable-type" },
	alt_selection_mode = { "buildable-type" },
	selection_cursor_box_type = "entity",
	alt_selection_cursor_box_type = "entity",
	entity_filters = MergingChests.MergableChestIds,
	alt_entity_type_filters = 
	{
		"container"
	}
}

if settings.startup["shortcut-tool"].value then
	mergeTool.flags = { "only-in-cursor" }
else
	mergeTool.show_in_library = true
end

data:extend({ mergeTool })