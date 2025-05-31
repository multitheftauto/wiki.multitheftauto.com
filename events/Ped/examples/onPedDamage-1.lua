local ped1 = createPed(112, 0, 0, 0) -- create our ped

function pedDamaged(loss)
    outputConsole("ped1 damaged! loss: " .. tostring(loss))
end

addEventHandler("onPedDamage", ped1, pedDamaged) -- triggered only when ped1 gets damaged