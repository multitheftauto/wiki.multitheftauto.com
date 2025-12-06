local hFile = fileOpen("test.txt") -- attempt to open the file (read and write mode)
if hFile then -- check if it was successfully opened
    fileSetPos(hFile, fileGetSize(hFile)) -- move position to the end of the file
    fileWrite(hFile, "hello") -- append data
    fileFlush(hFile) -- Flush the appended data into the file.
    fileClose(hFile) -- close the file once we're done with it
else
    outputConsole("Unable to open test.txt")
end
