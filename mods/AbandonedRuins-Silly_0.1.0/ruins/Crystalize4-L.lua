return
{
  entities =
  {
    {"hydro-plant", {x = -2.5, y = -10.5}, {dir = "west", fluids = {water = 300}, recipe = "water-purification", }},
    {"pipe", {x = 1.5, y = -12.5}, {}},
    {"clarifier", {x = 4.5, y = -11.5}, {dir = "east", fluids = {["water-saline"] = 380}, }},
    {"solar-panel", {x = 9.5, y = -12.5}, {}},
    {"solar-panel", {x = 12.5, y = -12.5}, {}},
    {"ground-water-pump", {x = -6.5, y = -9.5}, {fluids = {water = 100}, }},
    {"pipe", {x = 1.5, y = -11.5}, {}},
    {"solar-panel", {x = 12.5, y = -9.5}, {}},
    {"crude-oil", {x = -13.5, y = -7.5}, {}},
    {"oil-refinery", {x = -9.5, y = -7.5}, {dir = "east", fluids = {["crude-oil"] = 200, ["gas-methane"] = 75}, recipe = "basic-oil-processing", }},
    {"pipe", {x = -6.5, y = -8.5}, {fluids = {water = 100}, }},
    {"medium-electric-pole", {x = 1.5, y = -9.5}, {}},
    {"pipe", {x = 1.5, y = -8.5}, {fluids = {["water-purified"] = 76.033958435058594}, }},
    {"pipe", {x = 3.5, y = -8.5}, {fluids = {["water-purified"] = 78.301521301269531}, }},
    {"valve-underflow", {x = 2.5, y = -8.5}, {dir = "west", fluids = {["water-purified"] = 96.034683227539063}, }},
    {"pipe", {x = 5.5, y = -8.5}, {fluids = {["water-purified"] = 78.296028137207031}, }},
    {"pipe", {x = 4.5, y = -8.5}, {fluids = {["water-purified"] = 78.408058166503906}, }},
    {"pipe", {x = 7.5, y = -8.5}, {fluids = {["water-purified"] = 78.399085998535156}, }},
    {"pipe", {x = 6.5, y = -8.5}, {fluids = {["water-purified"] = 78.593498229980469}, }},
    {"pipe", {x = 9.5, y = -8.5}, {fluids = {["water-purified"] = 78.97705078125}, }},
    {"pipe", {x = 8.5, y = -8.5}, {fluids = {["water-purified"] = 78.827705383300781}, }},
    {"medium-electric-pole", {x = 9.5, y = -9.5}, {}},
    {"pipe", {x = -14.5, y = -6.5}, {fluids = {["crude-oil"] = 100}, }},
    {"pipe", {x = -12.5, y = -6.5}, {fluids = {["crude-oil"] = 100}, }},
    {"pipe", {x = -13.5, y = -6.5}, {fluids = {["crude-oil"] = 100}, }},
    {"pipe-to-ground", {x = -2.5, y = -6.5}, {dir = "west", fluids = {["water-purified"] = 79.922966003417969}, }},
    {"pipe", {x = -3.5, y = -6.5}, {fluids = {["water-purified"] = 79.54278564453125}, }},
    {"fast-transport-belt", {x = -1.5, y = -6.5}, {dir = "south", }},
    {"fast-transport-belt", {x = -0.5, y = -6.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 0.5, y = -6.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 1.5, y = -6.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 1.5, y = -7.5}, {dir = "south", }},
    {"fast-transport-belt", {x = 2.5, y = -7.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 3.5, y = -7.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 4.5, y = -7.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 5.5, y = -7.5}, {dir = "west", }},
    {"pipe-to-ground", {x = 5.5, y = -6.5}, {dir = "east", fluids = {["water-purified"] = 79.537689208984375}, }},
    {"fast-transport-belt", {x = 6.5, y = -7.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 7.5, y = -7.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 7.5, y = -6.5}, {}},
    {"pipe", {x = 6.5, y = -6.5}, {fluids = {["water-purified"] = 79.879463195800781}, }},
    {"fast-transport-belt", {x = 8.5, y = -6.5}, {dir = "west", }},
    {"fast-transport-belt", {x = 9.5, y = -6.5}, {dir = "west", }},
    {"pipe-to-ground", {x = 9.5, y = -7.5}, {fluids = {["water-purified"] = 78.694534301757813}, }},
    {"fast-transport-belt", {x = 10.5, y = -6.5}, {dir = "west", }},
    {"solar-panel", {x = 12.5, y = -6.5}, {}},
    {"pipe-to-ground", {x = -14.5, y = -5.5}, {fluids = {["crude-oil"] = 100}, }},
    {"solar-panel", {x = -11.5, y = -3.5}, {}},
    {"medium-electric-pole", {x = -9.5, y = -4.5}, {}},
    {"angels-chemical-plant", {x = -5.5, y = -4.5}, {dir = "west", fluids = {["gas-methane"] = 60, water = 60}, recipe = "sulfur", }},
    {"pipe", {x = -3.5, y = -5.5}, {fluids = {["water-purified"] = 79.790512084960938}, }},
    {"pipe-to-ground", {x = -2.5, y = -5.5}, {dir = "west", fluids = {["water-purified"] = 79.609619140625}, }},
    {"fast-inserter", {x = -1.5, y = -4.5}, {}},
    {"fast-transport-belt", {x = -1.5, y = -5.5}, {dir = "south", }},
    {"pipe-to-ground", {x = -0.5, y = -5.5}, {dir = "east", fluids = {["water-purified"] = 79.375778198242188}, }},
    {"medium-electric-pole", {x = -0.5, y = -4.5}, {}},
    {"pipe-to-ground", {x = 0.5, y = -4.5}, {fluids = {["water-purified"] = 78.969337463378906}, }},
    {"pipe", {x = 0.5, y = -5.5}, {fluids = {["water-purified"] = 79.123855590820313}, }},
    {"angels-chemical-plant", {x = 2.5, y = -4.5}, {dir = "west", fluids = {["gas-sulfur-dioxide"] = 180, ["liquid-sulfuric-acid"] = 185, ["water-purified"] = 80}, recipe = "liquid-sulfuric-acid", }},
    {"fast-inserter", {x = 5.5, y = -4.5}, {}},
    {"steel-chest", {x = 5.5, y = -5.5}, {items = {["filter-ceramic-used"] = 5}, }},
    {"pipe", {x = 7.5, y = -5.5}, {fluids = {["water-purified"] = 79.66455078125}, }},
    {"pipe-to-ground", {x = 7.5, y = -4.5}, {fluids = {["water-purified"] = 79.603553771972656}, }},
    {"pipe", {x = 6.5, y = -4.5}, {fluids = {["water-purified"] = 79.782295227050781}, }},
    {"pipe", {x = 6.5, y = -5.5}, {fluids = {["water-purified"] = 79.801200866699219}, }},
    {"pipe", {x = 8.5, y = -5.5}, {fluids = {["water-purified"] = 79.238006591796875}, }},
    {"pipe", {x = 8.5, y = -4.5}, {fluids = {["water-purified"] = 79.097450256347656}, }},
    {"pipe", {x = 9.5, y = -4.5}, {fluids = {["water-purified"] = 78.944854736328125}, }},
    {"pipe-to-ground", {x = 9.5, y = -5.5}, {dir = "south", fluids = {["water-purified"] = 79.21209716796875}, }},
    {"fast-transport-belt", {x = 10.5, y = -5.5}, {}},
    {"fast-transport-belt", {x = 10.5, y = -4.5}, {}},
    {"solar-panel", {x = 12.5, y = -3.5}, {}},
    {"angels-flare-stack", {x = -9, y = -2}, {fluids = {["gas-hydrogen"] = 20}, }},
    {"ground-water-pump", {x = -7.5, y = -3.5}, {dir = "west", fluids = {water = 100}, }},
    {"angels-flare-stack", {x = -7, y = -2}, {dir = "west", fluids = {["gas-oxygen"] = 88.179618835449219}, }},
    {"pipe", {x = -4.5, y = -2.5}, {fluids = {["gas-oxygen"] = 47.273681640625}, }},
    {"valve-overflow", {x = -5.5, y = -2.5}, {dir = "east", }},
    {"fast-inserter", {x = -3.5, y = -3.5}, {dir = "west", }},
    {"angels-chemical-plant", {x = -1.5, y = -2.5}, {dir = "west", fluids = {["gas-oxygen"] = 120, ["gas-sulfur-dioxide"] = 170}, recipe = "gas-sulfur-dioxide", }},
    {"pipe", {x = 0.5, y = -3.5}, {fluids = {["gas-sulfur-dioxide"] = 100}, }},
    {"assembling-machine-2", {x = 6.5, y = -2.5}, {fluids = {["water-purified"] = 100}, recipe = "filter-ceramic-refurbish", }},
    {"pipe-to-ground", {x = 4.5, y = -2.5}, {fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"pipe", {x = 4.5, y = -3.5}, {fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"medium-electric-pole", {x = 9.5, y = -2.5}, {}},
    {"fast-transport-belt", {x = 10.5, y = -3.5}, {}},
    {"fast-transport-belt", {x = 10.5, y = -2.5}, {}},
    {"angels-flare-stack", {x = -13, y = 0}, {fluids = {["gas-raw-1"] = 40}, }},
    {"angels-electrolyser-2", {x = -6.5, y = 1.5}, {dir = "south", fluids = {water = 200}, recipe = "dirt-water-separation", }},
    {"medium-electric-pole", {x = -5.5, y = -1.5}, {}},
    {"pipe", {x = -4.5, y = -1.5}, {fluids = {["gas-oxygen"] = 47.273818969726563}, }},
    {"pipe", {x = -3.5, y = -1.5}, {fluids = {["gas-oxygen"] = 47.272869110107422}, }},
    {"pipe-to-ground", {x = -0.5, y = -0.5}, {dir = "west", fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"pipe", {x = -1.5, y = -0.5}, {fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"medium-electric-pole", {x = 3.5, y = -1.5}, {}},
    {"pipe-to-ground", {x = 3.5, y = -0.5}, {dir = "east", fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"fast-inserter", {x = 5.5, y = -0.5}, {}},
    {"pipe", {x = 4.5, y = -0.5}, {fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"pipe-to-ground", {x = 4.5, y = -1.5}, {dir = "south", fluids = {["liquid-sulfuric-acid"] = 100}, }},
    {"pipe-to-ground", {x = 7.5, y = -0.5}, {dir = "south", fluids = {["water-purified"] = 79.625762939453125}, }},
    {"fast-inserter", {x = 6.5, y = -0.5}, {dir = "south", }},
    {"fast-transport-belt", {x = 10.5, y = -1.5}, {}},
    {"solar-panel", {x = 12.5, y = -0.5}, {}},
    {"fast-transport-belt", {x = 10.5, y = -0.5}, {}},
    {"pipe-to-ground", {x = -14.5, y = 0.5}, {dir = "south", fluids = {["crude-oil"] = 100}, }},
    {"separator", {x = -12.5, y = 3.5}, {fluids = {["crude-oil"] = 90, ["liquid-multi-phase-oil"] = 200}, recipe = "oil-separation", }},
    {"pipe", {x = -10.5, y = 0.5}, {}},
    {"medium-electric-pole", {x = -11.5, y = 0.5}, {}},
    {"pipe-to-ground", {x = -9.5, y = 0.5}, {dir = "west", }},
    {"fast-inserter", {x = -3.5, y = 0.5}, {dir = "west", }},
    {"liquifier", {x = -1.5, y = 1.5}, {dir = "south", fluids = {["liquid-sulfuric-acid"] = 30}, recipe = "slag-processing-dissolution", }},
    {"pipe-to-ground", {x = 0.5, y = 0.5}, {dir = "east", }},
    {"pipe-to-ground", {x = 0.5, y = 1.5}, {dir = "south", fluids = {["water-purified"] = 78.81494140625}, }},
    {"pipe-to-ground", {x = 1.5, y = 0.5}, {dir = "west", }},
    {"pipe", {x = 1.5, y = 1.5}, {fluids = {["water-purified"] = 78.515594482421875}, }},
    {"filtration-unit-2", {x = 4.5, y = 2.5}, {dir = "east", fluids = {["slag-slurry"] = 70, ["water-purified"] = 100}, recipe = "slag-processing-filtering-2", }},
    {"pipe-to-ground", {x = 7.5, y = 0.5}, {fluids = {["water-purified"] = 79.592262268066406}, }},
    {"pipe", {x = 7.5, y = 1.5}, {}},
    {"pipe", {x = 9.5, y = 0.5}, {}},
    {"pipe-to-ground", {x = 8.5, y = 0.5}, {dir = "east", }},
    {"pipe", {x = 9.5, y = 1.5}, {}},
    {"pipe", {x = 8.5, y = 1.5}, {}},
    {"fast-transport-belt", {x = 10.5, y = 0.5}, {}},
    {"fast-inserter", {x = 10.5, y = 1.5}, {dir = "south", }},
    {"pipe-to-ground", {x = -0.5, y = 3.5}, {dir = "west", fluids = {["slag-slurry"] = 70.000404357910156}, }},
    {"pipe", {x = -1.5, y = 3.5}, {fluids = {["slag-slurry"] = 70.000114440917969}, }},
    {"pipe", {x = 1.5, y = 2.5}, {fluids = {["water-purified"] = 78.570816040039063}, }},
    {"pipe", {x = 0.5, y = 2.5}, {fluids = {["water-purified"] = 78.67010498046875}, }},
    {"pipe-to-ground", {x = 1.5, y = 3.5}, {dir = "east", fluids = {["slag-slurry"] = 69.999481201171875}, }},
    {"medium-electric-pole", {x = 7.5, y = 2.5}, {}},
    {"pipe", {x = 7.5, y = 3.5}, {}},
    {"hydro-plant", {x = 11.5, y = 5.5}, {fluids = {["water-yellow-waste"] = 90}, recipe = "yellow-waste-water-purification", }},
    {"ground-water-pump", {x = -8.5, y = 4.5}, {dir = "south", fluids = {water = 100}, }},
    {"solar-panel", {x = -3.5, y = 5.5}, {}},
    {"steel-chest", {x = -1.5, y = 5.5}, {items = {["iron-ore"] = 19}, }},
    {"fast-inserter", {x = -0.5, y = 5.5}, {dir = "east", }},
    {"crystallizer-2", {x = 2.5, y = 7.5}, {dir = "west", fluids = {["mineral-sludge"] = 86.130111694335938}, recipe = "slag-processing-1", }},
    {"pipe", {x = 5.5, y = 5.5}, {}},
    {"pipe", {x = 6.5, y = 5.5}, {}},
    {"pipe", {x = 7.5, y = 5.5}, {}},
    {"pipe", {x = 7.5, y = 4.5}, {}},
    {"pumpjack", {x = -13.5, y = 7.5}, {fluids = {["liquid-multi-phase-oil"] = 220.90364074707031}, }},
    {"crude-oil", {x = -13.5, y = 7.5}, {}},
    {"medium-electric-pole", {x = -11.5, y = 6.5}, {}},
    {"solar-panel", {x = -2.5, y = 8.5}, {}},
    {"pipe", {x = 5.5, y = 7.5}, {}},
    {"pipe", {x = 5.5, y = 6.5}, {}},
    {"pipe-to-ground", {x = 7.5, y = 6.5}, {dir = "south", fluids = {["water-purified"] = 79.559822082519531}, }},
    {"pipe", {x = 7.5, y = 7.5}, {fluids = {["water-purified"] = 79.555389404296875}, }},
    {"medium-electric-pole", {x = -0.5, y = 8.5}, {}},
    {"pipe", {x = 5.5, y = 9.5}, {}},
    {"pipe", {x = 5.5, y = 8.5}, {}},
    {"pipe", {x = 7.5, y = 8.5}, {fluids = {["water-purified"] = 79.5157470703125}, }},
    {"pipe", {x = 7.5, y = 9.5}, {fluids = {["water-purified"] = 79.519027709960938}, }},
    {"pipe", {x = 8.5, y = 9.5}, {fluids = {["water-purified"] = 79.498184204101563}, }},
    {"pipe", {x = 9.5, y = 9.5}, {fluids = {["water-purified"] = 79.482818603515625}, }},
    {"pipe", {x = 12.5, y = 9.5}, {}},
    {"pipe", {x = 13.5, y = 9.5}, {}},
    {"solar-panel", {x = -3.5, y = 11.5}, {}},
    {"steel-chest", {x = -1.5, y = 10.5}, {items = {["iron-ore"] = 8}, }},
    {"fast-inserter", {x = -0.5, y = 10.5}, {dir = "east", }},
    {"crystallizer-2", {x = 2.5, y = 12.5}, {dir = "west", fluids = {["mineral-sludge"] = 48.863674163818359}, recipe = "slag-processing-1", }},
    {"pipe", {x = 5.5, y = 11.5}, {}},
    {"pipe", {x = 5.5, y = 10.5}, {}},
    {"solar-panel", {x = 8.5, y = 12.5}, {}},
    {"medium-electric-pole", {x = 7.5, y = 10.5}, {}},
    {"clarifier", {x = 12.5, y = 12.5}, {dir = "south", fluids = {["water-mineralized"] = 20}, }},
    {"pipe", {x = 5.5, y = 12.5}, {}},
  },
}