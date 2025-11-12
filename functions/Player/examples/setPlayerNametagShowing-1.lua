function onResourceStart ( )
    local players = getElementsByType ( "player" ) -- Store all the players in the server into a table
    for key, player in ipairs ( players ) do       -- for all the players in the table
        setPlayerNametagShowing ( player, false )  -- turn off their nametag
    end
end
addEventHandler ( "onResourceStart", resourceRoot, onResourceStart )

function onPlayerJoin ( )
      -- Whoever joins the server should also have their nametags deactivated
	setPlayerNametagShowing ( source, false )
end
addEventHandler ( "onPlayerJoin", root, onPlayerJoin )