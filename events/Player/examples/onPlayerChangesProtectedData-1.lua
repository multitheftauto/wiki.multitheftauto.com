function processPlayerElementDataHack()
    addBan(source, "Element data hacking attempt")
end
addEventHandler("onPlayerChangesProtectedData", root, processPlayerElementDataHack)