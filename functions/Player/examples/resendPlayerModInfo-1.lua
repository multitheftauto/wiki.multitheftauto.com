addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,player in ipairs( getElementsByType("player") ) do
            resendPlayerModInfo( player )
        end
    end
)