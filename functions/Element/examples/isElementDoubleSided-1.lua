addCommandHandler("createObj", function(plr, command, id)
    local x, y, z = getElementPosition(plr)
    local object = createObject(id, x, y, z)
    if (isElementDoubleSided(object)) then -- checks if it is double sided or not
        outputChatBox("The object is double sided", plr)
    else
        outputChatBox("The object is not double sided", plr)
    end
end)
