function checkDynamicID(cmd, modelID)
    modelID = tonumber(modelID)
    local isDynamicModel = Engine.getModelPhysicalPropertiesGroup(modelID) ~= -1
    outputChatBox("Model ID " .. modelID .. " is ".. (isDynamicModel and "dynamic" or "static") .. ".")
end
addCommandHandler("checkdyn", checkDynamicID)