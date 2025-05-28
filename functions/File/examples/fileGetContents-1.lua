local handle = fileOpen("code.lua", true)
local buffer = fileGetContents(handle) -- code.lua must be listed in meta.xml (for example as <file> for this example)
fileClose(handle)

if buffer then
    loadstring(buffer)() -- This is just an example. You should avoid using loadstring. If you are dealing with configuration use json functions instead for security reasons.
end