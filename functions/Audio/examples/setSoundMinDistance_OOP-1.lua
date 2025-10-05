local sound = Sound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function distanceFunc(command, param)
  sound.minDistance = tonumber(param)
end
addCommandHandler("setdistance", distanceFunc)