local function kickPlayerHandler(sourcePlayer, commandname, kickedname, ...)
    -- Get player element from the name
    local kicked = getPlayerFromName(kickedname)
    if (not kicked) then -- player not found
        outputChatBox("Player "..kickedname.." not found!", sourcePlayer)
        return
    end

    -- If the client who sent the command has a higher level
    local reason = table.concat({...}, " ")
    if (hasObjectPermissionTo(sourcePlayer, "function.kickPlayer")) then
        -- Kick the player
        kickPlayer(kicked, sourcePlayer, reason)
    end
end
-- Add the "kick" command handler
addCommandHandler("kick", kickPlayerHandler)