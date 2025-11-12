local showComponents = false
bindKey("F5", "down", function() showComponents = not showComponents end)

addEventHandler("onClientRender", root, function()
    if not showComponents then return end

    for _, veh in pairs(getElementsByType("vehicle", root, true)) do
        for compname in pairs(getVehicleComponents(veh)) do
            local x, y = getScreenFromWorldPosition(getVehicleComponentPosition(veh, compname, "world"))

            if x then
                dxDrawText(compname, x, y, 0, 0)
            end
        end 
    end
end)