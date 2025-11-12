function scriptOnTrailerAttach ( towedBy )
  thePlayer = getVehicleController ( source ) -- get the controller of the towing vehicle
  if ( thePlayer ) then
    outputChatBox ( getPlayerName ( thePlayer ).. " attached a trailer" )
  else
    outputChatBox ( "trailer attached" )
  end
end
addEventHandler ( "onTrailerAttach", root, scriptOnTrailerAttach )