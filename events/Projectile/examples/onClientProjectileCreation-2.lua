function projectileCreation( creator )
	local projectileType = getProjectileType( source ) -- We get the projectile type
	if projectileType == 17 then -- If is tear gas then...
		local creatorName = getPlayerName( creator ) -- We get the player name who creates the projectile
		local x, y, z = getElementPosition ( source ) --Getting the position from the projectile creator
		outputChatBox ( creatorName.." is a noob teargas user! But he got punished for it don't worry." )
		setTimer ( setElementPosition, 50, 250, source, x, y, z-0.5 )
		setTimer ( setElementPosition, 50, 250, creator, x, y, z-0.5 )
	end
end
addEventHandler( "onClientProjectileCreation", root, projectileCreation )