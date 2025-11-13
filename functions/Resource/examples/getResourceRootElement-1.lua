-- get the root element of this resource (the resource that the script is a part of)
resourceRoot = getResourceRootElement()

-- create a function to handle the onResourceStart event
function onCurrentResourceStart(theResource)
    local resourceName = getResourceName(theResource)
    outputChatBox("Hello and welcome to " .. resourceName .. "!")
end

-- add the event handler
addEventHandler("onResourceStart", resourceRoot, onCurrentResourceStart)