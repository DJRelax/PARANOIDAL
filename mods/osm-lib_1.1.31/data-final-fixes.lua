------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Define code stage
OSM.data_stage = 3

-- Setup local host
local OSM_core = require("core.script-core")

-- Index properties
OSM_core.index_properties()

-- Get additional mod prototypes
OSM_core.get_additional_prototypes()

-- Check for disabled prototypes
OSM_core.disable_prototypes()

-- Finalise properties
OSM_core.finalise_prototypes()

-- Regenerate properties
OSM_core.regenerate_properties()

-- Debug mode
if OSM.debug_mode then OSM_core.debug_mode() end

-----------------------------------------------------------------------

-- Print log
OSM_core.print_log()