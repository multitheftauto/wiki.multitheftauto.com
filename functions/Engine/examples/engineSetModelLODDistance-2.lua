function replaceObjects()
	local col1 = engineLoadCOL("map1.col")
	local col2 = engineLoadCOL("map2.col")

	local txd = engineLoadTXD("map.txd")
	engineImportTXD(txd, 2357)
	engineImportTXD(txd, 2290)

	local dff1 = engineLoadDFF("map1.dff")
	local dff2 = engineLoadDFF("map2.dff")

	engineReplaceCOL(col1, 2357)
	engineReplaceCOL(col2, 2290)
	engineReplaceModel(dff1, 2357)
	engineReplaceModel(dff2, 2290)

	engineSetModelLODDistance(2357, 325)
	engineSetModelLODDistance(2290, 325)
end