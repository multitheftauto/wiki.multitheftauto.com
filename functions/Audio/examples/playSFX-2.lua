local bigsmoke = createPed(311,2550.53, -1284.81, 1060.98, 270)
setElementInterior(bigsmoke, 2)

function smokeDied()
    playSFX("spc_na", 32, 34)
    setTimer(playSFX, 1000, 1, "radio", "Beats", 9)
end
addEventHandler("onClientPedWasted", bigsmoke, smokeDied)