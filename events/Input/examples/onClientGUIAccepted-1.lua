editBox = guiCreateEdit ( 0.3, 0.1, 0.4, 0.1, "", true )
addEventHandler( "onClientGUIAccepted", editBox,
    function( theElement ) 
        outputChatBox( guiGetText( theElement ) )
    end
)