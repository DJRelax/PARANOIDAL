data:extend({
  {
    type = "sprite",
    name = "looking-glass",
    filename = "__what-is-it-really-used-for__/graphics/search-icon.png",
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    scale = 1,
  },
  {
    type = "sprite",
    name = "questionmark",
    filename = "__core__/graphics/questionmark.png",
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    scale = 1,
  },
  {
    type = "sprite",
    name = "arrow-right",
    filename = "__core__/graphics/goto-icon.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
    scale = 1,
  },
  {
    type = "sprite",
    name = "arrow-left",
    filename = "__what-is-it-really-used-for__/graphics/arrow_left.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
    scale = 1,
  },
  {
    type = "sprite",
    name = "arrow-bar",
    filename = "__what-is-it-really-used-for__/graphics/arrow_bar.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
    scale = 1,
  },
  {
    type = "sprite",
    name = "arrow-box",
    filename = "__what-is-it-really-used-for__/graphics/arrow_box.png",
    priority = "extra-high-no-scale",
    width = 32,
    height = 32,
    scale = 1,
  },
  {
    type = "sprite",
    name = "close",
    filename = "__what-is-it-really-used-for__/graphics/close.png",
    priority = "extra-high-no-scale",
    width = 64,
    height = 64,
    scale = 1,
  },
  {
  type = "custom-input",
  name = "inspect_item",
  key_sequence = "CONTROL + F",
  consuming = "game-only"

  -- 'consuming'
  -- available options:
  -- none: default if not defined
  -- all: if this is the first input to get this key sequence then no other inputs listening for this sequence are fired
  -- script-only: if this is the first *custom* input to get this key sequence then no other *custom* inputs listening for this sequence are fired. Normal game inputs will still be fired even if they match this sequence.
  -- game-only: The opposite of script-only: blocks game inputs using the same key sequence but lets other custom inputs using the same key sequence fire.
}
})

data.raw["gui-style"].default.small_spacing_scroll_pane_style =
    {
      type = "scroll_pane_style",
      parent = "scroll_pane",
      top_padding  = 2,
      left_padding = 0,
      right_padding = 0
    }
data.raw["gui-style"].default.row_table_style =
    {
      type = "table_style",
      cell_padding = 5,
      horizontal_spacing=0,
      vertical_spacing=0,
      odd_row_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      },
      even_row_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {8, 0}
      }
    }

data.raw["gui-style"].default.wiiuf_hidden_label_style = {
    type = "label_style",
    font = "default",
    font_color = {r=.8, g=.8, b=.8}
}

data.raw["gui-style"].default.wiiuf_frame_unspaced = {
    type = "frame_style",

    top_padding  = 0,
    right_padding = 0,
    bottom_padding = 0,
    left_padding = 0,

    flow_style = {
        type = "flow_style",
        horizontal_spacing = 0,
        vertical_spacing = 0
    },
    horizontal_flow_style =
    {
        type = "horizontal_flow_style",
        horizontal_spacing = 0,
    },
    vertical_flow_style =
    {
        type = "vertical_flow_style",
        vertical_spacing = 0
    },
}

data.raw["gui-style"].default.wiiuf_frame_borderless = {
    type = "frame_style",
    font_color = {r=1, g=1, b=1},

    top_padding  = 0,
    right_padding = 0,
    bottom_padding = 0,
    left_padding = 0,

    title_top_padding = 0,
    title_left_padding = 0,
    title_bottom_padding = 4,
    title_right_padding = 0,

    graphical_set =
    {
        type = "composition",
        filename = "__what-is-it-really-used-for__/graphics/gui.png",
        priority = "extra-high-no-scale",
        load_in_minimal_mode = true,
        corner_size = {1, 1},
        position = {0, 0}
    }
}

data.raw["gui-style"].default.wiiuf_small_slot_button = {
    type = "button_style",
    parent = "slot_button",
    size = 20
}
-- vim:ts=4:sw=4
