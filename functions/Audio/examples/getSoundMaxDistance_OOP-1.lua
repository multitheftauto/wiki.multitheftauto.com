local sound = Sound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function getmaxdistanceFunc()
    outputChatBox("Max distance: " .. sound.maxDistance)
end
addCommandHandler("getmaxdistance", getmaxdistanceFunc)