addEventHandler( "onWeaponFire", root,
    function ()
        if ( isElement( source ) ) and ( getElementType( source ) == "player" ) then
            outputChatBox( "You fired a weapon!", source, 0, 225, 0 )
        end
    end
)