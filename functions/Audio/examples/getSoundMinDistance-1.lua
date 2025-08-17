local sound = playSound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function distanceFunc()
    outputChatBox("Minimum distance: " .. getSoundMinDistance(sound))
end
addCommandHandler("getdistance", distanceFunc)