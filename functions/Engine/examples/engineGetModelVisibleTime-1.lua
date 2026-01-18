function init()
    engineSetModelVisibleTime(4550, 10, 12)
    local timeOn, timeOff = engineGetModelVisibleTime(4550)
    outputChatBox("Los Santos Tower visible time is now between " .. timeOn .. " and " .. timeOff)
end
addEventHandler("onClientResourceStart", resourceRoot, init)
