function readFile(path)
    local file = fileOpen(path) -- attempt to open the file
    if not file then
        return false -- stop function on failure
    end
    local count = fileGetSize(file) -- get file's total size
    local data = fileRead(file, count) -- read whole file
    fileClose(file) -- close the file once we're done with it
    outputConsole(data) -- output code in console
end

addCommandHandler("readfile",function(cmd,fileName) -- add command to test this function
    readFile(fileName) -- execute the function
end)