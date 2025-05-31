addEventHandler("onClientWorldSound", root, function()
    if getElementType(source) == "vehicle" then
        cancelEvent()
    end
end)