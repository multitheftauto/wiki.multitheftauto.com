function outputServerName ( )
	outputChatBox ( getServerName( ) )
end

-- Add console command 'getServerName'
addCommandHandler ( "getServerName", outputServerName )