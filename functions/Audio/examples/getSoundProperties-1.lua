local sound 
local timer

addCommandHandler("playsound",
function () 
    sound = playSound("wasted.mp3")
    timer = setTimer(function() soundProperties(sound) end, 5000, 0)
end
)

function soundProperties(sound)
    local sampleRate, tempo, pitch, isReversed = getSoundProperties(sound) --gets the sample rate, tempo, pitch and a boolean value representing whether the sound is reversed or not.
    outputChatBox(sampleRate.." "..tempo.." "..pitch.." "..tostring(isReversed))
end