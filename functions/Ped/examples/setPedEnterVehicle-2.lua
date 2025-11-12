-- Code works only if client is syncing ped Sweet
addCommandHandler ("sweetentercar",
function()
    local sweet = getElementByID ("sweet")

    if isElementSyncer (sweet) then
        setPedEnterVehicle (sweet, getElementByID("sweetscar"), true)
    end
end)