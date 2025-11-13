function getHandlings(thePlayer,commandName,id) 
   if id then
     local getVehicleHandlings = getModelHandling(id) 
	    for k in pairs (getVehicleHandlings) do 
	       outputChatBox(tostring(k)) 
	    end
   else return end 
end
addCommandHandler("gethandling",getHandlings)