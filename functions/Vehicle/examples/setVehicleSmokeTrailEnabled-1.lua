local veh = {512,513} 

local plane = createVehicle (veh[2], 2043.23499, 1537.88562, 10.67188)

local ped = createPed ( 2, 0,0,0 )

warpPedIntoVehicle ( ped, plane)   

setTimer(function()
    print(setVehicleSmokeTrailEnabled (plane,true))
end ,1500,1)
 
function disbled()
    print(setVehicleSmokeTrailEnabled (plane,false))
    print(isVehicleSmokeTrailEnabled(plane))
end
 
bindKey ("r", "down", disbled )