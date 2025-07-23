local newFile = File.new("test.txt")                -- attempt to create a new file
if (newFile) then                                       -- check if the creation succeeded
    newFile:write("This is a test file!")        -- write a text line
    newFile:close()                                -- close the file once you're done with it
end