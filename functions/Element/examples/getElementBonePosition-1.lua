function getBonePosition(commandName, boneId)
    if not tonumber(boneId) then
        outputChatBox("You didn't insert an bone ID!", 255, 0, 0)
        return false
    end

    local x, y, z = getElementBonePosition(localPlayer, boneId)
    outputChatBox("The bone position is: " .. x .. ", " .. y .. ", " .. z)
end

addCommandHandler("getboneposition", getBonePosition)
