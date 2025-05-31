-- when a player spawns,
function player_Spawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
	-- play a frontend sound for him
	playSoundFrontEnd ( source, 16 )
end
-- add the player_Spawn function as a handler for onPlayerSpawn
addEventHandler ( "onPlayerSpawn", getRootElement(), player_Spawn )