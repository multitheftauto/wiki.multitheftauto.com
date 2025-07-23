function readFile(path)
    local file = File(path) -- attempt to open the file
    if (not file) then
        return false -- stop function on failure
    end
    local count = file.size -- get file's total size
    local data = file:read(count) -- read whole file
    file:close() -- close the file once we're done with it
    outputConsole(data) -- output code in console
end

addCommandHandler("readfile",function(cmd,fileName) -- add command to test this function
    readFile(fileName) -- execute the function
end)