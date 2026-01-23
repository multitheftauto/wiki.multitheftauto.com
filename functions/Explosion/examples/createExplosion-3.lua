function fakeBombAt(el)
    if isElement(el) then
        local x, y, z = getElementPosition(el)
        triggerClientEvent("fakeBomb", root, x, y, z, 0)
    end
end

function onPlayerSpawnEvent(spawnpoint, team)
    fakeBombAt(source)
end

function onPlayerQuitEvent(reason)
    fakeBombAt(source)
end

function onPlayerDiedEvent(totalAmmo, killer, killerWeapon, bodypart)
    setTimer(fadeCamera, 2000, 1, source, false)
    fakeBombAt(source)
    setTimer(spawnPlayer, 4000, 1, source, 0, 0, 0)
    setTimer(fadeCamera, 4500, 1, source, true)
end

addEventHandler("onPlayerQuit", root, onPlayerQuitEvent)
addEventHandler("onPlayerWasted", root, onPlayerDiedEvent)
addEventHandler("onPlayerSpawn", root, onPlayerSpawnEvent)
