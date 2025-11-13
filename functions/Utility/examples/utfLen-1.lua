addCommandHandler( 'russian_text_length',
	function( )
		outputChatBox( string.format( 'Russian text length is: %d', utfLen( 'Текст' ) ) )
	end
)