function setPolygonsHeight()
    for i, v in ipairs(getElementsByType("colshape")) do
        if (getColShapeType(v) == 4) then -- if it's a polygon colshape do it otherwise don't
            setColPolygonHeight(v, false, 50)
        end
    end
end
addEventHandler("onResourceStart", resourceRoot, setPolygonsHeight)
