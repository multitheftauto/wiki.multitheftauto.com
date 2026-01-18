function checkDynamicID(cmd, modelID)
    modelID = tonumber(modelID)
    local isDynamicModel = engineGetModelPhysicalPropertiesGroup(modelID) ~= -1
    outputChatBox("Model ID " .. modelID .. " is ".. (isDynamicModel and "dynamic" or "static") .. ".")
end
addCommandHandler("checkdyn", checkDynamicID)