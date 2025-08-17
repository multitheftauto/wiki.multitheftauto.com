local function getBPM()
    local soundElement = Sound("song.mp3") -- Play the song
    local beatsValue = soundElement:getBPM() -- Get the beats per minute of the song

    outputChatBox("BPM: "..beatsValue) -- Output the beats to the chat box
end
addCommandHandler("bpm", getBPM)