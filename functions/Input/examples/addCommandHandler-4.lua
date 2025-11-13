function escapeMe ( commandName )
	local x, y, z = getElementPosition ( localPlayer ) --Get player's position
	setElementPosition ( localPlayer, x+(math.random(-10,10)), y+(math.random(-10,10)), z+(math.random(1,15)) ) --Move a player randomly to a nearby location. X is current x + a number between -10, 10 and so on.
end    
addCommandHandler ( "escape", escapeMe ) --When player types "/escape" in chatbox or "escape" in console