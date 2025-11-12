spawnTeam = createTeam ("Teamname", 255, 0, 0) -- Create team to spawn.
function spawnOnLogin (prevA, curA )
	outputChatBox ("Welcome to ...", source, 255, 0, 0, false)
	spawnPlayer (source, 0, 0, 5, 0, math.random (0,288), 0, 0, spawnTeam) -- spawns player with random skin
	fadeCamera (source, true)
	setCameraTarget (source, source)
end
addEventHandler("onPlayerLogin", root, spawnOnLogin)