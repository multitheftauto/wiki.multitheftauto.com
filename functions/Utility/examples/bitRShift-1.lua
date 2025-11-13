local value = 0xFFFFFFFF -- binary: 1111 1111 1111 1111 1111 1111 1111 1111, decimal: 4.294.967.295
local positions = 0x4 -- binary: 0100, decimal: 4
local shifted = bitRShift( value, positions ) -- binary: 0000 1111 1111 1111 1111 1111 1111 1111, decimal: 26.8435.455

-- Comparsion:
-- binary: 1111 1111 1111 1111 1111 1111 1111 1111, decimal: 4.294.967.295
-- binary: 0000 1111 1111 1111 1111 1111 1111 1111, decimal: 26.8435.455