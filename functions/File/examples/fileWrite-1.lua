local fileHandle = fileCreate("test.txt") -- attempt to create a new file
if fileHandle then -- check if the creation succeeded
    fileWrite(fileHandle, "This is a test file!") -- write a text line
    fileClose(fileHandle) -- close the file once you're done with it
end
