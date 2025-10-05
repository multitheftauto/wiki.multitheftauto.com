local sound = playSound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function getmaxdistanceFunc()
    outputChatBox("Max distance: " .. getSoundMaxDistance(sound))
end
addCommandHandler("getmaxdistance", getmaxdistanceFunc)