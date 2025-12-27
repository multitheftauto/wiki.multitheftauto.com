function freeElement(theElement)
    if (theElement.attached) then -- If the specified element is attached to something
        theElement.attached:detach() -- Detach it.
    else
        outputChatBox("Element is not attached") -- If not, say it wasn't attached in the first place.
    end
end
