local theSound = Sound("music/song.mp3")

function checkSongPause()
    local pause = theSound.paused
    if(pause) then
        outputChatBox("The sound is paused!")
    else
        outputChatBox("The sound is not paused!")
    end
end
addCommandHandler("checkpause", checkSongPause)