function onPlayerQuit()
      local playerAccount = source.account -- get his account
      if (playerAccount) then -- if we got the account then
            local playerMoney = source.money -- get his money amount
            playerAccount:setData("piraterpg.money", playerMoney) -- store his current money amount in his account data
      end
end
addEventHandler("onPlayerQuit", root, onPlayerQuit) -- add an event handler

function onPlayerLogin(_,account)
    local playerMoney = account:getData("piraterpg.money") -- get the money amount was store in his account data
    -- make sure there was actually a value saved under this key (check if playerMoney is not false).
    -- this will for example not be the case when a player plays the gametype for the first time
    if (playerMoney) then
        source.money = playerMoney -- give money
    end
end
addEventHandler("onPlayerLogin", root, onPlayerLogin) -- add an event handler