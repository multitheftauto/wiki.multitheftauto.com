function showTeamBase(thePlayer, command, index)
    local theTeam = getElementByID("red") -- get the team element
    local base = getElementChild(theTeam, tonumber(index)) -- get the Child of the element, based on the 'index' the player specified.
    if (base ~= false) then -- if the base exists
        outputChatBox("Team base " .. index .. ": " ..getElementData(base, "name"), thePlayer) -- output it to the player
    else
        outputChatBox("Base not found.", thePlayer)
    end
end
addCommandHandler("teamBase", showTeamBase)
