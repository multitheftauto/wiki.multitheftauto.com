local panned = true
local sound = playSFX3D("script", 7, 1, 0, 0, 20, true)

function changePanning()
    if sound then
        sound.panningEnabled = not panned
        panned = not panned
        outputChatBox("Sound panning changed to " .. tostring(panned))
    else
        outputDebugString("Looks that your GTA was ripped.")
    end
end
addCommandHandler("soundpanning", changePanning)