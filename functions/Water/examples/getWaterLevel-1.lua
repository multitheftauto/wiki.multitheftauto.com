function scriptGetLevel ( command, playername ) --when getlevel is called
  local thePlayer = getPlayerFromName ( playername ) --get the player from nickname
  if ( thePlayer ~= false ) then --if there is a player from the nickname
    local x, y, z = getElementPosition ( thePlayer ) -- get his position
    local level = getWaterLevel ( x, y, z )
	  if level then -- if it's not false
        level = z - level -- calculate how far away is he from the water
        outputChatBox( "You are " .. level .. " units away from the water!", source )
	  else outputChatBox ( "There's no sign of water" )
	  end
  else outputChatBox ( "Player does not exist" )
  end
end
addCommandHandler( "getlevel", scriptGetLevel ) -- add a command "getloc" which