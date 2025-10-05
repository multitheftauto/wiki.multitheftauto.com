local sound = playSound("money.mp3", false) -- Play a sound
local soundLength = getSoundLength(sound) -- Get the length of the sound
outputChatBox("This sound is " .. soundLength .. " seconds long.")