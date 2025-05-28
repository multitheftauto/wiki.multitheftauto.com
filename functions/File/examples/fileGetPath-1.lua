local newFile = fileCreate("test.txt")                -- attempt to create a new file
if (newFile) then                                       -- check if the creation succeeded
    local path = fileGetPath(newFile)
    outputChatBox("New file created at: "..path, root, 0, 255, 0)
    fileClose(newFile)                                -- close the file once you're done with it
end