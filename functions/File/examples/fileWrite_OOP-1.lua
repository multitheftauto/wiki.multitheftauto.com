local fileHandle = File.new("test.txt")             -- attempt to create a new file
if (fileHandle) then                                    -- check if the creation succeeded
    fileHandle:write("This is a test file!")     -- write a text line
    fileHandle:close()                             -- close the file once you're done with it
end