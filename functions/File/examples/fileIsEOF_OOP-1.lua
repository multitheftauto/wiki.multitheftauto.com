local hFile = File("test.txt", true)       -- attempt to open the file (read only)
if (hFile) then                                  -- check if it was successfully opened
    local buffer
    while not hFile.eof do              -- as long as we're not at the end of the file...
        buffer = hFile:read(500)          -- ... read the next 500 bytes...
        outputConsole(buffer)                  -- ... and output them to the console
    end
    hFile:close()                           -- close the file once we're done with it
else
    outputConsole("Unable to open test.txt")
end