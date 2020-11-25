require "tab.AbstractTab"
-------------------------------------------------------------------------------
-- Class to build tab
--
-- @module ProductionBlockTab
-- @extends #AbstractTab
--

ProductionBlockTab = newclass(AbstractTab,function(base,classname)
  AbstractTab.init(base,classname)
end)

-------------------------------------------------------------------------------
-- Return button caption
--
-- @function [parent=#ProductionBlockTab] getButtonCaption
--
-- @return #string
--
function ProductionBlockTab:getButtonCaption()
  return {"helmod_result-panel.tab-button-production-block"}
end

-------------------------------------------------------------------------------
-- Is visible
--
-- @function [parent=#ProductionBlockTab] isVisible
--
-- @return boolean
--
function ProductionBlockTab:isVisible()
  return false
end

-------------------------------------------------------------------------------
-- Has index model (for Tab panel)
--
-- @function [parent=#ProductionBlockTab] hasIndexModel
--
-- @return #boolean
--
function ProductionBlockTab:hasIndexModel()
  return false
end

-------------------------------------------------------------------------------
-- Before update
--
-- @function [parent=#ProductionBlockTab] beforeUpdate
--
-- @param #LuaEvent event
--
function ProductionBlockTab:beforeUpdate(event)
end

-------------------------------------------------------------------------------
-- Update info
--
-- @function [parent=#ProductionBlockTab] updateInfo
--
-- @param #LuaEvent event
--
function ProductionBlockTab:updateInfo(event)
  local model = Model.getModel()
  -- data
  local current_block = User.getParameter("current_block") or "new"

  local countRecipes = Model.countBlockRecipes(current_block)

  local options_scroll, info_scroll, output_scroll, input_scroll = self:getInfoPanel2()
  options_scroll.clear()
  info_scroll.clear()
  -- info panel

  local block_table = GuiElement.add(info_scroll, GuiTable("output-table"):column(4))
  block_table.style.horizontally_stretchable = false
  block_table.vertical_centering = false
  block_table.style.horizontal_spacing=10

  -- production block result
  if countRecipes > 0 then

    local element = model.blocks[current_block]

    -- block panel
    GuiElement.add(block_table, GuiCellBlockInfo("block-count"):element(element):tooltip("tooltip.info-block"):color(GuiElement.color_button_default):index(1):byLimit(element.by_limit))
    GuiElement.add(block_table, GuiCellEnergy("block-power"):element(element):tooltip("tooltip.info-block"):color(GuiElement.color_button_default):index(2):byLimit(element.by_limit))
    if User.getPreferenceSetting("display_pollution") then
      GuiElement.add(block_table, GuiCellPollution("block-pollution"):element(element):tooltip("tooltip.info-block"):color(GuiElement.color_button_default):index(3):byLimit(element.by_limit))
    end
    if User.getPreferenceSetting("display_building") then
      GuiElement.add(block_table, GuiCellBuilding("block-building"):element(element):tooltip("tooltip.info-building"):color(GuiElement.color_button_default):index(4):byLimit(element.by_limit))
    end

    local unlink_state = "right"
    if element.unlinked == true then unlink_state = "left" end
    local unlink_switch = GuiElement.add(options_scroll, GuiSwitch(self.classname, "block-switch-unlink", current_block):state(unlink_state):leftLabel({"helmod_label.block-unlinked"}):rightLabel({"helmod_label.block-linked"}))
    if element.index == 0 then
      unlink_switch.enabled = false
      unlink_switch.tooltip = {"tooltip.block-cannot-link-first"}
    end
    if element.by_factory == true then
      unlink_switch.enabled = false
      unlink_switch.tooltip = {"tooltip.block-cannot-link-by-factory"}
    end

    -- local block_compunting = GuiElement.add(options_scroll, GuiFlowH("block-computing"))
    -- GuiElement.add(block_compunting, GuiLabel("block-label"):caption("Computing"))
    -- local default_compunting = ""
    -- local items = {}
    -- table.insert(items,"by_element")
    -- table.insert(items,"by_factory")
    -- table.insert(items,"Matrix Solver")
    -- GuiElement.add(block_compunting, GuiDropDown(self.classname, "change-computing", model_id):items(items, default_compunting))

    local element_state = "left"
    if element.by_product == false then element_state = "right" end
    GuiElement.add(options_scroll, GuiSwitch(self.classname, "block-switch-element", current_block):state(element_state):leftLabel({"helmod_label.input-product"}):rightLabel({"helmod_label.input-ingredient"}))

    local by_factory_state = "left"
    if element.by_factory == true then by_factory_state = "right" end
    local by_factory_switch = GuiElement.add(options_scroll, GuiSwitch(self.classname, "block-switch-factory", current_block):state(by_factory_state):leftLabel({"helmod_label.compute-by-element"}):rightLabel({"helmod_label.compute-by-factory"}))
    if element.solver == true then
      by_factory_switch.enabled = false
      by_factory_switch.tooltip = {"tooltip.block-cannot-by-factory"}
    end

    local matrix_solver = "left"
    if element.solver == true then matrix_solver = "right" end
    local solver_switch = GuiElement.add(options_scroll, GuiSwitch(self.classname, "block-switch-solver", current_block):state(matrix_solver):leftLabel({"helmod_label.algebraic-solver"}):rightLabel({"helmod_label.matrix-solver"}))
    if element.by_factory == true then
      solver_switch.enabled = false
      solver_switch.tooltip = {"tooltip.block-cannot-matrix-solver"}
    end

    local block_limit = "right"
    if element.by_limit == true then block_limit = "left" end
    local block_switch_limit = GuiElement.add(options_scroll, GuiFlowH("block-switch"))
    block_switch_limit.style.horizontal_spacing=10
    GuiElement.add(block_switch_limit, GuiLabel("block-label-limit"):caption({"helmod_label.assembler-limitation"}))
    GuiElement.add(block_switch_limit, GuiSwitch(self.classname, "block-switch-limit", current_block):state(block_limit):leftLabel({"gui.on"}):rightLabel({"gui.off"}))

  end
end

-------------------------------------------------------------------------------
-- Update header
--
-- @function [parent=#ProductionBlockTab] updateInput
--
-- @param #LuaEvent event
--
function ProductionBlockTab:updateInput(event)
  local model = Model.getModel()
  -- data
  local current_block = User.getParameter("current_block") or "new"
  local block = model.blocks[current_block]
  local block_by_product = not(block ~= nil and block.by_product == false)

  local countRecipes = Model.countBlockRecipes(current_block)

  local left_label, left_tool, left_scroll = self:getLeftInfoPanel2()
  local right_label, right_tool, right_scroll = self:getRightInfoPanel2()

  local input_label = right_label
  local input_tool = right_tool
  local input_scroll = right_scroll
  if not(block_by_product) then
    input_label = left_label
    input_scroll = left_scroll
    input_tool = left_tool
  end

  input_tool.clear()
  local all_visible = User.getParameter("block_all_ingredient_visible")
  local style_visible = "helmod_button_menu_sm"
  if all_visible == true then
    style_visible = "helmod_button_menu_sm_selected"
  end
  GuiElement.add(input_tool, GuiButton(self.classname, "block-all-ingredient-visible", current_block):sprite("menu", "filter-white-sm", "filter-sm"):style(style_visible):tooltip({"helmod_button.all-product-visible"}))
  --GuiElement.add(input_tool, GuiSwitch(self.classname, "block-switch-product-visible", current_block):state(by_factory_state):leftLabel({"helmod_label.visible-main-product"}):rightLabel({"helmod_label.visible-other-product"}))

  -- input panel
  input_label.caption = {"helmod_common.input"}
  input_scroll.clear()

  -- production block result
  if countRecipes > 0 then

    -- input panel
    local input_table = GuiElement.add(input_scroll, GuiTable("input-table"):column(GuiElement.getElementColumnNumber(50)-2):style("helmod_table_element"))
    if block.ingredients ~= nil then
      for index, lua_ingredient in spairs(block.ingredients, User.getProductSorter2()) do
        if all_visible == true or ((lua_ingredient.state or 0) == 1 and not(block_by_product)) or (lua_ingredient.count or 0) > ModelCompute.waste_value then
          local contraint_type = nil
          local ingredient = Product(lua_ingredient):clone()
          ingredient.count = lua_ingredient.count
          if block.count > 1 then
            ingredient.limit_count = lua_ingredient.count / block.count
          end
          local button_action = "production-recipe-ingredient-add"
          local button_tooltip = "tooltip.ingredient"
          local button_color = GuiElement.color_button_default_ingredient
          local control_info = "link-intermediate"
          if block_by_product then
            button_action = "production-recipe-ingredient-add"
            button_tooltip = "tooltip.add-recipe"
            control_info = nil
          else
            button_action = "product-edition"
            button_tooltip = "tooltip.edit-product"
          end
          -- color
          if lua_ingredient.state == 1 then
            if not(block.unlinked) or block.by_factory == true then
              button_color = GuiElement.color_button_default_ingredient
              if block.products_linked ~= nil and block.products_linked[lua_ingredient.name] then
                contraint_type = "linked"
              end
            else
              button_color = GuiElement.color_button_edit
            end
          elseif lua_ingredient.state == 3 then
            button_color = GuiElement.color_button_rest
          else
            button_color = GuiElement.color_button_default_ingredient
          end
          GuiElement.add(input_table, GuiCellElementM(self.classname, button_action, block.id, "none"):element(ingredient):tooltip(button_tooltip):index(index):color(button_color):byLimit(block.by_limit):contraintIcon(contraint_type):controlInfo(control_info))
        end
      end
    end

  end
end

-------------------------------------------------------------------------------
-- Update header
--
-- @function [parent=#ProductionBlockTab] updateOutput
--
-- @param #LuaEvent event
--
function ProductionBlockTab:updateOutput(event)
  local model = Model.getModel()
  -- data
  local current_block = User.getParameter("current_block") or "new"
  local block = model.blocks[current_block]
  local block_by_product = not(block ~= nil and block.by_product == false)

  local countRecipes = Model.countBlockRecipes(current_block)

  local left_label, left_tool, left_scroll = self:getLeftInfoPanel2()
  local right_label, right_tool, right_scroll = self:getRightInfoPanel2()

  local output_label = left_label
  local output_tool = left_tool
  local output_scroll = left_scroll
  if not(block_by_product) then
    output_label = right_label
    output_scroll = right_scroll
    output_tool = right_tool
  end
  output_tool.clear()
  local all_visible = User.getParameter("block_all_product_visible")
  local style_visible = "helmod_button_menu_sm"
  if all_visible == true then
    style_visible = "helmod_button_menu_sm_selected"
  end
  GuiElement.add(output_tool, GuiButton(self.classname, "block-all-product-visible", current_block):sprite("menu", "filter-white-sm", "filter-sm"):style(style_visible):tooltip({"helmod_button.all-product-visible"}))
  --GuiElement.add(output_tool, GuiSwitch(self.classname, "block-switch-product-visible", current_block):state(by_factory_state):leftLabel({"helmod_label.visible-main-product"}):rightLabel({"helmod_label.visible-other-product"}))

  -- ouput panel
  output_label.caption = {"helmod_common.output"}
  output_scroll.clear()

  -- production block result
  if countRecipes > 0 then

    -- ouput panel
    local output_table = GuiElement.add(output_scroll, GuiTable("output-table"):column(GuiElement.getElementColumnNumber(50)-2):style("helmod_table_element"))
    if block.products ~= nil then
      for index, lua_product in spairs(block.products, User.getProductSorter2()) do
        if all_visible == true or ((lua_product.state or 0) == 1 and block_by_product) or (lua_product.count or 0) > ModelCompute.waste_value then
          local contraint_type = nil
          local product = Product(lua_product):clone()
          product.count = lua_product.count
          if block.count > 1 then
            product.limit_count = lua_product.count / block.count
          end
          local button_action = "production-recipe-product-add"
          local button_tooltip = "tooltip.product"
          local button_color = GuiElement.color_button_default_product
          local control_info = "link-intermediate"
          if not(block_by_product) then
            button_action = "production-recipe-product-add"
            button_tooltip = "tooltip.add-recipe"
            control_info = nil
          else
            if not(block.unlinked) or block.by_factory == true then
              button_action = "product-info"
              button_tooltip = "tooltip.info-product"
              if block.products_linked ~= nil and block.products_linked[lua_product.name] then
                contraint_type = "linked"
              end
            else
              button_action = "product-edition"
              button_tooltip = "tooltip.edit-product"
            end
          end
          -- color
          if lua_product.state == 1 then
            if not(block.unlinked) or block.by_factory == true then
              button_color = GuiElement.color_button_default_product
            else
              button_color = GuiElement.color_button_edit
            end
          elseif lua_product.state == 3 then
            button_color = GuiElement.color_button_rest
          else
            button_color = GuiElement.color_button_default_product
          end
          GuiElement.add(output_table, GuiCellElementM(self.classname, button_action, block.id, "none"):element(product):tooltip(button_tooltip):index(index):color(button_color):byLimit(block.by_limit):contraintIcon(contraint_type):controlInfo(control_info))
        end
      end
    end
  end
end

-------------------------------------------------------------------------------
-- Update data
--
-- @function [parent=#ProductionBlockTab] updateData
--
-- @param #LuaEvent event
--
function ProductionBlockTab:updateData(event)
  local model = Model.getModel()
  local current_block = User.getParameter("current_block") or "new"

  self:updateInfo(event)

  self:updateOutput(event)

  self:updateInput(event)

  -- data panel
  local header_panel1, header_panel2,scroll_panel1, scroll_panel2 = self:getResultScrollPanel2()

  local back_button = GuiElement.add(header_panel1, GuiButton(self.classname, "change-tab", "HMProductionLineTab"):style("back_button"):caption("Back"))
  back_button.style.width = 70

  local recipe_table = GuiElement.add(scroll_panel1, GuiTable("recipe-data"):column(1):style("helmod_table_list"))
  recipe_table.vertical_centering = false

  local last_element = nil
  -- col recipe
  local color = "gray"
  local cell_recipe = GuiElement.add(recipe_table, GuiTable("recipe-new"):column(1):style("helmod_table_list"))
  if current_block == "new" then
    last_element = cell_recipe
    color = "orange"
  end
  local block_new = {name = "helmod_button_menu_flat", hovered = "robot-white", sprite = "robot", count = 0, localised_name = "helmod_result-panel.add-button-production-block"}
  GuiElement.add(cell_recipe, GuiCellProduct(self.classname, "change-tab", "HMProductionBlockTab", "new"):element(block_new):tooltip("tooltip.edit-block"):color(color))

  for _, block in spairs(model.blocks, function(t,a,b) return t[b]["index"] > t[a]["index"] end) do
    -- col recipe
    local color = "gray"
    local cell_recipe = GuiElement.add(recipe_table, GuiTable("recipe", block.id):column(1):style("helmod_table_list"))
    if current_block == block.id then
      last_element = cell_recipe
      color = "orange"
    end
    GuiElement.add(cell_recipe, GuiCellBlock(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(block):tooltip("tooltip.edit-block"):color(color))
  end
  if last_element ~= nil then
    scroll_panel1.scroll_to_element(last_element)
  end

  local countRecipes = Model.countBlockRecipes(current_block)
  -- production block result
  if countRecipes > 0 then

    local elements = model.blocks[current_block]
    -- data panel

    local extra_cols = 0
    if User.getPreferenceSetting("display_pollution") then
      extra_cols = extra_cols + 1
    end
    if User.getModGlobalSetting("display_hidden_column") == "All" then
      extra_cols = extra_cols + 2
    end
    if User.getModGlobalSetting("display_hidden_column") ~= "None" then
      extra_cols = extra_cols + 2
    end

    local result_table = GuiElement.add(scroll_panel2, GuiTable("list-data"):column(7 + extra_cols):style("helmod_table_result"))
    result_table.vertical_centering = false
    self:addTableHeader(result_table)

    local sorter = function(t,a,b) return t[b]["index"] > t[a]["index"] end
    if elements.by_product == false then sorter = function(t,a,b) return t[b]["index"] < t[a]["index"] end end
    local last_element = nil
    for _, recipe in spairs(elements.recipes, sorter) do
      local recipe_cell = self:addTableRowRecipe(result_table, elements, recipe)
      if User.getParameter("scroll_element") == recipe.id then last_element = recipe_cell end
    end

    if last_element ~= nil then
      scroll_panel2.scroll_to_element(last_element)
      User.setParameter("scroll_element", nil)
    end

  end
end

-------------------------------------------------------------------------------
-- Build Navigator
--
-- @function [parent=#ProductionBlockTab] bluidNavigator
--
function ProductionBlockTab:bluidNavigator(scroll_panel1, current_block)
  local model = Model.getModel()
  local tree_panel = GuiElement.add(scroll_panel1, GuiTable("tree"):column(1):style("helmod_table_list"))
  tree_panel.vertical_centering = false

  local last_element = nil
  -- col recipe
  local color = "gray"
  local cell_recipe = GuiElement.add(tree_panel, GuiTable("recipe-new"):column(1):style("helmod_table_list"))
  if current_block == "new" then
    last_element = cell_recipe
    color = "orange"
  end

  -- bluid tree
  local root_block = model.blocks[model.root_block]
  if root_block ~= nil then
    self:bluidLeaf(tree_panel, root_block, current_block, 0)
    self:bluidTree(tree_panel, root_block, current_block, 1)
    if last_element ~= nil then
      scroll_panel1.scroll_to_element(last_element)
    end
  end
end

-------------------------------------------------------------------------------
-- Build Tree
--
-- @function [parent=#ProductionBlockTab] bluidTree
--
function ProductionBlockTab:bluidTree(tree_panel, block, current_block, level)
  if block ~= nil and block.children ~= nil then
    local model = Model.getModel()
  
    for _, children in spairs(block.children, function(t,a,b) return t[b]["index"] > t[a]["index"] end) do
      if children.type == "block" then
        local children_block = model.blocks[children.id]
        self:bluidLeaf(tree_panel, children_block, current_block, level)
        self:bluidTree(tree_panel, children_block, current_block, level + 1)
      end
    end
  end
end

-------------------------------------------------------------------------------
-- Build Tree
--
-- @function [parent=#ProductionBlockTab] bluidTree
--
function ProductionBlockTab:bluidLeaf(tree_panel, block, current_block, level)
  if block ~= nil then
      local color = "gray"
      local cell_tree = GuiElement.add(tree_panel, GuiTable("recipe", block.id):column(1):style("helmod_table_list"))
      if current_block == block.id then
        --last_element = cell_tree
        color = "orange"
      end
      if block.name == nil then
        local cell_block = GuiElement.add(cell_tree, GuiButton(self.classname, "change-tab", "HMProductionBlockTab", block.id):sprite("menu", "hangar-white", "hangar"):style("helmod_button_menu"):tooltip("tooltip.edit-block"))
      else
        local cell_block = GuiElement.add(cell_tree, GuiCellBlock(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(block):tooltip("tooltip.edit-block"):color(color))
        cell_block.style.left_padding = 10 * level
      end
  end
end

-------------------------------------------------------------------------------
-- Add table header
--
-- @function [parent=#ProductionBlockTab] addTableHeader
--
-- @param #LuaGuiElement itable container for element
--
function ProductionBlockTab:addTableHeader(itable)
  self:addCellHeader(itable, "action", {"helmod_result-panel.col-header-action"})
  -- optionnal columns
  if User.getModGlobalSetting("display_hidden_column") == "All" then
    self:addCellHeader(itable, "index", {"helmod_result-panel.col-header-index"},"index")
    self:addCellHeader(itable, "id", {"helmod_result-panel.col-header-id"},"id")
  end
  if User.getModGlobalSetting("display_hidden_column") ~= "None" then
    self:addCellHeader(itable, "name", {"helmod_result-panel.col-header-name"},"name")
    self:addCellHeader(itable, "type", {"helmod_result-panel.col-header-type"},"type")
  end
  -- data columns
  self:addCellHeader(itable, "recipe", {"helmod_result-panel.col-header-recipe"},"index")
  self:addCellHeader(itable, "energy", {"helmod_common.energy-consumption"},"energy_total")
  if User.getPreferenceSetting("display_pollution") then
    self:addCellHeader(itable, "pollution", {"helmod_common.pollution"})
  end
  self:addCellHeader(itable, "factory", {"helmod_result-panel.col-header-factory"})
  self:addCellHeader(itable, "beacon", {"helmod_result-panel.col-header-beacon"})
  for _,order in pairs(Model.getBlockOrder()) do
    if order == "products" then
      self:addCellHeader(itable, "products", {"helmod_result-panel.col-header-products"})
    else
      self:addCellHeader(itable, "ingredients", {"helmod_result-panel.col-header-ingredients"})
    end
  end
end

-------------------------------------------------------------------------------
-- Add table row
--
-- @function [parent=#ProductionBlockTab] addTableRowCommon
--
-- @param #LuaGuiElement gui_table
-- @param #table block
--

function ProductionBlockTab:addTableRowCommon(gui_table, element)
  if User.getModGlobalSetting("display_hidden_column") == "All" then
    -- col index
    GuiElement.add(gui_table, GuiLabel("value_index", element.id):caption(element.index))
    -- col id
    GuiElement.add(gui_table, GuiLabel("value_id", element.id):caption(element.id))
  end
  if User.getModGlobalSetting("display_hidden_column") ~= "None" then
    -- col name
    GuiElement.add(gui_table, GuiLabel("value_name", element.id):caption(element.name))
    -- col type
    GuiElement.add(gui_table, GuiLabel("value_type", element.id):caption(element.type))
  end
end
-------------------------------------------------------------------------------
-- Add table row
--
-- @function [parent=#ProductionBlockTab] addTableRowRecipe
--
-- @param #LuaGuiElement gui_table
-- @param #table block
-- @param #table recipe production recipe
--
function ProductionBlockTab:addTableRowRecipe(gui_table, block, recipe)
  local recipe_prototype = RecipePrototype(recipe)
  --local lua_recipe = RecipePrototype(recipe):native()

  -- col action
  local cell_action = GuiElement.add(gui_table, GuiTable("action", recipe.id):column(2):style("helmod_table_list"))
  if block.by_product == false then
    -- by ingredient
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-down", block.id, recipe.id):sprite("menu", "arrow-up-white-sm", "arrow-up-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.up-element", User.getModSetting("row_move_step")}))
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-remove", block.id, recipe.id):sprite("menu", "delete-white-sm", "delete-sm"):style("helmod_button_menu_sm_red"):tooltip({"tooltip.remove-element"}))
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-up", block.id, recipe.id):sprite("menu", "arrow-down-white-sm", "arrow-down-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.down-element", User.getModSetting("row_move_step")}))
  else
    -- by product
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-up", block.id, recipe.id):sprite("menu", "arrow-up-white-sm", "arrow-up-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.up-element", User.getModSetting("row_move_step")}))
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-remove", block.id, recipe.id):sprite("menu", "delete-white-sm", "delete-sm"):style("helmod_button_menu_sm_red"):tooltip({"tooltip.remove-element"}))
    GuiElement.add(cell_action, GuiButton(self.classname, "production-recipe-down", block.id, recipe.id):sprite("menu", "arrow-down-white-sm", "arrow-down-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.down-element", User.getModSetting("row_move_step")}))
  end
  
  -- common cols
  self:addTableRowCommon(gui_table, recipe)
  -- col recipe
  --  local production = recipe.production or 1
  --  local production_label = Format.formatPercent(production).."%"
  --  if block.solver == true then production_label = "" end
  local cell_recipe = GuiElement.add(gui_table, GuiTable("recipe", recipe.id):column(2):style("helmod_table_list"))
  GuiElement.add(cell_recipe, GuiCellRecipe("HMRecipeEdition", "OPEN", block.id, recipe.id):element(recipe):infoIcon(recipe.type):tooltip("tooltip.edit-recipe"):color(GuiElement.color_button_default):broken(recipe_prototype:native() == nil):byLimit(block.by_limit))
  if recipe_prototype:native() == nil then
    Player.print("ERROR: Recipe ".. recipe.name .." not exist in game")
  end
  -- col energy
  local cell_energy = GuiElement.add(gui_table, GuiTable("energy", recipe.id):column(2):style("helmod_table_list"))
  GuiElement.add(cell_energy, GuiCellEnergy("HMRecipeEdition", "OPEN", block.id, recipe.id):element(recipe):tooltip("tooltip.edit-recipe"):color(GuiElement.color_button_default):byLimit(block.by_limit))

  -- col pollution
  if User.getPreferenceSetting("display_pollution") then
    local cell_pollution = GuiElement.add(gui_table, GuiTable("pollution", recipe.id):column(2):style("helmod_table_list"))
    GuiElement.add(cell_pollution, GuiCellPollution("HMRecipeEdition", "OPEN", block.id, recipe.id):element(recipe):tooltip("tooltip.edit-recipe"):color(GuiElement.color_button_default):byLimit(block.by_limit))
  end
  
  -- col factory
  local factory = recipe.factory
  local cell_factory = GuiElement.add(gui_table, GuiTable("factory", recipe.id):column(2):style("helmod_table_list"))
  local gui_cell_factory = GuiCellFactory(self.classname, "factory-action", block.id, recipe.id):element(factory):tooltip("tooltip.edit-recipe"):color(GuiElement.color_button_default):byLimit(block.by_limit):controlInfo("crafting-add")
  if block.by_limit == true then
    gui_cell_factory:byLimitUri(self.classname, "update-factory-limit", block.id, recipe.id)
  end
  if block.by_factory == true then
    gui_cell_factory:byFactory(self.classname, "update-factory-number", block.id, recipe.id)
  end
  GuiElement.add(cell_factory, gui_cell_factory)

  -- col beacon
  local beacon = recipe.beacon
  local cell_beacon = GuiElement.add(gui_table, GuiTable("beacon", recipe.id):column(2):style("helmod_table_list"))
  local gui_cell_beacon = GuiCellFactory(self.classname, "beacon-action", block.id, recipe.id):element(beacon):tooltip("tooltip.edit-recipe"):color(GuiElement.color_button_default):byLimit(block.by_limit):controlInfo("crafting-add")
  GuiElement.add(cell_beacon, gui_cell_beacon)

  for _,order in pairs(Model.getBlockOrder()) do
    if order == "products" then
      -- products
      local display_product_cols = User.getPreferenceSetting("display_product_cols")
      local cell_products = GuiElement.add(gui_table, GuiTable("products", recipe.id):column(display_product_cols):style("helmod_table_list"))
      for index, lua_product in spairs(recipe_prototype:getProducts(recipe.factory), User.getProductSorter()) do
        local contraint_type = nil
        local product_prototype = Product(lua_product)
        local product = product_prototype:clone()
        product.count = product_prototype:countProduct(recipe)
        if block.count > 1 then
          product.limit_count = product.count / block.count
        end
        if block.by_product ~= false and recipe.contraint ~= nil and recipe.contraint.name == product.name then
          contraint_type = recipe.contraint.type
        end
        local control_info = "contraint"
        if not(block.solver ~= true and block.by_product ~= false) then
          control_info = nil
        end
        GuiElement.add(cell_products, GuiCellElement(self.classname, "production-recipe-product-add", block.id, recipe.id):element(product):tooltip("tooltip.add-recipe"):index(index):byLimit(block.by_limit):contraintIcon(contraint_type):controlInfo(control_info))
      end
    else
      -- ingredients
      local display_ingredient_cols = User.getPreferenceSetting("display_ingredient_cols")
      local cell_ingredients = GuiElement.add(gui_table, GuiTable("ingredients_", recipe.id):column(display_ingredient_cols):style("helmod_table_list"))
      for index, lua_ingredient in spairs(recipe_prototype:getIngredients(recipe.factory), User.getProductSorter()) do
        local contraint_type = nil
        local ingredient_prototype = Product(lua_ingredient)
        local ingredient = ingredient_prototype:clone()
        ingredient.count = ingredient_prototype:countIngredient(recipe)
        -- si constant compte comme un produit (recipe rocket)
        if ingredient.constant == true then
          ingredient.count = ingredient_prototype:countProduct(recipe)
        end
        if block.count > 1 then
          ingredient.limit_count = ingredient.count / block.count
        end
        if block.by_product == false and recipe.contraint ~= nil and recipe.contraint.name == ingredient.name then
          contraint_type = recipe.contraint.type
        end
        local control_info = "contraint"
        if not(block.solver ~= true and block.by_product == false) then
          control_info = nil
        end
        GuiElement.add(cell_ingredients, GuiCellElement(self.classname, "production-recipe-ingredient-add", block.id, recipe.id):element(ingredient):tooltip("tooltip.add-recipe"):color(GuiElement.color_button_add):index(index):byLimit(block.by_limit):contraintIcon(contraint_type):controlInfo(control_info))
      end
    end
  end

  return cell_recipe
end

-------------------------------------------------------------------------------
-- Add row data tab
--
-- @function [parent=#ProductionBlockTab] addTableRowBlock
--
-- @param #LuaGuiElement gui_table
-- @param #table block production block
--
function ProductionBlockTab:addTableRowBlock(gui_table, block)
  local unlinked = block.unlinked and true or false
  if block.index == 0 then unlinked = true end
  local block_by_product = not(block ~= nil and block.by_product == false)
  block.type = "recipe"
  -- col action
  local cell_action = GuiElement.add(gui_table, GuiTable("action", block.id):column(2))

  GuiElement.add(cell_action, GuiButton(self.classname, "production-block-up", block.id):sprite("menu", "arrow-up-white-sm", "arrow-up-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.up-element", User.getModSetting("row_move_step")}))
  GuiElement.add(cell_action, GuiButton(self.classname, "production-block-remove", block.id):sprite("menu", "delete-white-sm", "delete-sm"):style("helmod_button_menu_sm_red"):tooltip({"tooltip.remove-element"}))
  GuiElement.add(cell_action, GuiButton(self.classname, "production-block-down", block.id):sprite("menu", "arrow-down-white-sm", "arrow-down-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.down-element", User.getModSetting("row_move_step")}))
  if unlinked then
    GuiElement.add(cell_action, GuiButton(self.classname, "production-block-unlink", block.id):sprite("menu", "unlink-white-sm", "unlink-sm"):style("helmod_button_menu_sm"):tooltip({"tooltip.unlink-element"}))
  else
    GuiElement.add(cell_action, GuiButton(self.classname, "production-block-unlink", block.id):sprite("menu", "link-white-sm", "link-sm"):style("helmod_button_menu_sm_selected"):tooltip({"tooltip.unlink-element"}))
  end

  -- common cols
  self:addTableRowCommon(gui_table, block)

  -- col recipe
  local cell_recipe = GuiElement.add(gui_table, GuiTable("recipe", block.id):column(1))

  local block_color = "gray"
  if not(block_by_product) then block_color = "orange" end
  GuiElement.add(cell_recipe, GuiCellBlock(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(block):infoIcon(block.type):tooltip("tooltip.edit-block"):color(block_color))

  -- col energy
  local cell_energy = GuiElement.add(gui_table, GuiTable(block.id, "energy"):column(1))
  local element_block = {name=block.name, power=block.power, pollution_total=block.pollution_total, summary=block.summary}
  GuiElement.add(cell_energy, GuiCellEnergy(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(element_block):tooltip("tooltip.edit-block"):color(block_color))

  -- col pollution
  if User.getPreferenceSetting("display_pollution") then
    local cell_pollution = GuiElement.add(gui_table, GuiTable(block.id, "pollution"):column(1))
    GuiElement.add(cell_pollution, GuiCellPollution(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(element_block):tooltip("tooltip.edit-block"):color(block_color))
  end
  
  -- col building
  if User.getPreferenceSetting("display_building") then
    local cell_building = GuiElement.add(gui_table, GuiTable(block.id, "building"):column(1))
    GuiElement.add(cell_building, GuiCellBuilding(self.classname, "change-tab", "HMProductionBlockTab", block.id):element(element_block):tooltip("tooltip.info-building"):color(block_color))
  end

  local product_sorter = User.getProductSorter2()

  -- products
  local display_product_cols = User.getPreferenceSetting("display_product_cols") + 1
  local cell_products = GuiElement.add(gui_table, GuiTable("products", block.id):column(display_product_cols))
  cell_products.style.horizontally_stretchable = false
  if block.products ~= nil then
    for index, product in spairs(block.products, product_sorter) do
      if ((product.state or 0) == 1 and block_by_product)  or (product.count or 0) > ModelCompute.waste_value then
        local button_action = "production-block-product-add"
        local button_tooltip = "tooltip.product"
        local button_color = GuiElement.color_button_default_product
        if not(block_by_product) then
          button_action = "production-block-product-add"
          button_tooltip = "tooltip.add-recipe"
        else
          if not(block.unlinked) or block.by_factory == true then
            button_action = "product-info"
            button_tooltip = "tooltip.info-product"
          else
            button_action = "product-edition"
            button_tooltip = "tooltip.edit-product"
          end
        end
        -- color
        if product.state == 1 then
          if not(block.unlinked) or block.by_factory == true then
            button_color = GuiElement.color_button_default_product
          else
            button_color = GuiElement.color_button_edit
          end
        elseif product.state == 3 then
          button_color = GuiElement.color_button_rest
        else
          button_color = GuiElement.color_button_default_product
        end
        GuiElement.add(cell_products, GuiCellElement(self.classname, button_action, block.id, product.name):element(product):tooltip(button_tooltip):color(button_color):index(index))
      end
    end
  end
  -- ingredients
  local display_ingredient_cols = User.getPreferenceSetting("display_ingredient_cols") + 2
  local cell_ingredients = GuiElement.add(gui_table, GuiTable("ingredients", block.id):column(display_ingredient_cols))
  cell_ingredients.style.horizontally_stretchable = false
  if block.ingredients ~= nil then
    for index, ingredient in spairs(block.ingredients, product_sorter) do
      if ((ingredient.state or 0) == 1 and not(block_by_product)) or (ingredient.count or 0) > ModelCompute.waste_value then
        local button_action = "production-block-ingredient-add"
        local button_tooltip = "tooltip.ingredient"
        local button_color = GuiElement.color_button_default_ingredient
        if block_by_product then
          button_action = "production-block-ingredient-add"
          button_tooltip = "tooltip.add-recipe"
        else
          button_action = "product-edition"
          button_tooltip = "tooltip.edit-product"
        end
        -- color
        if ingredient.state == 1 then
          if not(block.unlinked) or block.by_factory == true then
            button_color = GuiElement.color_button_default_ingredient
          else
            button_color = GuiElement.color_button_edit
          end
        elseif ingredient.state == 3 then
          button_color = GuiElement.color_button_rest
        else
          button_color = GuiElement.color_button_default_ingredient
        end
        GuiElement.add(cell_ingredients, GuiCellElement(self.classname, button_action, block.id, ingredient.name):element(ingredient):tooltip(button_tooltip):color(button_color):index(index))
      end
    end
  end
  return cell_recipe
end

-------------------------------------------------------------------------------
-- On event
--
-- @function [parent=#ProductionBlockTab] onEvent
--
-- @param #LuaEvent event
--
function ProductionBlockTab:onEvent(event)
  local model = Model.getModel()
  local current_block = User.getParameter("current_block")
  local selector_name = "HMRecipeSelector"
  if model.blocks[current_block] ~= nil and model.blocks[current_block].isEnergy then
    selector_name = "HMEnergySelector"
  end

  if event.action == "block-all-ingredient-visible" then
    local all_visible = User.getParameter("block_all_ingredient_visible")
    User.setParameter("block_all_ingredient_visible",not(all_visible))
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-all-product-visible" then
    local all_visible = User.getParameter("block_all_product_visible")
    User.setParameter("block_all_product_visible",not(all_visible))
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "factory-action" then
    if event.control == true then
      local recipe = Model.getObject(event.item1, event.item2)
      if recipe ~= nil and recipe.factory ~= nil then
        local factory = recipe.factory
        Player.beginCrafting(factory.name, factory.count)
      end
    else
      event.action = "OPEN"
      Controller:send("on_gui_open", event,"HMRecipeEdition")
    end
  end

  if event.action == "beacon-action" then
    if event.control == true then
      local recipe = Model.getObject(event.item1, event.item2)
      if recipe ~= nil and recipe.beacon ~= nil then
        local beacon = recipe.beacon
        Player.beginCrafting(beacon.name, beacon.count)
      end
    else
      event.action = "OPEN"
      Controller:send("on_gui_open", event,"HMRecipeEdition")
    end
  end

  -- user writer
  if not(User.isWriter()) then return end

  if event.action == "production-recipe-product-add" then
    if event.control == false and event.shift == false then
      if event.button == defines.mouse_button_type.right then
        Controller:send("on_gui_open", event, selector_name)
      else
        local recipes = Player.searchRecipe(event.item3, true)
        if #recipes == 1 then
          local recipe = recipes[1]
          local new_recipe = ModelBuilder.addRecipeIntoProductionBlock(recipe.name, recipe.type, 0)
          ModelCompute.update()
          User.setParameter("scroll_element", new_recipe.id)
          Controller:send("on_gui_update", event)
        else
          -- pour ouvrir avec le filtre ingredient
          event.button = defines.mouse_button_type.right
          Controller:send("on_gui_open", event, selector_name)
        end
      end
    elseif event.control == true and event.item3 ~= "none" then
      local contraint = {type="master", name=event.item3}
      ModelBuilder.updateRecipeContraint(event.item1, event.item2, contraint)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    elseif event.shift == true and event.item3 ~= "none" then
      local contraint = {type="exclude", name=event.item3}
      ModelBuilder.updateRecipeContraint(event.item1, event.item2, contraint)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    end
  end

  if event.action == "production-recipe-ingredient-add" then
    if event.control == false and event.shift == false then
      if event.button == defines.mouse_button_type.right then
        Controller:send("on_gui_open", event, selector_name)
      else
        local recipes = Player.searchRecipe(event.item3)
        if #recipes == 1 then
          local recipe = recipes[1]
          local new_recipe = ModelBuilder.addRecipeIntoProductionBlock(recipe.name, recipe.type)
          ModelCompute.update()
          User.setParameter("scroll_element", new_recipe.id)
          Controller:send("on_gui_update", event)
        else
          Controller:send("on_gui_open", event, selector_name)
        end
      end
    elseif event.control == true and event.item3 ~= "none" then
      local contraint = {type="master", name=event.item3}
      ModelBuilder.updateRecipeContraint(event.item1, event.item2, contraint)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    elseif event.shift == true and event.item3 ~= "none" then
      local contraint = {type="exclude", name=event.item3}
      ModelBuilder.updateRecipeContraint(event.item1, event.item2, contraint)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    end
  end

  if event.action == "product-info" and model.blocks[current_block] ~= nil then
    local block = model.blocks[current_block]
    if block.products_linked == nil then block.products_linked = {} end
    if event.control == true and event.item3 ~= "none" then
      block.products_linked[event.item3] = not(block.products_linked[event.item3])
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    end
  end

  if event.action == "update-factory-number" then
    local text = event.element.text
    local ok , err = pcall(function()
      local value = formula(text) or 0
      ModelBuilder.updateFactoryNumber(event.item1, event.item2, value)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    end)
    if not(ok) then
      Player.print("Formula is not valid!")
    end
  end

  if event.action == "update-factory-limit" then
    local text = event.element.text
    local ok , err = pcall(function()
      local value = formula(text) or 0
      ModelBuilder.updateFactoryLimit(event.item1, event.item2, value)
      ModelCompute.update()
      Controller:send("on_gui_update", event)
    end)
    if not(ok) then
      Player.print("Formula is not valid!")
    end
  end

  if event.action == "update-matrix-solver" then
    ModelBuilder.updateMatrixSolver(event.item1, event.item2)
    ModelCompute.update()
    Controller:send("on_gui_update", event)
  end

  if event.action == "production-block-solver" then
    ModelBuilder.updateBlockMatrixSolver(event.item1)
    ModelCompute.update()
    Controller:send("on_gui_update", event)
  end

  if event.action == "production-recipe-remove" then
    ModelBuilder.removeProductionRecipe(event.item1, event.item2)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "production-recipe-up" then
    local step = 1
    if event.shift then step = User.getModSetting("row_move_step") end
    if event.control then step = 1000 end
    ModelBuilder.upProductionRecipe(event.item1, event.item2, step)
    ModelCompute.update()
    User.setParameter("scroll_element", event.item2)
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "production-recipe-down" then
    local step = 1
    if event.shift then step = User.getModSetting("row_move_step") end
    if event.control then step = 1000 end
    ModelBuilder.downProductionRecipe(event.item1, event.item2, step)
    ModelCompute.update()
    User.setParameter("scroll_element", event.item2)
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-switch-unlink" then
    local switch_state = event.element.switch_state == "left"
    ModelBuilder.updateProductionBlockOption(event.item1, "unlinked", switch_state)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-switch-element" then
    local switch_state = event.element.switch_state == "left"
    ModelBuilder.updateProductionBlockOption(event.item1, "by_product", switch_state)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-switch-factory" then
    local switch_state = not(event.element.switch_state == "left")
    ModelBuilder.updateProductionBlockOption(event.item1, "by_factory", switch_state)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-switch-solver" then
    local switch_state = event.element.switch_state == "right"
    ModelBuilder.updateProductionBlockOption(event.item1, "solver", switch_state)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

  if event.action == "block-switch-limit" then
    local switch_state = event.element.switch_state == "left"
    ModelBuilder.updateProductionBlockOption(event.item1, "by_limit", switch_state)
    ModelCompute.update()
    Controller:send("on_gui_update", event, self.classname)
  end

end