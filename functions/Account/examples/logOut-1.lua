function logoutAll ()
	local players = getElementsByType ( "player" ) -- Get every player
		for k, player in ipairs ( players ) do -- For every player do the following...
			account = getPlayerAccount ( player ) -- Get every player's account
				if ( not isGuestAccount ( account ) ) then -- For every player that's logged in....
					logOut ( player ) -- Log them out.
				end
		end
end
 -- Trigger it when the resource (re)starts
addEventHandler ( "onResourceStart", getResourceRootElement(), logoutAll )