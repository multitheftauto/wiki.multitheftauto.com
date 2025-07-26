local function kickPlayerHandler(sourcePlayer, commandname, kickedname, ...)
    -- Get player element from the name
    local kicked = Player(kickedname)
    if (not kicked) then -- player not found
        sourcePlayer:outputChat("Player "..kickedname.." not found!")
        return
    end

    -- If the client who sent the command has a higher level
    local reason = table.concat({...}, " ")
    if (ACL.hasObjectPermissionTo(sourcePlayer, "function.kickPlayer")) then
        -- Kick the player
        kicked:kick(sourcePlayer, reason)
    end
end
-- Add the "kick" command handler
addCommandHandler("kick", kickPlayerHandler)