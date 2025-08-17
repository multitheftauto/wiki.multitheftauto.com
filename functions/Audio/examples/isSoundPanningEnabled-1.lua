local function testPanning()
    -- Create the sound and output the panning property state
    local sound = playSound3D("xy.mp3", 0, 0, 0)
    outputChatBox("By default, the sound has its panning " .. (isSoundPanningEnabled(sound) and "enabled" or "disabled"))
    -- Disable the panning and ouput a fact
    setSoundPanningEnabled(sound, false)
    outputChatBox("The sound panning was disabled, so it won't annoy you when the camera it's in a side anymore!", 0, 255, 0)
end
addEventHandler("onClientResourceStart", resourceRoot, testPanning)