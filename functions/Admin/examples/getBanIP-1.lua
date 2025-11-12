function banPlayerCommand ( thisPlayer, commandName, bannedName, reason )
    if ( hasObjectPermissionTo ( thisPlayer, "function.banPlayer" ) ) then -- If the command user has the rights
        local bannedPlayer = getPlayerFromNick ( bannedName ) -- Get the ID from the player who gets banned
        if getElementType ( bannedPlayer ) == "player" then -- If it's a player
            local theBan = banPlayer ( bannedPlayer, thisPlayer, reason ) -- Ban the player
            outputChatBox ( "ban: " .. bannedName .. " successfully banned", thisPlayer ) -- Send the banner a succes message
            outputChatBox ( "At IP Adress: " ..getBanIP ( theBan ), thisPlayer ) -- And send him the IP adress of the banned player
        end
    else
        outputChatBox ( "ban: You don't have enough permissions", thisPlayer ) -- If the command user doesn't have the permissions
    end
end
addCommandHandler ( "ban", banPlayerCommand )