local sound = Sound("randomSound.mp3",false) --Play a sound
local soundPosition = sound.playbackPosition --Get the current sound position
outputChatBox("The current seek position of the sound is: " .. soundPosition .. ".")