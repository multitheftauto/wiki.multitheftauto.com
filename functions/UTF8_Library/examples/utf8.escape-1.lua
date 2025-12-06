local output = utf8.escape("%123 %u123 %{123} %u{123} %xABC %x{ABC}")
print(output) -- { { { { ઼ ઼

local output = utf8.escape("%%123 %? %d %%u")
print(output) -- %123 ? d %u
