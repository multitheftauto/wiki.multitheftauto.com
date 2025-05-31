addEventHandler("onClientPlayerHitByWaterCannon",getRootElement(),
    function(player)
        local driver = getVehicleOccupant(source)
        if isElement(driver) then
            outputChatBox(getPlayerName(player).." is hit by the cannon of "..getPlayerName(driver).."'s vehicle.")
        end
    end
)