function writeMsg (fileResource, fileName, fileSize, state)
    local resourceName = getResourceName( fileResource )
    outputChatBox ( "Resource name: " .. resourceName .. ", file name: " .. fileName .. ", size: " .. fileSize .. ", state: " .. state)
end

addEventHandler ("onClientResourceFileDownload", root, writeMsg)