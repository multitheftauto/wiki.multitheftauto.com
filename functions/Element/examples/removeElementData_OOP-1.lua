function onPlayerSpawn()
    source:setData("playerSpawned", true)
end
addEventHandler("onPlayerSpawn", root, onPlayerSpawn)

function onPlayerWasted()
    source:removeData("playerSpawned")
end
addEventHandler("onPlayerWasted", root, onPlayerWasted)