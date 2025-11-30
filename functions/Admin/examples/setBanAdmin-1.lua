local function banHappened(theBan)
    if (getElementType(source) == "player") then
        local adminIP = getPlayerIP(source)
        setBanAdmin(theBan, adminIP)
    end
end
addEventHandler("onBan", root, banHappened)