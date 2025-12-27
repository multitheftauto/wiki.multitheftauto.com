addEventHandler("onClientPedsProcessed", root, function()
    for _, v in pairs(getElementsByType('player')) do
        setElementLighting(v, 10)
    end
    
    for _, v in pairs(getElementsByType('vehicle')) do
        setElementLighting(v, 10)
    end
end)
