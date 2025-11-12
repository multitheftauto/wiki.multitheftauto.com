-- Choke all the players when the resource starts

function onResourceStart()
    setPedChoking(root, true)
end
addEventHandler("onResourceStart", resourceRoot, onResourceStart)

-- Unchoke all the players when the resource stops

function onResourceStop()
    setPedChoking(root, false)
end
addEventHandler("onResourceStop", resourceRoot, onResourceStop)

-- Choke players spawning

function onPlayerSpawn()
    setPedChoking(source, true)
end
addEventHandler("onPlayerSpawn", root, onPlayerSpawn)