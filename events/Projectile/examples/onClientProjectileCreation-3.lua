function disableFlares ( )
local projType = getProjectileType( source ) --  get the projectile type

    if projType == 58 then -- if the projectile is a flare
	
	destroyElement(source) -- notice cancelEvent() does not work, so this destroys the projectile element after it was created.
		
    end

end	

addEventHandler( "onClientProjectileCreation", root, disableFlares ) -- when a projectile gets created call disableFlares.