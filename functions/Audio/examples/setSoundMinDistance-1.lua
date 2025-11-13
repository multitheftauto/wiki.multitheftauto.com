local sound = playSound3D("sounds/song.mp3", 373.14, -125.21, 1001, true)

function distanceFunc(command, param)
  setSoundMinDistance(sound, tonumber(param))
end
addCommandHandler("setdistance", distanceFunc)