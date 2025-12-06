local newFile = fileCreate("test.txt") -- attempt to create a new file
if (newFile) then -- check if the creation succeeded
    fileWrite(newFile, "This is a test file!") -- write a text line
    local size = fileGetSize(newFile) -- get size
    if size then
        outputChatBox("Size of test.txt is: " .. size, source) -- output size
    end
    fileClose(newFile) -- close the file once you're done with it
end
