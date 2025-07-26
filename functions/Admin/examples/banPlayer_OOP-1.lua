--Add the "ban" command handler
-- Example with the player
local function banPlayerCommand(theClient, commandName, bannedName, reason)
    -- Give the player a nice error if he doesn't have rights
    if (ACL.hasObjectPermissionTo(theClient, "function.banPlayer")) then
        --Get player element from the name
        local bannedPlayer = Player(bannedName)

        -- Check if player exists
        if (not bannedPlayer) then
            theClient:outputChat("Player "..bannedName.." not found.")
            return
        end

        --Ban the player
        bannedPlayer:ban(false, false, true, theClient, reason)
        theClient:outputChat("ban: "..bannedName.." successfully banned")
    else
        theClient:outputChat("ban: You don't have enough permissions")
    end
end
addCommandHandler("ban", banPlayerCommand)