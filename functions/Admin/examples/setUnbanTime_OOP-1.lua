addCommandHandler('setbantime', function(plr, cmd, nick, time)
    if (not ACL.hasObjectPermissionTo(plr, 'function.setUnbanTime')) then
        return
    end

    if (not nick or not time) then
        plr:outputChat('Syntax: /setunbantime <nick> <time>')
        return
    end

    local found = false
    for k, v in ipairs(Ban.getList()) do
        if (v.nick == nick) then
            v.unbanTime = time
            found = true
        end
    end

    if (not found) then
        plr:outputChat('Player ' .. nick .. ' isn\'t banned.')
        return
    end
end)
