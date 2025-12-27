function showTeamElements(thePlayer, command)
    local theTeam = getElementByID("red") -- get the team element
    local elements = getElementChildren(theTeam) -- the child elements
    for k, v in ipairs(elements) do
        outputChatBox(getElementType(v) .. ": " .. getElementData(v, "name")) -- print the type and name of each child
    end
end
addCommandHandler("teamElements", showTeamElements)
