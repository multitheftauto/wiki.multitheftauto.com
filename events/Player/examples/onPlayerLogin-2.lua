Firewall = 
{
--  [ 'accountName' ] = 'playerSerial',
    [ '3ash8' ] = '9C9F3B55D9D7BB7135FF274D3BF444E4',
    [ 'test5' ] = '1D6F76CF8D7193792D13789849498452',
}
 
addEventHandler ( 'onPlayerLogin', getRootElement ( ),
    function ( _, theCurrentAccount )
    local Serial = Firewall[getAccountName(theCurrentAccount)]
        if Serial and Serial ~= getPlayerSerial ( source ) then
            outputChatBox( "Sorry, you're not allowed to access this account.", source)
            cancelEvent( true )
        end
    end
)