local function banPlayerCommand(thisPlayer, commandName, bannedName, reason)
    if (ACL.hasObjectPermissionTo(thisPlayer, "function.banPlayer")) then -- If the command user has the rights
        local bannedPlayer = Player(bannedName) -- Get player by name
        if (bannedPlayer) then
            local theBan = bannedPlayer:ban(true, false, true, thisPlayer, reason) -- Ban the player
            thisPlayer:outputChat("ban: " .. bannedName .. " successfully banned") -- Send the banner a succes message
            thisPlayer:outputChat("At IP Adress: " ..theBan.ip) -- And send him the IP adress of the banned player
        else
            thisPlayer:outputChat("Player "..bannedName.." not found")
        end
    else
        thisPlayer:outputChat("ban: You don't have enough permissions") -- If the command user doesn't have the permissions
    end
end
addCommandHandler("ban", banPlayerCommand)