function getRespawnPosition(player)
    local veh = getPedOccupiedVehicle(player) 
    if veh then 
        local x,y,z = getVehicleRespawnPosition(veh)
        local rx,ry,rz = getVehicleRespawnRotation(veh)
        outputChatBox("this car respawn in x = "..x.." y = "..y.." z = "..z.." rx = "..rx.." ry = "..rz,player,0,255,0)
    else
        outputChatBox("you are not in the car",player,255,0,0)
    end
end 
addCommandHandler("getRespawnPos",getRespawnPosition)