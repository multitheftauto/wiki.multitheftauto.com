function getBoneRotation (commandName, boneId)
    if not tonumber (boneId) then
        outputChatBox ("You didn't insert an bone ID!", 255, 0, 0)
        return false
    end

    local x, y, z = getElementBoneRotation (localPlayer, boneId)
    outputChatBox ("The bone rotation is: "..x..", "..y..", "..z)
end

addCommandHandler ("getbonerotation", getBoneRotation)