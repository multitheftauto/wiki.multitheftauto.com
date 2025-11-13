addEventHandler("onVehicleEnter",root,function(player,seat)
   if(player)and(seat==0)then
      addVehicleSirens(source,1,1)
      setVehicleSirens(source,1,0,0,0,100,0,100,255,122)
      bindKey(player,"g","up",getSiren,source)
   end
end)
 
function getSiren(player,button,state,vehicle)
   local sirenParams = getVehicleSirenParams(vehicle)
   outputChatBox("Here's the parameters of your vehicle sirens: Siren Points: "..tostring(sirenParams.SirenCount)..", Type of Siren: "..tostring(sirenParams.SirenType)..".",player)
end
 
addEventHandler("onVehicleExit",root,function(player,seat)
   if(player)and(seat==0)then
      removeVehicleSirens(source)
      unbindKey(player,"g","up",getSiren)
   end
end)