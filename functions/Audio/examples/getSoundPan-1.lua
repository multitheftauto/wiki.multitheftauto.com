function playMusic()
    local song = playSound("song.mp3")
    setSoundPan(song, -1)
    outputChatBox("Current pan is " .. getSoundPan(song))
end
addCommandHandler("music", playMusic)