function outputSpeed(soundName) 
    if soundName then
        local soundElement = playSound("sounds/"..soundName..".mp3") -- Play the sound from the sounds folder

        setSoundSpeed(soundElement, 0.5) -- Set the sound speed to 50%

        local soundSpeed = getSoundSpeed(soundElement) -- Get current sound speed

        outputChatBox("Sound speed: "..soundSpeed) -- Output the sound speed
    end
end
addCommandHandler("soundspeed", outputSpeed)