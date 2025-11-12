-- Kick command
function onKickCommandHandler ( playerSource, commandName, playerToKick, stringReason )
    -- Does the calling user have permission to kick the player? Default
    -- to false for safety reasons. We do this so any user can't use us to
    -- kick players.
    if ( hasObjectPermissionTo ( playerSource, "function.kickPlayer", false ) ) then

        -- Do we have permission to kick the player? We do this so we can fail
        -- nicely if this resource doesn't have access to call that function.
        if ( hasObjectPermissionTo ( resource, "function.kickPlayer", true ) ) then
            -- Kick him
            kickPlayer ( playerToKick, playerSource, stringReason )
        else
            -- Resource doesn't have any permissions, sorry
            outputChatBox ( "kick: The admin resource is not able to kick players. Please give this resource access to 'function.kickPlayer' in the ACL to use this function.", playerSource )
        end
    else
        -- User doesn't have any permissions
        outputChatBox ( "kick: You don't have permissions to use this command.", playerSource )
    end
end
addCommandHandler ( "kick", onKickCommandHandler )