addEventHandler("onPlayerTarget", root, function(targetElem)
    if (isElement(targetElem)) and (getElementType(targetElem) == "object") and (getElementModel(targetElem) == 3374) then
        destroyElement(targetElem)
    end
end)
