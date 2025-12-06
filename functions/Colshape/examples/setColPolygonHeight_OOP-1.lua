function setPolygonsHeight()
    for i, v in ipairs(Element.getAllByType('colshape')) do
        if (v.shapeType == 4) then -- if it's a polygon colshape do it otherwise don't
            v:setHeight(false, 50)
        end
    end
end
addEventHandler("onResourceStart", resourceRoot, setPolygonsHeight)
