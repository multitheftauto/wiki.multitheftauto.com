local towingVehicle = createVehicle ( 515, 500, 500, 40 ) -- create a trailer-tower (roadtrain)
local trailer = createVehicle ( 435, 500, 490, 40 ) -- create a trailer
attachTrailerToVehicle ( towingVehicle, trailer ) -- attach them
if ( getVehicleTowedByVehicle ( towingVehicle ) == trailer ) then -- if it attached
  outputChatBox ( "The vehicles were attached!" )
end