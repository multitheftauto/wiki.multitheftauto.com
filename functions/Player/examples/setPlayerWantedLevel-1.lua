-- assume that there exists a collision shape named 'policeStation'
function policeStationHit ( thePlayer ) 
   setPlayerWantedLevel ( thePlayer, 6 ) -- set the player's wanted level to 6 stars
   outputChatBox ( getPlayerName ( thePlayer ) .. " entered the police station!" )
end
-- call 'policeStationHit' when a player enters the collision shape:
addEventHandler ( "onColShapeHit", policeStation, policeStationHit )