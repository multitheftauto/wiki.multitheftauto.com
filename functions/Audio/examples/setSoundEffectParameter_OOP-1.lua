--An example via a timer
local mySound = Sound("discoSound.mp3", 0, 0, 10)
mySound:setEffectEnabled("echo", true)

Timer(function()
    mySound:setEffectParameter("echo", "wetDryMix", 80)
end, 1, 1)