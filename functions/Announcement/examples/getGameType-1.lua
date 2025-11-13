function playerJoinHandler( )
   if getGameType() == "Race" then
      outputChatBox( "Ready... Get set... GO!!", source )
   end
end
addEventHandler( "onPlayerJoin", getRootElement(), playerJoinHandler )