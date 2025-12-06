local hFile = File("test.dat") -- attempt to open the file
if hFile then -- check if it succeeded
    hFile.pos = 8 -- set the read/write position
    local readByte = hFile:read(1) -- read one byte from this position
    outputConsole("Byte at position 8 = " .. string.byte(readByte)) -- output it
    hFile:close() -- close the file
else
    outputConsole("Unable to open test.dat")
end
