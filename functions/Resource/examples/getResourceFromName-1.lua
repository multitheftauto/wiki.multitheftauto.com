function onStart( theResource )
     local blipsResource = getResourceFromName ( "playerblips" ) -- get the resource of name "playerblips"
     if ( blipsResource and theResource == blipsResource ) then -- check if the resource started was it
          outputChatBox ( "Blips resource started!" )
     end
end
addEventHandler ( "onResourceStart", getRootElement(), onStart )