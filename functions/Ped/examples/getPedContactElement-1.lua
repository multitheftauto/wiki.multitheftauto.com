function outputContactVehicleMessage ( thePlayer )
    local elementStandingOn = getPedContactElement ( thePlayer )
    if elementStandingOn and getElementType ( elementStandingOn ) == "vehicle" then
        local vehicleName = getVehicleName ( elementStandingOn )
        outputChatBox( "You're standing on a " .. vehicleName .. "." )
    else
        outputChatBox( "You're not standing on any vehicle." )
    end
end