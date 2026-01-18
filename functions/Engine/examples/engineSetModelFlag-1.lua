local txd = engineLoadTXD("glass.txd")
local dff = engineLoadDFF("glass.dff", 1649)

engineImportTXD(txd, 1649)
engineReplaceModel(dff, 1649, true)

engineSetModelFlag(1649, 'draw_last', true)