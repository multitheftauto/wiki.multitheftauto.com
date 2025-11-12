local playerBone = 1
local playerBoneX, playerBoneY, playerBoneZ = 0.577, 0.577, 0.577
local playerBoneW = 0

addEventHandler("onClientPedsProcessed", root,
    function()
        setElementBoneQuaternion(localPlayer, playerBone, playerBoneX, playerBoneY, playerBoneZ, playerBoneW)
        updateElementRpHAnim(localPlayer)
    end
)