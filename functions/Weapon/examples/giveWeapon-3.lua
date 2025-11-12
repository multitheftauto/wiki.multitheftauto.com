ped = createPed( 19, -1634.5775, 1203.85, 7.1796 )

addCommandHandler( "give",
  function ( player, command, id, amount )
    if not tonumber ( id ) then return end

    if not tonumber ( amount ) then
        amount = 9001
    end

    giveWeapon( ped, id, amount, true )
  end
)