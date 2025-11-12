addCommandHandler("commands", 
  function( player, _, resourceName)
     local theResource = (resourceName and getResourceFromName(resourceName)) or resource 
     outputChatBox( "* Commands from "..getResourceName(theResource).." resource", player, 0, 255, 0 )
		
     local commands = getCommandHandlers( theResource )
     for _, command in pairs( commands ) do
        outputChatBox( "/"..command, player, 255, 255, 255 )
     end
  end
)