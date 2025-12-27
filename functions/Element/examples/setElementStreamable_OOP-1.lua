local function testNonStreamableObjects()
    local object = Object(1097, 0, 0, 5)
    object.streamable = false -- Make the object always be streamed in
end
addEventHandler("onClientResourceStart", resourceRoot, testNonStreamableObjects)
