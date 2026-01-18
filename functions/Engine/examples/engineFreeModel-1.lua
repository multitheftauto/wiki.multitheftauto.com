local peds = {}
function createAllocatedPed()
    local x, y, z = getElementPosition(localPlayer)
    local id = engineRequestModel("ped")
    peds[id] = createPed(id, x+0.5, y, z+0.5)
    outputChatBox("New ped with ID "..id.." created.")
end
addCommandHandler("cap", createAllocatedPed, false, false)

function skinAllocatedPeds()
    local txd, dff;
    for id, ped in pairs(peds) do
        if fileExists("skins/" .. id .. ".txd") and fileExists("skins/" .. id .. ".dff") then
            txd = engineLoadTXD("skins/" .. id .. ".txd")
            engineImportTXD(txd, id)
            
            dff = engineLoadDFF("skins/" .. id .. ".dff")
            engineReplaceModel(dff, id)

            outputChatBox("Model ID "..id.." changed correctly.")
        else
            outputChatBox("Model ID "..id.." couldn't change. REASON: skins/" .. id .. ".txd or skins/" .. id .. ".dff does not exist.")
        end
    end
end
addCommandHandler("sap", skinAllocatedPeds, false, false)

function onStop()
    for id,ped in pairs(peds) do
        engineFreeModel(id)
    end
end
addEventHandler("onClientResourceStop", resourceRoot, onStop)