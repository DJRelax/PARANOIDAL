function fillPyRawOresConfig194(config)
	
	
	config["ore-aluminium"] = {
		type="resource-ore",
		
		-- general spawn params
		allotment=80, -- how common resource is
		spawns_per_region={min=1, max=1}, --number of chunks
		richness=25000,        -- resource_ore has only one richness value - resource-liquid has min/max
		
		size={min=20, max=30}, -- rough radius of area, too high value can produce square shaped areas
		min_amount=250,
		
		-- resource provided at starting location
		-- probability: 1 = 100% chance to be in starting area
		--              0 = resource is not in starting area
		starting={richness=8000, size=25, probability=1}
	}
	
	config["ore-chromium"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["ore-lead"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["ore-nickel"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["ore-quartz"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["raw-coal"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
		starting={richness=16000, size=30, probability=1}
	}
	
	config["ore-tin"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["ore-titanium"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	config["ore-zinc"] = {
		type="resource-ore",
		allotment=80,
		spawns_per_region={min=1, max=1},
		richness=25000,
		size={min=20, max=30}, 
		min_amount=250,
	}
	
	
	-- BIG ROCKS
	config["aluminium-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["chromium-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["coal-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["copper-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["iron-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["lead-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["nexelit-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["nickel-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["phosphate-rock-02"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["quartz-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["salt-rock"] = {
		type="resource-liquid",
		minimum_amount=100000,
		allotment=40,
		spawns_per_region={min=1, max=1},
		richness={min=400000, max=600000}, -- richness per resource spawn
		size={min=3, max=5},
		useOreScaling = true,
	}
	
	config["tin-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["titanium-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["uranium-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
	config["zinc-rock"] = {
		type="resource-liquid",
		minimum_amount=500000,
		allotment=15,
		spawns_per_region={min=1, max=1},
		richness={min=2000000, max=4000000}, -- richness per resource spawn
		size={min=2, max=4},
		useOreScaling = true
	}
	
end
