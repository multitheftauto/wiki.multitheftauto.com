local pLabel = guiCreateLabel( 0.5, 0.5, 0.5, 0.5, 'Text', true )
guiLabelSetColor( pLabel, math.random( 0, 255 ), math.random( 0, 255 ), math.random( 0, 255 ) )

addCommandHandler( 'get_color_label', 
    function()
        local iR, iG, iB = guiLabelGetColor( pLabel )
        outputChatBox( ( 'Label color is r = %d, g = %d, b = %d' ):format( iR, iG, iB ) )
    end
)