function createPedAndsetHisAimTarget ()
        local ped = createPed (0, 0, 0, 5 ) -- create a ped, who looks like cj, in the middle of the map
        setPedAimTarget ( ped, 10, 10, 5 ) -- set the ped's target to a point in North-East
end