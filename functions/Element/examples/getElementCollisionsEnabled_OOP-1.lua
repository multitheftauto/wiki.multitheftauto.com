for _, player in ipairs(Element.getAllByType("player")) do
    if not player.collisions then -- If we get a false return from the function, we know that the collisions are disabled.
        outputConsole("Player " .. player.name .." has collisions disabled.")
    end
end
