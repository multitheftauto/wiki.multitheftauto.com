function newPed()
    local x, y, z = getElementPosition(localPlayer)
    local ped = createPed(0, x + 1, y, z)
    if ped then 
        setPedControlState(ped, "forwards", true)
    end 
end
addCommandHandler("ped", newPed)