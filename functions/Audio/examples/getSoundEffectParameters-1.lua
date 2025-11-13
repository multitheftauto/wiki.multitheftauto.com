local sound = playSound ("music.mp3")
setSoundEffectEnabled (sound, "echo", true)

local echoParams = getSoundEffectParameters (sound, "echo")
print (echoParams.feedback) -- 50
iprint (echoParams)
--[[
{
  feedback = 50,
  leftDelay = 500,
  panDelay = false,
  rightDelay = 500,
  wetDryMix = 50
}
]]