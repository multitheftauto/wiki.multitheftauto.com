function getTargetModelNameAndID(target) 
    if (isElement(target) and getElementType(target) == "object") then 
        local modelName = tostring(engineGetModelNameFromID(getElementModel(target)))
        outputChatBox("Name: "..modelName)
        -- Although we could just use getElementModel(target) for this example we will use modelName
        outputChatBox("ID: "..tostring(engineGetModelIDFromName(modelName)))
    end
end
addEventHandler("onClientPlayerTarget", localPlayer, getTargetModelNameAndID)