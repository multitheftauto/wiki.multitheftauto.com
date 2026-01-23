-- *****************************************************************************
-- SERVER CODE
if fileExists("text.txt") then
    file = fileOpen("test.txt") -- Open a file (you can create it yourself).
    local data = fileRead(file, 100 * 1024 * 1024) -- Max 100 MB
    fileClose(file) -- Close File
    triggerLatentClientEvent("onClientReadFile", 5000, false, root, data) -- trigger - Avoid triggering to root element (Read note above)
end

-- *****************************************************************************
-- CLIENT CODE
addEvent("onClientReadFile", true)
addEventHandler("onClientReadFile", root, function(data)
    local file = fileCreate("text.txt") -- Save "data" into "text.txt"
    fileWrite(file, data)
    fileClose(file)
end)
