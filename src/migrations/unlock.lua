for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if recipes["atan-fish"].category == "chemistry" then
        if technologies["oil-processing"].researched then
            recipes["atan-fish"].enabled = true
        end
    elseif recipes["atan-fish"].category == "crafting-with-fluid" then
        if technologies["automation-2"].researched then
            recipes["atan-fish"].enabled = true
        end
    end
end
