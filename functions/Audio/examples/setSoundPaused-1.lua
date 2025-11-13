local theSound = playSound("music/song.mp3", true)
function togglePausedSound()
    if(isSoundPaused(theSound)) then --sound is paused, un-pause it
        setSoundPaused(theSound, false)
    else --sound is not paused, pause it
        setSoundPaused(theSound, true)
    end
end
addCommandHandler("pausesound", togglePausedSound)