local edit = guiCreateEdit( 0.4, 0.4, 0.3, 0.1, "", true )

addEventHandler( "onClientGUIChanged", edit,
    function( )
        outputChatBox( "Characters remaining in edit box: " .. guiEditGetMaxLength( source ) - #guiGetText( source ) ) -- output remaining amount of characters
    end
)