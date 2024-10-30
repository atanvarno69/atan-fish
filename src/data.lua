-- Recipe including options from settings
local recipe = {
    type = "recipe",
    name = "atan-fish",
    order = "h[raw-fish]",
    category = settings.startup["atan-fish-category"].value,
    icon = "__base__/graphics/icons/fish.png",
    icon_size = 64,
    icon_mipmaps = 4,
    ingredients = {
        {
            type = "item",
            name = "raw-fish",
            amount = settings.startup["atan-fish-ingredient-fish-amount"].value,
            ignored_by_stats = settings.startup["atan-fish-ingredient-fish-amount"].value,
        },
        {
            type = "fluid",
            name = "water",
            amount = settings.startup["atan-fish-ingredient-water-amount"].value,
        },
    },
    crafting_machine_tint = {
        primary = { r = 0, g = 0, b = 255, a = 255 },
        secondary = { r = 0, g = 0, b = 255, a = 255 },
    },
    result_is_always_fresh = true,
    results = {
        {
            type = "item",
            name = "raw-fish",
            amount = settings.startup["atan-fish-product-amount"].value,
            ignored_by_stats = settings.startup["atan-fish-ingredient-fish-amount"].value,
        },
    },
    energy_required = settings.startup["atan-fish-crafting-time"].value,
    enabled = false,
    allow_as_intermediate = false,
    allow_decomposition = false,
    allow_productivity = false,
}
data:extend({ recipe })

-- Unlock recipe with appropriate technology
local unlock = {
    type = "unlock-recipe",
    recipe = "atan-fish",
}
if settings.startup["atan-fish-category"].value == "crafting-with-fluid" then
    table.insert(data.raw.technology["automation-2"].effects, unlock)
elseif settings.startup["atan-fish-category"].value == "chemistry" then
    table.insert(data.raw.technology["oil-processing"].effects, unlock)
end
