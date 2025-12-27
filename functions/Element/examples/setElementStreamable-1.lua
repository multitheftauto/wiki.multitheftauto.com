local function testNonStreamableObjects()
    local object = createObject(1097, 0, 0, 5)
    setElementStreamable(object, false) -- Make the object always be streamed in
end
addEventHandler("onClientResourceStart", resourceRoot, testNonStreamableObjects)
