local sound = playSound("randomSound.mp3",false) --Play a sound
local soundPosition = getSoundPosition(sound) --Get the current sound position
outputChatBox("The current seek position of the sound is: " .. soundPosition .. ".")