local theSound = Sound("music/song.mp3", true)
function togglePausedSound()
    if(theSound.paused) then --sound is paused, un-pause it
        theSound.paused = false
    else --sound is not paused, pause it
        theSound.paused = true
    end
end
addCommandHandler("pausesound", togglePausedSound)