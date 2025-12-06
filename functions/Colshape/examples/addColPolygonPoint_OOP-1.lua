local shape = ColShape.Polygon(2, 2, 5, 5, 6, 6, 8, 8) -- Somewhere in the map
function addPointToPolygon(plr, cmd, fX, fY, index)
    if (not fX or not fY) then
        plr:outputChat("Correct syntax: /addpoint <fX fY>", 255, 25, 25)
        return false
    end
    if (not index or index == 0) then
        shape:addPoint(fX, fY)
    else
        shape:addPoint(fX, fY, index)
    end
    plr:outputChat("Point added", 0, 255, 0)
end
addCommandHandler("addpoint", addPointToPolygon)