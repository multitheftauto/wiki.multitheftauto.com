local function playMusic()
    local song = Sound("song.mp3")
    song.pan = -1
    outputChatBox("Current pan is " .. song.pan)
end
addCommandHandler("music", playMusic)