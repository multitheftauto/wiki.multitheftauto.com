function showTeamBase(thePlayer, command, index)
    local theTeam = Element.getByID("red") -- get the team element
    local base = theTeam:getChild(tonumber(index)) -- get the Child of the element, based on the 'index' the player specified.
    if (base ~= false) then -- if the base exists
        thePlayer:outputChat("Team base " .. index .. ": " ..base:getData("name")) -- output it to the player
    else
        thePlayer:outputChat("Base not found.")
    end
end
addCommandHandler("teamBase", showTeamBase)
