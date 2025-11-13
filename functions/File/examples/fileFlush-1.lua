local fileHandle = fileCreate("test.txt")
if fileHandle then
    fileWrite(fileHandle, "Line 1")
    fileFlush(fileHandle)
    -- ... further writing operations
    fileClose(fileHandle)
end