function handleVehicleDamage(attacker, weapon, loss, x, y, z, tire)
    if (weapon and getElementModel(source) == 601) then
        -- A weapon was used and the vehicle model ID is that of the SWAT tank so cancel the damage.
        cancelEvent()
    end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)