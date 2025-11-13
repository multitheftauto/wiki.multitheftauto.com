local lastDrunkLevel = getCameraDrunkLevel()
local function warnPlayerAboutDrunkenness()
    local currentDrunkLevel = getCameraDrunkLevel()
    if currentDrunkLevel ~= lastDrunkLevel and (currentDrunkLevel == 0 or currentDrunkLevel == 255) then
        outputChatBox(currentDrunkLevel == 255 and "You're completly drunk! You should stop drinking!" or "Now you are completely sober! You sohuld keep it like that.", currentDrunkLevel == 255 and 255 or 0, currentDrunkLevel == 0 and 255 or 0, 0)
    end
    lastDrunkLevel = currentDrunkLevel
end
addEventHandler("onClientRender", root, warnPlayerAboutDrunkenness)