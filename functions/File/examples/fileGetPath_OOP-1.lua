local newFile = File.new("test.txt")                -- attempt to create a new file
if (newFile) then                                       -- check if the creation succeeded
    local path = newFile.path
    root:outputChat("New file created at: "..path, 0, 255, 0)
    newFile:close()                                -- close the file once you're done with it
end