local function banHappened(theBan)
    if (source.type == "player") then
        local adminIP = source.ip
        theBan.admin = adminIP
    end
end
addEventHandler("onBan", root, banHappened)