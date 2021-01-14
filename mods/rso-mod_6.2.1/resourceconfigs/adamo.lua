function fillAdamoConfig(config)

	if game.active_mods["adamo-carbon"] then
		config["adamo-carbon-natural-gas"] = {
			type="resource-liquid",
			minimum_amount=500000,
			allotment=70,
			spawns_per_region={min=1, max=2},
			richness={min=500000, max=1500000},
			size={min=2, max=5},
			starting={richness=1000000, size=2, probability=0.5},
			multi_resource_chance=0.6,
			multi_resource={
				["crude-oil"] = 2,
				["coal"] = 1
			}
		}
	end

	if game.active_mods["apm_nuclear"] then
		config["thorium-ore"] = {
			type="resource-ore",
			
			allotment=40,
			spawns_per_region={min=1, max=1},
			richness=12000,
			size={min=10, max=15},
			min_amount=300,
		}
	end
end