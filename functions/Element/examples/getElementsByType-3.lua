function createGasStations(below)
    local gasstations = getElementsByType ( "gasstation", below ) -- get a table of all the gas station elements in the element tree
    for theKey,theGasStation in ipairs(gasstations) do 
        local x = getElementData(theGasStation, "posX") -- get the position of the element
        local y = getElementData(theGasStation, "posY")
        local z = getElementData(theGasStation, "posZ")
        setElementParent(createColSphere(x, y, z, 10), theGasStation) -- create a colshape for the gas station at the gas station's position
        addEventHandler("onColShapeHit", theGasStation, giveGas) -- when the player hits
    end
end

function mapLoad()
    createGasStations(source) -- create gas stations for the map that's just loaded
end
addEventHandler("onResourceStart", resourceRoot, mapLoad)

function giveGas(hittingElement)
    local theGasStation = source
    if getElementType(hittingElement) == "vehicle" then
        local gas_left = getElementData(theGasStation, "amount")
        local gas_speed = getElementData(theGasStation, "speed")
        if gas_left > 0 then

            local gas_to_remove = gas_speed 
            if gas_left < gas_speed then
                gas_to_remove = gas_left

            local current_vehicle_gas = getElementData(hittingElement, "gas")
            current_vehicle_gas = current_vehicle_gas + gas_to_remove
            gas_left = gas_left - gas_to_remove

            setElementData(hittingElement, "gas", current_vehicle_gas)
            setElementData(theGasStation, "amount", gas_left)
        else
            outputChatBox("Pump is out of gas!")
        end
    end
end