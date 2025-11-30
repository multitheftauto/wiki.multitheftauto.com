local mySound

addEventHandler("onClientResourceStart", resourceRoot, function()
    mySound = playSound("sound.mp3")
    setSoundLooped(mySound, true)
end)

addCommandHandler("loop", function()
    if isElement(mySound) then
        local newState = not isSoundLooped(mySound)
        setSoundLooped(mySound, newState)

        if newState then
            outputChatBox("The sound will loop!")
        else
            outputChatBox("The sound will not loop anymore!")
        end
    end
end)
