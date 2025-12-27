function freeElement(theElement)
    if (isElementAttached(theElement)) then -- If the specified element is attached to something
        detachElements(theElement) -- Detach it.
    else
        outputChatBox("Element is not attached") -- If not, say it wasn't attached in the first place.
    end
end
