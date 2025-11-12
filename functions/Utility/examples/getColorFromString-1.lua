function setPlayerBlipColor ( playerSource, commandName, colorString )
    local red, green, blue, alpha = getColorFromString ( colorString )  -- convert the color string to numbers
    local playerBlip = getBlipAttachedTo ( playerSource )               -- find the blip attached to the player
    if ( playerBlip and red ) then                                      -- check a blip is attached to the player and that a valid color was specified
        setBlipColor ( playerBlip, red, green, blue, alpha )            -- set the player's blip color
    end
end
addCommandHandler ( "set_my_color", setPlayerBlipColor )

-- specify the getBlipAttachedTo function
function getBlipAttachedTo( thePlayer )
	local blips = getElementsByType( "blip" )
	for k, theBlip in ipairs( blips ) do
		if getElementAttachedTo( theBlip ) == thePlayer then
			return theBlip
		end
	end
	return false
end