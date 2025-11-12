-- this function is called whenever someone types 'createmarker' in the chat:
function chatCreateMarker ( thePlayer, commandName )
   if ( thePlayer ) then
      local x, y, z = getElementPosition ( thePlayer ) -- get the player's position
      -- create a cylindrical marker next to the player:
      local theMarker = createMarker ( x + 2, y + 2, z, "cylinder", 1.5, 255, 255, 0, 170 )
      if isElement ( theMarker ) then -- check if the marker was created successfully
         outputChatBox ( "Marker created successfully", thePlayer, 0, 255, 0 )
      else
         outputChatBox ( "Failed to create marker", thePlayer, 255, 0, 0 )
      end
   end
end
addCommandHandler ( "createmarker", chatCreateMarker )