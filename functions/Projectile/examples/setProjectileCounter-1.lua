function changeProjectileDelay( cmd, bombIndex, duration )
	local bombIndex = tonumber( bombIndex ) or nil
	local duration = tonumber( duration ) or nil
	
	if ( bombIndex ) and ( duration ) then
		local found = false

		for index,projectile in ipairs( getElementsByType( "projectile" ) ) do
			if ( index == bombIndex ) then
				if ( setProjectileCounter( projectile, duration * 1000 ) ) then
					outputChatBox( "Projectile (" .. index .. ") detonates in " .. duration .. " seconds.", 0, 255, 0, false )
				else
					outputChatBox( "Something went wrong when setting the duration.", 255, 0, 0, false )
				end

				found = true
				break
			end
		end

		if ( not found ) then
			outputChatBox( "Projectile with index " .. bombIndex .. " was not found.", 255, 0, 0, false )
		end
	else
		outputChatBox( "SYNTAX: /" .. cmd .. " [bomb index] [duration in seconds]", 220, 180, 0, false )
	end
end
addCommandHandler( "setbombtime", changeProjectileDelay )