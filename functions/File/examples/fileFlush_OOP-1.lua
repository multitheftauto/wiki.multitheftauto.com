local fileHandle = File.new("test.txt")
if (fileHandle) then
    fileHandle:write("Line 1")
    fileHandle:flush()
    -- ... further writing operations
    fileHandle:close()
end