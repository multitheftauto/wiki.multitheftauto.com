function onPlayerQuit ( )
      -- when a player leaves, store his current money amount in his account data
      local playeraccount = getPlayerAccount ( source )
      if ( playeraccount ) and not isGuestAccount ( playeraccount ) then -- if the player is logged in
            local playermoney = getPlayerMoney ( source ) -- get the player money
            setAccountData ( playeraccount, "piraterpg.money", playermoney ) -- save it in his account
      end
end
 
function onPlayerLogin (_, playeraccount )
      -- when a player logins, retrieve his money amount from his account data and set it
      if ( playeraccount ) then
            local playermoney = getAccountData ( playeraccount, "piraterpg.money" )
            -- make sure there was actually a value saved under this key (check if playermoney is not false).
            -- this will for example not be the case when a player plays the gametype for the first time
            if ( playermoney ) then
                  setPlayerMoney ( source, playermoney )
            end
      end
end
 
addEventHandler ( "onPlayerQuit", root, onPlayerQuit )
addEventHandler ( "onPlayerLogin", root, onPlayerLogin )