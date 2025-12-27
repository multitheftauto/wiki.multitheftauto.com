function testKill(player, commandName)
    local idlewoodPed = createPed(26, 1813.27, -1897.04, 13.577)
    local elementSyncer = getElementSyncer(idlewoodPed)
    if elementSyncer and getElementType(elementSyncer) == "player" then -- Check if its a player and if there is a syncer
        killPed(elementSyncer, elementSyncer)
    end
end
addCommandHandler("testkill", testKill)
