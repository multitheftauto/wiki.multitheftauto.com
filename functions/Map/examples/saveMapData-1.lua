local mapFile = xmlCreateFile("saved.map", "map")

if mapFile then
	saveMapData(mapFile, resourceRoot)
	xmlSaveFile(mapFile)
	xmlUnloadFile(mapFile)
end