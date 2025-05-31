function outputChange(theKey, oldValue, newValue)
    if (getElementType(source) == "player") then -- check if the element is a player
        outputChatBox("Your element data '" .. tostring(theKey) .. "' has changed from '" .. tostring(oldValue) .. "' to '" .. tostring(newValue) .. "'", source) -- output the change for the affected player
    end
end
addEventHandler("onElementDataChange", root, outputChange)