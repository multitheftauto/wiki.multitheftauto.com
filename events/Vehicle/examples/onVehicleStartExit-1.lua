local policeVehicles = {[598] = true,[596] = true,[597] = true,[599] = true } -- Police vehicle IDs
local policeSkins = {[280] = true,[281] = true,[282] = true,[283] = true,[284] = true,[285] = true,[286] = true } -- Police Skins
 
function exitVehicle ( thePlayer, seat, jacked ) 
   if (policeVehicles[getElementModel (source)]) and (policeSkins[getElementModel(thePlayer)]) then 
      outputChatBox ( "You're the cop! Don't exit the car!", thePlayer )  
      cancelEvent()
   end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle)