addEventHandler( "onResourceStop", root,
    function( resource )
        outputChatBox( "The resource " .. getResourceName( resource ) .. " was stopped!", root )
    end
)