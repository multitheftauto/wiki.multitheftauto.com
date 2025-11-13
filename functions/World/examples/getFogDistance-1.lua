function fogDistance( )
	outputChatBox( "Fog distance is: " .. tostring( getFogDistance( ) ) )
end
addCommandHandler( "fog", fogDistance )