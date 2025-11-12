function onPlayerSpawn()
    setElementData(source, "playerSpawned", true)
end
addEventHandler("onPlayerSpawn", root, onPlayerSpawn)

function onPlayerWasted()
    removeElementData(source, "playerSpawned")
end
addEventHandler("onPlayerWasted", root, onPlayerWasted)