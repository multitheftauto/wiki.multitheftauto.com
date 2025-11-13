function getTargetModelName(target) 
    if ( isElement(target) and getElementType(target) == "object" ) then 
        outputChatBox(tostring(engineGetModelNameFromID(getElementModel(target))))
    end
end
addEventHandler("onClientPlayerTarget", localPlayer, getTargetModelName)