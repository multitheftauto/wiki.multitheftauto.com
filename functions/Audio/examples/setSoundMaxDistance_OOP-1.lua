local sound = Sound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function maxdistanceFunc(command, param)
  sound.maxDistance = tonumber(param)
end
addCommandHandler("setmaxdistance", maxdistanceFunc)