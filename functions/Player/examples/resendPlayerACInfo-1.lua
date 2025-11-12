addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,player in ipairs( getElementsByType("player") ) do
            resendPlayerACInfo( player )
        end
    end
)