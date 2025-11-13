function onTruckDamage ( loss )
   if ( loss > 50 ) then --if the health loss was more than 50
      detachTrailerFromVehicle ( source ) --detach the truck from the trailer
      -- remove the event handler so that this function is no longer called when the trailer is damaged
      removeEventHandler ( "onVehicleDamage", source, onTrailerDamage )
   end
end

function createVehiclesAndAttachThem ()
   local theTruck = createVehicle ( 515, 500, 500, 40 ) -- create a trailer-tower (roadtrain)
   local theTrailer = createVehicle ( 435, 500, 505, 40 ) -- create a trailer
   attachTrailerToVehicle ( theTruck, theTrailer ) -- attach them
   -- add an event handler for when the trailer is damaged
   addEventHandler ( "onVehicleDamage", theTruck, onTruckDamage )
end