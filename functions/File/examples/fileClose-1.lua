local newFile = fileCreate("test.txt") -- attempt to create a new file
if newFile then -- check if the creation succeeded
    fileWrite(newFile, "This is a test file!") -- write a text line
    fileClose(newFile) -- close the file once you're done with it
end
