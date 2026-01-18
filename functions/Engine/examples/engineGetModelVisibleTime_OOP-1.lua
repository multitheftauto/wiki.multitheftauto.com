function init()
    Engine.setModelVisibleTime(4550, 10, 12)
    local timeOn, timeOff = Engine.getModelVisibleTime(4550)
    outputChatBox("Los Santos Tower visible time is now between " .. timeOn .. " and " .. timeOff)
end
addEventHandler("onClientResourceStart", resourceRoot, init)
