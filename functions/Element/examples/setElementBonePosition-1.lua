local bones = {
    [4] = {0, 0, 0.15},
    [5] = {0, 0, 0.15},
    [6] = {0, 0, 0.13},
    [7] = {0, 0, 0.13},
    [8] = {0, 0, 0.1},
}

function updatePed()
    for bone, v in pairs(bones) do
        local boneX, boneY, boneZ = getElementBonePosition(localPlayer, bone)
        setElementBonePosition(localPlayer, bone, boneX + v[1], boneY + v[2], boneZ + v[3])
    end
end
addEventHandler("onClientPedsProcessed", root, updatePed)