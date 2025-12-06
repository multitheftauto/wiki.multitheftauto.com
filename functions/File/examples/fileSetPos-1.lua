local hFile = fileOpen("test.dat") -- attempt to open the file
if hFile then -- check if it succeeded
    fileSetPos(hFile, 8) -- set the read/write position
    local readByte = fileRead(hFile, 1) -- read one byte from this position
    outputConsole("Byte at position 8 = " .. string.byte(readByte)) -- output it
    fileClose(hFile) -- close the file
else
    outputConsole("Unable to open test.dat")
end
