addCommandHandler('setbantime', function(plr, cmd, nick, time)
    if (not hasObjectPermissionTo(plr, 'function.setUnbanTime')) then
        return
    end

    if (not nick or not time) then
        outputChatBox('Syntax: /setunbantime <nick> <time>', plr)
        return
    end

    local found = false
    for k, v in ipairs(getBans()) do
        if (getBanNick(v) == nick) then
            setUnbanTime(v, time)
            found = true
        end
    end

    if (not found) then
        outputChatBox('Player ' .. nick .. ' isn\'t banned.', plr)
        return
    end
end)
