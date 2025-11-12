function getPlayer( ... )
	if ( ... ) then
		
		local elements = {};
		for _, string in ipairs( { ... } ) do
			for _, element in ipairs( getElementsByType( 'player' ) ) do
				if ( string.find( string:lower(), getPlayerName(element):lower(), 1, true ) ) then
					table.insert( elements, element );
				end
			end
		end
		
		return elements;
	end
	
	return false
end

addCommandHandler( 'broadcast', 
	function( player, command, target, target_ )
		if ( target and target_ ) then
			target, target_ = getPlayer( target, target_ );
			if ( target and target_ ) then
				setPlayerVoiceBroadcastTo( target, target_ );
			else
				outputChatBox( not target and "Target 1 not found!" or not target_ and "Target 2 not found!", root, 255, 0, 0, false );
			end
		end
	end
)