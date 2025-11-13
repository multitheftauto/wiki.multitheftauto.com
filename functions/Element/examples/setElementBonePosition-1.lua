local bones = {
    [4] = Vector3(0, 0, 0.15),
    [5] = Vector3(0, 0, 0.15),
    [6] = Vector3(0, 0, 0.13),
    [7] = Vector3(0, 0, 0.13),
    [8] = Vector3(0, 0, 0.1),
}
function updatePed()
    for bone,v in pairs(bones) do
        local pos = localPlayer:getBonePosition(bone)+v
        setElementBonePosition(localPlayer, bone, pos)
    end
end
addEventHandler("onClientPedsProcessed", root, updatePed)