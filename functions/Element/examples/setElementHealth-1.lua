function hpSlap(sourcePlayer, command, targetPlayerName)
    -- check if the user has access to it first
    if not hasObjectPermissionTo(sourcePlayer, "command.slap", false) then
        outputChatBox("You cannot use this command.", sourcePlayer)
        return false
    end
    -- look up the player to be slapped
    local targetPlayer = getPlayerFromName(targetPlayerName)
    -- if there's a player with such name,
    if targetPlayer then
        -- subtract 20 from his health
        setElementHealth(targetPlayer, getElementHealth(targetPlayer) - 20)
    else
        -- otherwise, output an error message
        outputChatBox("There is no player named " .. targetPlayerName .. "!", sourcePlayer)
    end
end
-- add our function as a handler for "hpslap"
addCommandHandler("hpslap", hpSlap)
