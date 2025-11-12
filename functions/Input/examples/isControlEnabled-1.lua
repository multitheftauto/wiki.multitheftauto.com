function changeWeaponControls ( player, commandName )
	--Check to see if the player can use primary/secondary vehicle fire controls
        primaryWeaponControl = isControlEnabled ( player, "vehicle_fire" )
        secondaryWeaponControl = isControlEnabled ( player, "vehicle_secondary_fire" )
	--Toggle the use of the primary vehicle fire control ability.
        if ( primaryWeaponControl == true ) then
             toggleControl ( player, "vehicle_fire", false )
    	     outputChatBox ( "Disabled your ability to use primary vehicle weapons." )
        else
             toggleControl ( player, "vehicle_fire", true )
    	     outputChatBox ( "Enabled your ability to use primary vehicle weapons." )
        end
        --Toggle the use of the secondar vehicle fire control ability.
        if ( secondaryWeaponControl == true ) then
             toggleControl ( player, "vehicle_secondary_fire", false )
    	     outputChatBox ( "Disabled your ability to use secondary vehicle weapons." )
        else
             toggleControl ( player, "vehicle_secondary_fire", true )
    	     outputChatBox ( "Enabled your ability to use secondary vehicle weapons." )
        end
end  
addCommandHandler ( "toggleweapons", changeWeaponControls )