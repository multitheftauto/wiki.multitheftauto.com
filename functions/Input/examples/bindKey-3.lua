function fanFunction()
  bindKey (source,"forwards","down",
    function(player,key,state)
      outputChatBox (getPlayerName (player) .. "#FFFF00 thinks MTA:SA is so cool.",root,255,255,0,true)
    end
  )
end
addEventHandler ("onPlayerLogin",root,fanFunction)