local sound = Sound("music.mp3")
sound:setEffectEnabled("echo", true)

local echoParams = sound:getEffectParameters("echo")
print(echoParams.feedback) -- 50
iprint(echoParams)
--[[
{
  feedback = 50,
  leftDelay = 500,
  panDelay = false,
  rightDelay = 500,
  wetDryMix = 50
}
]]
