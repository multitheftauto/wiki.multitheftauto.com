function onClientColShapeHit(theElement, matchingDimension)
    if (isElementStreamable(theElement)) then -- Checks whether the element is streamable
        outputChatBox("Element is streamable")
    else
        outputChatBox("Element not streamable")
    end
end
addEventHandler("onClientColShapeHit", root, onClientColShapeHit)
