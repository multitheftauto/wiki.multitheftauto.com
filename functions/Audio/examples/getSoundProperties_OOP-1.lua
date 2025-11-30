local sound 
local timer

addCommandHandler("playsound", function() 
    sound = Sound("wasted.mp3")
    timer = Timer(function() soundProperties(sound) end, 5000, 0)
end)

function soundProperties(sound)
    local sampleRate, tempo, pitch, isReversed = sound:getProperties() --gets the sample rate, tempo, pitch and a boolean value representing whether the sound is reversed or not.
    outputChatBox(sampleRate.." "..tempo.." "..pitch.." "..tostring(isReversed))
end