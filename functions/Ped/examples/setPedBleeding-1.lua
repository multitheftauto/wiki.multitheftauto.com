addCommandHandler("bleed", function()
    setPedBleeding(localPlayer, not isPedBleeding(localPlayer))
end)