local value = 0xFFFFFFFF -- binary: 1111 1111 1111 1111 1111 1111 1111 1111, decimal: 4.294.967.295
local positions = 0x4 -- binary: 0100, decimal: 4
local shifted = bitLShift( value, positions ) -- binary: 1111 1111 1111 1111 1111 1111 1111 0000, decimal: 4.294.967.280

-- Comparsion:
-- binary: 1111 1111 1111 1111 1111 1111 1111 1111, decimal: 4.294.967.295
-- binary: 1111 1111 1111 1111 1111 1111 1111 0000, decimal: 4.294.967.280