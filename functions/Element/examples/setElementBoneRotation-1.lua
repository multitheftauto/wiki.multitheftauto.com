local customYaw = 0
local shoulders = {22, 32}

setTimer (function ()
    customYaw = customYaw + 20
end, 10, 0)

function changeBoneRotation ()
    local yaw, pitch, roll = getElementBoneRotation(localPlayer, 2) -- Get the element's bone rotation
    setElementBoneRotation(localPlayer, 2, customYaw, pitch, roll) -- Set the elements' bone rotation with custom yaw

    for key, value in pairs(shoulders) do
       setElementBoneRotation(localPlayer, value, 0, 0, 0) -- Update the ped's shoulders rotation
    end

    updateElementRpHAnim(localPlayer) -- Update the ped's bone animations
end
addEventHandler("onClientPedsProcessed", root, changeBoneRotation)