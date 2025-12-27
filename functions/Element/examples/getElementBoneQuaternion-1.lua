local playerBone = 1
local playerBoneX, playerBoneY, playerBoneZ, playerBoneW

addEventHandler("onClientResourceStart", resourceRoot, function()
    playerBoneX, playerBoneY, playerBoneZ, playerBoneW = getElementBoneQuaternion(localPlayer, playerBone)
end)