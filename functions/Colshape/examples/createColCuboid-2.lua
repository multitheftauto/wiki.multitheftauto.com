addCommandHandler('createCenteredCuboid', function(player, cmd, posX, posY, posZ, sizeX, sizeY, sizeZ)
	posX = posX - sizeX / 2
	posY = posY - sizeY / 2
	posZ = posZ - sizeZ / 2
	createCuboid(posX, posY, posZ, sizeX, sizeY, sizeZ)
end)