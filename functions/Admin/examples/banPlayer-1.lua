--Add the "ban" command handler
-- Example with the player
local function banPlayerCommand(theClient, commandName, bannedName, reason)
    -- Give the player a nice error if he doesn't have rights
    if (hasObjectPermissionTo(theClient, "function.banPlayer")) then
        --Get player element from the name
        local bannedPlayer = getPlayerFromName(bannedName)

        -- Check if player exists
        if (not bannedPlayer) then
            outputChatBox("Player "..bannedName.." not found.", theClient)
            return
        end

        --Ban the player
        banPlayer(bannedPlayer, false, false, true, theClient, reason)
        outputChatBox("ban: "..bannedName.." successfully banned", theClient)
    else
        outputChatBox("ban: You don't have enough permissions", theClient)
    end
end
addCommandHandler("ban", banPlayerCommand)