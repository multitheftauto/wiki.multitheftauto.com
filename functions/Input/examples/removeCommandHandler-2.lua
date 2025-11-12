-- add a command that allows players to see the position of the 'huntedPlayer' for 5 seconds:
function consoleShowHuntedBlip ( commandName )
    local x, y, z = getElementPosition ( huntedPlayer )
    local huntedblip = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, thePlayer )
    setTimer ( "destroyElement", 5000, 1, huntedblip )
end
addCommandHandler ( "showhuntedblip", consoleShowHuntedBlip )

-- remove the command once the hunter player dies:
function onHuntedPlayerWasted ( killer, killerweapon, bodypart )
    removeCommandHandler ( "showhuntedblip" )
end
addEventHandler ( "onClientPlayerWasted", huntedPlayer, onHuntedPlayerWasted )