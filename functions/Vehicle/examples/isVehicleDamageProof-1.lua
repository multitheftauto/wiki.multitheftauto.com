function checkVulnerability(theVehicle)
   if isVehicleDamageProof(theVehicle) then
            outputChatBox("This vehicle is not vulnerable to damage", source)
   else
            outputChatBox("This vehicle is vulnerable to damage", source)
   end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), checkVulnerability )