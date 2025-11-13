local ped = createPed(0, 0,0,3)
local vehicle = createVehicle(554,0,0,3)
warpPedIntoVehicle(ped, vehicle)

addCommandHandler("drive",function()
    isDriving = getPedAnalogControlState ( ped, "accelerate" ) -- get the analaog state of (accelerate)
    if isDriving==1 then -- checks if equals 1 that means is driving
        outputChatBox("Ped is driving stoping..")
        setPedAnalogControlState( ped, "accelerate", 0 ) -- set the analaog (accelerate) to 0 
    else 
        outputChatBox("Starting drive")
        setPedAnalogControlState( ped, "accelerate", 1 ) -- set the analaog (accelerate) to 1 
    end 
end)