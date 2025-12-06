function createClaymore(x, y, z, creator)
    local x, y, z = getElementPosition(creator)
    local claymoreObject = createObject(1945, x, y, z - 1, 0, 0, 90) -- create an object which looks like a claymore
    local claymoreCol = createColSphere(x, y, z, 1) -- create a col sphere with radius 1
    setElementData(claymoreCol, "type", "claymore") -- store the type of colshape so it can be retrieved
    setElementData(claymoreCol, "object", claymoreObject) -- store the object of the claymore
    setElementData(claymoreCol, "creatorPlayer", creator) -- store the person who created it
end

function claymoreHit(player, matchingDimension)
    if getElementData(source, "type") == "claymore" then -- ensure its a claymore
        -- retrieve the object associated to the claymore, and who created it
        local claymoreObject = getElementData(source, "object")
        local claymoreCreator = getElementData(source, "creatorPlayer")
        -- get the position of the claymore
        local x, y, z = getElementPosition(source)
        createExplosion(x, y, z, 12, claymoreCreator) -- create an explosion, associated to the creator, of a small size at the col's position
        -- destroy the claymore object, and the col shape so it doesnt trigger again.
        destroyElement(claymoreObject)
        destroyElement(source)
    end
end
addEventHandler("onColShapeHit", getRootElement(), claymoreHit)
