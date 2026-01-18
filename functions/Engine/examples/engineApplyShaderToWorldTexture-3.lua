local theTechnique = dxCreateShader("shader.fx")

function applyShader(thePlayer, seat)
    local theVehicle = source

    if seat == 0 and thePlayer == localPlayer then
        engineApplyShaderToWorldTexture(theTechnique, "vehiclegrunge256", theVehicle)
        engineApplyShaderToWorldTexture(theTechnique, "?emap*", theVehicle)
    end
end
addEventHandler("onClientVehicleEnter", root, applyShader)

function removeShader(thePlayer, seat)
    local theVehicle = source

    if seat == 0 and thePlayer == localPlayer then
        engineRemoveShaderFromWorldTexture(theTechnique, "vehiclegrunge256", theVehicle)
        engineRemoveShaderFromWorldTexture(theTechnique, "?emap*", theVehicle)
    end
end
addEventHandler("onClientVehicleExit", root, removeShader)
