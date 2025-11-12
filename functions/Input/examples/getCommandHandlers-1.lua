addCommandHandler( "commands", 
   function(player)
      local commandsList = {} --table to store commands
		
      --store/sort commands in the table where key is resource and value is table with commands
      for _, subtable in pairs( getCommandHandlers() ) do
	 local commandName = subtable[1]
	 local theResource = subtable[2]
			
         if not commandsList[theResource] then
	    commandsList[theResource] = {}
	 end
			
	 table.insert( commandsList[theResource], commandName )
      end
		
      --output sorted information in the chat
      for theResource, commands in pairs( commandsList ) do
	  local resourceName = getResourceInfo( theResource, "name" ) or getResourceName( theResource ) --try to get full name, if no full name - use short name
	  outputChatBox( "== "..resourceName.. " ==", player, 0, 255, 0 )
			
	  --output list of commands
	  for _, command in pairs( commands ) do
	     outputChatBox( "/"..command, player, 255, 255, 255 )
	  end
      end
  end
)