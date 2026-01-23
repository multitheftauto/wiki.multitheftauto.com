function fakeBomb(x, y, z, d)
    if d then -- Check the players Dimension
        if getElementDimension(localPlayer) == d then
            -- If the players Dimension is the current dimension
            -- Then people on other dimensions cant see this explosion
            createExplosion(x, y, z, 0, true, -1.0, false)
        end
    else
        createExplosion(x, y, z, 0, true, -1.0, false)
    end
end
addEvent("fakeBomb", true)
addEventHandler("fakeBomb", root, fakeBomb)
