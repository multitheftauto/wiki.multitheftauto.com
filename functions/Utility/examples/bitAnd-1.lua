local flags = 0x23 -- binary: 100011b
local mask = 0x20  -- binary: 100000b

-- Check if bit 1 is set
if bitAnd(flags, mask) ~= 0 then
    outputDebugString("Yeah. It's set")
else
    outputDebugString("I'm sorry ;(")
end