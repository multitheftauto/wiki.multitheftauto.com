-- Kick command
local function onKickCommandHandler(playerSource, commandName, playerToKick, stringReason)
    -- Does the calling user have permission to kick the player? Default
    -- to false for safety reasons. We do this so any user can't use us to
    -- kick players.
    if (ACL.hasObjectPermissionTo(playerSource, "function.kickPlayer", false)) then
        -- Do we have permission to kick the player? We do this so we can fail
        -- nicely if this resource doesn't have access to call that function.
        if (ACL.hasObjectPermissionTo(resource, "function.kickPlayer", true)) then
            -- Kick him
            local target = getPlayerFromName(playerToKick)
            if (target) then
                target:kick(playerSource, stringReason)
            else
                playerSource:outputChat("Player "..playerToKick.." not found.")
            end
        else
            -- Resource doesn't have any permissions, sorry
            playerSource:outputChat( "kick: The admin resource is not able to kick players. Please give this resource access to 'function.kickPlayer' in the ACL to use this function.")
        end
    else
        -- User doesn't have any permissions
        playerSource:outputChat("kick: You don't have permissions to use this command.")
    end
end
addCommandHandler("kickplayer", onKickCommandHandler)