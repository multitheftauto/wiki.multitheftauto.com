policeVehicles = { [598]=true, [596]=true, [597]=true, [599]=true }
policeSkins = { [280]=true, [281]=true, [282]=true, [283]=true, [284]=true, [285]=true, [286]=true }

function enterVehicle ( theVehicle, seat, jacked ) --when a player enters a vehicle
    if ( policeVehicles[getElementModel ( theVehicle )] ) and ( not policeSkins[getElementModel ( source )] ) then -- if the vehicle is one of 4 police cars, and the skin is not a police skin
        removePedFromVehicle ( source ) -- force the player out of the vehicle
        outputChatBox ( "Only policeman can enter police cars!", source ) -- and tell the player why
    end
end
addEventHandler ( "onPlayerVehicleEnter", root, enterVehicle ) -- add an event handler for onPlayerVehicleEnter