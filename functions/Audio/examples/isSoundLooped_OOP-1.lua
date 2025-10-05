local mySound

addEventHandler ("onClientResourceStart", resourceRoot, function ()
    mySound = Sound ("sound.mp3")
    mySound.looped = true
end)

addCommandHandler ("loop", function ()
    if isElement (mySound) then
        local newState = not mySound.looped
        mySound.looped = newState

        if newState then
            outputChatBox ("The sound will loop!")
        else
            outputChatBox ("The sound will not loop anymore!")
        end
    end
end)