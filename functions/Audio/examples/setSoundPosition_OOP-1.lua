local theSound = Sound("music/song.mp3")
function setSongPos(cmd, tm)
    tm = tonumber(tm)
    local ssp = theSound.playbackPosition = tm
    if ssp then
        outputChatBox("Sound is now playing from: "..tostring(tm))
    else
        outputChatBox("An error has occured.")
    end
end
addCommandHandler("skipsong", setSongPos)