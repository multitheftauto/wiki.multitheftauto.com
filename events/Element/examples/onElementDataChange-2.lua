function checkChange(theKey, oldValue)
    -- The client can only set 'special_thing' on its own player
    if (theKey== "special_thing") and (client ~= source) then
        outputChatBox("Illegal setting of " .. tostring(theKey) .. "' by '" .. tostring(getPlayerName(client)))
        setElementData(source, theKey, oldValue) -- Set back the original value
    end
end
addEventHandler("onElementDataChange", root, checkChange)