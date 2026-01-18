-- Allocate
local newTxdId = engineRequestTXD("MYTEX")

-- Remove
engineFreeTXD(newTxdId)