local elementSyncer = getElementSyncer(getElementsByType("ped")[1])
if elementSyncer and getElementType(elementSyncer) == "player" then --Check if its a player and if there is a syncer
    killPed(elementSyncer, elementSyncer)
end