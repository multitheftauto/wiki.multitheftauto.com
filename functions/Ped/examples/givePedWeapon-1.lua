function cmdArmedPed( command )
    local x, y, z = getElementPosition(localPlayer) -- Get your position
    local thePed = createPed(0, x + 1, y, z) -- Create a CJ ped nearby
    givePedWeapon(thePed, 31, 5000, true) -- Give him 5000 rounds of M4
    setControlState(thePed, "fire", true) -- Make him shoot continuously
end
addCommandHandler("armedped", cmdArmedPed)