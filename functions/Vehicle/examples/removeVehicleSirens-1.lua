addEventHandler("onVehicleEnter",root,function(player,seat)
   if(player)and(seat==0)then
      addVehicleSirens(source,1,1)
   end
end)

addEventHandler("onVehicleExit",root,function(player,seat)
   if(player)and(seat==0)then
      removeVehicleSirens(source)
   end
end)