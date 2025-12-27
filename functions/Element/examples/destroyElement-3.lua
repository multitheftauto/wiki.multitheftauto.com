function createClaymore(x, y, z, creator)
    local claymoreObject = createObject(1945, x, y, z - 1, 0, 0, 90) -- create an object which looks like a claymore
    local claymoreCol = createColSphere(x, y, z, 1) -- create a col sphere with radius 1
    setElementData(claymoreCol, "object", claymoreObject) -- store the object of the claymore
    setElementData(claymoreCol, "creatorPlayer", creator) -- store the person who created it
    addEventHandler("onColShapeHit", claymoreCol, claymoreHit) -- add an event handler to the colshape
end

function claymoreHit(thePlayer, matchingDimension)
    -- retrieve the object associated to the claymore, and who created it
    local claymoreObject = getElementData(source, "object")
    local claymoreCreator = getElementData(source, "creatorPlayer")
    -- get the position of the claymore
    local x, y, z = getElementPosition(source)
    createExplosion(x, y, z, 12, claymoreCreator) -- create an explosion, associated to the creator, of a small size at the col's position
    -- remove the event handler for the colshape
    removeEventHandler("onColShapeHit", source, claymoreHit)
    -- destroy the claymore object, and the col shape so it doesn't trigger again.
    destroyElement(claymoreObject)
    destroyElement(source)
end
