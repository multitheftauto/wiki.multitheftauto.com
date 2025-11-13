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

function clearVisibilityWasted ( totalammo, killer, killerweapon, bodypart ) -- when a player dies
    clearElementVisibleTo ( getBlipAttachedTo ( source ) ) -- clear any visiblity settings of his blip
end
addEventHandler ( "onPlayerWasted", root, clearVisibilityWasted  ) --add an event handler for onPlayerWasted