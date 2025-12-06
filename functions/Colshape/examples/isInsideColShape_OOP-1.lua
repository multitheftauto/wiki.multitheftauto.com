function isElementInsideColShape(theElement, theColShape)
    return theColShape:isInside(getElementPosition(theElement))
end