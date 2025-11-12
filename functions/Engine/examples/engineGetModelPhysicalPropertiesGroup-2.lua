function checkID(player, id)
    id = tonumber(id)
    local group = engineGetModelPhysicalPropertiesGroup(id)
    outputChatBox("Model ID " .. id .. "'s group is: " .. tostring(group))
end
addCommandHandler("checkID", checkID)