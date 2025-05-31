local jailZone = createColCircle ( 1024, 1024, 15 ) -- create a collision shape

-- call 'jailZoneLeave' whenever a player leaves the collision shape:
function jailZoneLeave ( thePlayer )
   if getElementType ( thePlayer ) == "player" then -- if the element that left was player
      killPlayer ( thePlayer ) -- kill the player
      outputChatBox ( "You are not allowed to leave the jail!", thePlayer )
   end
end
addEventHandler ( "onColShapeLeave", jailZone, jailZoneLeave )