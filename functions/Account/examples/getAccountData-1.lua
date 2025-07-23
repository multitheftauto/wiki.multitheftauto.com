function onPlayerQuit()
      local playerAccount = getPlayerAccount(source) -- get his account
      if (playerAccount) then -- if we got the account then
            local playerMoney = getPlayerMoney(source) -- get his money amount
            setAccountData(playerAccount, "piraterpg.money", playerMoney) -- store his current money amount in his account data
      end
end
addEventHandler("onPlayerQuit", root, onPlayerQuit) -- add an event handler

function onPlayerLogin(_,account)
    local playerMoney = getAccountData(account, "piraterpg.money") -- get the money amount was store in his account data
    -- make sure there was actually a value saved under this key (check if playerMoney is not false).
    -- this will for example not be the case when a player plays the gametype for the first time
    if (playerMoney) then
        setPlayerMoney(source, playerMoney)
    end
end
addEventHandler("onPlayerLogin", root, onPlayerLogin) -- add an event handler