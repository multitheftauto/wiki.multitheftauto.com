--An example via a timer
local mySound = playSound("discoSound.mp3", 0, 0, 10)
setSoundEffectEnabled(mySound, "echo", true)

setTimer(function()
    setSoundEffectParameter(mySound, "echo", "wetDryMix", 80)
end, 1, 1)