local syncedPeds = 0

for k, v in ipairs(Element.getAllByType('ped', root, true)) do
    if v.syncedByLocalPlayer then
        syncedPeds = syncedPeds + 1
    end
end

print('Number of streamed-in peds synced by local player: ' .. syncedPeds)