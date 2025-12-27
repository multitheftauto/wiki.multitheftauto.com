addCommandHandler('cj', function()
    local p = Ped(0, 1, 1, 1)
    local m = localPlayer.matrix
    local pos = localPlayer.position
    
    p.position = Vector3(pos.x + m[2][1] * 2.5, pos.y + m[2][2] * 2.5, pos.z + m[2][3] * 2.5)
end)