local hFile = File("test.txt")             -- attempt to open the file (read and write mode)
if (hFile) then                                  -- check if it was successfully opened
    hFile.pos = hFile.size  -- move position to the end of the file
    hFile:write("hello" )                 -- append data
    hFile:flush()                           -- Flush the appended data into the file.
    hFile:close()                           -- close the file once we're done with it
else
    outputConsole("Unable to open test.txt")
end