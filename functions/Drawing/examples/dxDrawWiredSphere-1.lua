local BONE_IDS = {1, 2, 3, 4, 5, 6, 7, 8, 21, 22, 23, 24, 25, 26, 31, 32, 33, 34, 35, 36, 41, 42, 43, 44, 51, 52, 53, 54}

addEventHandler('onClientRender', root, function()
    for k, v in ipairs(BONE_IDS) do
        local x, y, z = getPedBonePosition(localPlayer, v)
        local color = tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), math.random(0, 255))
        dxDrawWiredSphere(x, y, z, 0.1, color, 0.1, 4)
    end
end)