addCommandHandler('setangularvelocity', function(plr, cmd, vx, vy, vz)
    if (not tonumber(vx) or not tonumber(vy) or not tonumber(vz)) then
        plr:outputChat('Usage: /' .. cmd .. ' <vx> <vy> <vz>', 255, 0, 0)
        return
    end

    local vehicle = plr.vehicle
    if (not vehicle) then
        return
    end

    vehicle.angularVelocity = Vector3(tonumber(vx), tonumber(vy), tonumber(vz))
end)