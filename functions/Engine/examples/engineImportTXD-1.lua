local txd = engineLoadTXD("infernus.txd")
local dff = engineLoadDFF("infernus.dff")

engineImportTXD(txd, 411)
engineReplaceModel(dff, 411)