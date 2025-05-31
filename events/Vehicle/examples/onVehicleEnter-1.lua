policeVehicles = { [598]=true, [596]=true, [597]=true, [599]=true }
policeSkins = { [280]=true, [281]=true, [282]=true, [283]=true, [284]=true, [285]=true, [286]=true }

function enterVehicle ( thePlayer, seat, jacked ) -- when a player enters a vehicle
    if ( policeVehicles[getElementModel ( source )] ) and ( not policeSkins[getElementModel ( thePlayer )] ) then -- if the vehicle is one of 4 police cars, and the skin is not a police skin
        removePedFromVehicle ( thePlayer ) -- force the player out of the vehicle
        outputChatBox ( "Only policeman can enter police cars!", thePlayer ) -- and tell the player why
    end
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle ) -- add an event handler for onVehicleEnter