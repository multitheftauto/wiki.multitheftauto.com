function checkIntFurniture( cmd, roomID )
	local roomID = tonumber( roomID )
	if not roomID or roomID < 0 or roomID > 4 then
		outputChatBox( "Syntax: /" .. cmd .. " [room id: 0-4]", 220, 175, 20, false )
	else
		if getInteriorFurnitureEnabled( roomID ) then
			outputChatBox("Interior furniture is enabled.", 20, 220, 20, false )
		else
			outputChatBox("Interior furniture is disabled.", 220, 20, 20, false )
		end
	end
end
addCommandHandler( "furniture", checkIntFurniture )