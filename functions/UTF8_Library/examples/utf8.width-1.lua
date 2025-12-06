local input = "днём"
local disabled = utf8.width(input, false)
local enabled = utf8.width(input, true)

print(disabled, enabled) -- 4, 8
