addCommandHandler ( "garagesize",
	function ( commandName, garageID )
		local garageID = tonumber ( garageID ) -- We convert the garage ID string to a number.
		if ( garageID ) then -- We check if garage ID is valid.
			if ( garageID >= 0 and garageID < 50 ) then -- We check if the garage ID is 0 and lower than 50 ( there's only 49 garages ).
				local z, x, y = getGarageSize ( garageID )
				if ( x and y and z ) then -- If x and y and z is valid.
					-- We output the returned values.
					outputChatBox (	"X: ".. x )
					outputChatBox (	"Y: ".. y )
					outputChatBox (	"Z: ".. z )
				else
					outputChatBox (	"X, Y, Z values not valid" )
				end
			else
				outputChatBox (	"Garage ID must be from 0 to 49." )
			end
		else
			outputChatBox (	"You must write a garage ID" )
		end
	end
)