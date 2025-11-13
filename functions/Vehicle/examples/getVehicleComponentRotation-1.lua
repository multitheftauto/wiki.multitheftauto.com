addCommandHandler("vcr", -- short for 'vehicle component rotation'
function()
     local theVeh = getPedOccupiedVehicle(localPlayer)
     if (theVeh) then
	 local getComponent = getVehicleComponents(theVeh) -- returns table with all the components of the vehicle
         for k in pairs (getComponent) do
	     local rx, ry, rz = getVehicleComponentRotation(theVeh, k)
             outputChatBox("Rotation of "..k.." is "..rx.." "..ry.." "..rz)
         end
     end
 end
)