local shape = createColPolygon(2, 2, 5, 5, 6, 6, 8, 8) -- Somewhere in the map
function addPointToPolygon(plr, cmd, fX, fY, index)
    if (not fX or not fY) then
        outputChatBox("Correct syntax: /addpoint <fX fY>", plr, 255, 25, 25)
        return false
    end
    if (not index or index == 0) then
        addColPolygonPoint(shape, fX, fY)
    else
        addColPolygonPoint(shape, fX, fY, index)
    end
    outputChatBox("Point added", plr, 0, 255, 0)
end
addCommandHandler("addpoint", addPointToPolygon)