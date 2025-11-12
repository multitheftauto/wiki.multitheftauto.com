function getBPM()
    local soundElement = playSound("song.mp3") -- Play the song
    local beatsValue = getSoundBPM(soundElement) -- Get the beats per minute of the song

    outputChatBox("BPM: "..beatsValue) -- Output the beats to the chat box
end
addCommandHandler("bpm", getBPM)