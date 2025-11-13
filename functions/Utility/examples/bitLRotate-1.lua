local value = 0xF -- binary: 1111, decimal: 15
local positions = 0x1 -- binary: 0001, decimal: 1
local shifted = bitLRotate( value, positions ) -- binary: 0001 1110, decimal: 30

local value = 0xF -- binary: 1111, decimal: 15
local positions = 0x3 -- binary: 0011, decimal: 3
local shifted = bitLRotate( value, positions ) -- binary: 0111 1000, decimal: 120

local value = 0x3F -- binary: 0011 1111, decimal: 63
local positions = 0xA -- binary: 1010, decimal: 10
local shifted = bitLRotate( value, positions ) -- binary: 1111 1100 0000 0000, decimal: 64.512