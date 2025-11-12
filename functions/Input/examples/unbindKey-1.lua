-- define the function that will be called when F1 is pressed
function goMoo( player )
    outputChatBox ( getPlayerName ( player ) .. " says Mooooooo!" )
    unbindKey ( player, "F1", "down", goMoo )   -- this function will no longer be triggered by the player, after removing the bind.
end

function playerSpawn ( )
    bindKey ( source, "F1", "down", goMoo ) -- bind the player's F1 key to the 'goMoo' function defined above
end
addEventHandler ( "onPlayerSpawn", root, playerSpawn ) -- make the playerSpawn function be called when a player spawns