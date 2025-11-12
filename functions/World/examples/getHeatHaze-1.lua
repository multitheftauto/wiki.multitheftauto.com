addCommandHandler( 'get_haze',
	function( )
		local tNew = { getHeatHaze ( ) }
		outputChatBox( 
			string.format( 
				'intensity = %s ;randomShift = %s ;speedMin = %s ;speedMax = %s ;scanSizeX = %s ;scanSizeY = %s ;renderSizeX = %s \
				;renderSizeY = %s ;bShowInside = %s ;', unpack( tNew )
			)
		)		
	end
)