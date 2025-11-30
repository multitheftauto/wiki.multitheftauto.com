local sound

function startMySound()
    sound = playSound("sound.mp3", true)
end
addEventHandler("onClientResourceStart", resourceRoot, startMySound)

function stopMySound()
    stopSound(sound)
end
addCommandHandler("stopsound", stopMySound) -- using the command 'stopsound' will stop the sound
