function onResourceStart()
	local sound = Sound3D("sounds/song.mp3", 373.14, -125.21, 1001, true) 
end
addEventHandler("onClientResourceStart", resourceRoot, onResourceStart)