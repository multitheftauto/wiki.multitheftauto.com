ped1 = createPed(112, 0, 0, 0) --Create our Ped
function died()
    outputConsole("Your Ped is dead now!")
end
addEventHandler("onPedWasted", ped1, died) --Add the Event when ped1 dies