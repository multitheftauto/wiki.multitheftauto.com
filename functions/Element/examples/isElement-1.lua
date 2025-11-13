function killPlayer2 ( argument )
	-- if the argument is an element, and also a player,
	if isElement( argument ) and getElementType( argument ) == "player" then
		-- kill him
		killPed ( argument )

	-- if it isn't an element, but a string, it could be a name
	elseif type ( argument ) == "string" then
		-- retrieve the player with that name
		local playerElement = getPlayerFromName( argument )
		-- if a player with such a name exists,
		if playerElement then
			-- kill him
			killPed ( playerElement )
		end
	end
end