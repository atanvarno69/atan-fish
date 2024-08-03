-- Recipe including options from settings
local catalyst = math.min(
    0,
    settings.startup["atan-fish-product-amount"].value - settings.startup["atan-fish-ingredient-fish-amount"].value
)
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
            catalyst_amount = math.min(
                0,
                settings.startup["atan-fish-product-amount"].value
                    - settings.startup["atan-fish-ingredient-fish-amount"].value
            ),
        },
        {
            type = "fluid",
            name = "water",
            amount = settings.startup["atan-fish-ingredient-water-amount"].value,
        },
    },
    result = "raw-fish",
    result_count = settings.startup["atan-fish-product-amount"].value,
    energy_required = settings.startup["atan-fish-crafting-time"].value,
    enabled = false,
    allow_decomposition = false,
    allow_as_intermediate = false,
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

-- Allow use of productivity modules
for _, module in pairs(data.raw.module) do
    if module.name:find("productivity%-module") and module.limitation then
        table.insert(module.limitation, "atan-fish")
    end
end
