Firewall = 
{
    [ 'AccountName' ] = 'SerialPlayer',
    [ '3ash8' ] = '9C9F3B55D9D7BB7135FF274D3BF444E4',
    [ 'test5' ] = '1D6F76CF8D7193792D13789849498452',
}
 
addEventHandler ( 'onPlayerLogin', root,
    function ( _, theCurrentAccount )
    local Serial = Firewall[getAccountName(theCurrentAccount)]
        if ( Serial ) then
            if Serial ~= getPlayerSerial ( source ) then
                banPlayer ( source, false, false, true, root, 'reason ban' )
            end
        end
    end
)