local function banPlayerCommand(thisPlayer, commandName, bannedName, reason)
    if (hasObjectPermissionTo(thisPlayer, "function.banPlayer")) then -- If the command user has the rights
        local bannedPlayer = getPlayerFromName(bannedName) -- Get player by name
        if (bannedPlayer) then
            local theBan = banPlayer(bannedPlayer, true, false, true, thisPlayer, reason) -- Ban the player
            outputChatBox("ban: " .. bannedName .. " successfully banned", thisPlayer) -- Send the banner a succes message
            outputChatBox("At IP Adress: " ..getBanIP(theBan), thisPlayer) -- And send him the IP adress of the banned player
        else
            outputChatBox("Player "..bannedName." not found", thisPlayer)
        end
    else
        outputChatBox("ban: You don't have enough permissions", thisPlayer) -- If the command user doesn't have the permissions
    end
end
addCommandHandler("ban", banPlayerCommand)