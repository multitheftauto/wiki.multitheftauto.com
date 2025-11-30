function onPlayerQuit()
    -- when a player leaves, store his current money amount in his account data
    local playeraccount = source.account
    if (playeraccount and not playeraccount.guest) then -- if the player is logged in
        local playermoney = source.money -- get the player money
        playeraccount:setData("piraterpg.money", playermoney) -- save it in his account
    end
end

function onPlayerLogin(_, playeraccount)
    -- when a player logins, retrieve his money amount from his account data and set it
    if (playeraccount) then
        local playermoney = playeraccount:getData("piraterpg.money")
        -- make sure there was actually a value saved under this key (check if playermoney is not false).
        -- this will for example not be the case when a player plays the gametype for the first time
        if (playermoney) then 
            source.money = playermoney
        end
    end
end

addEventHandler("onPlayerQuit", root, onPlayerQuit)
addEventHandler("onPlayerLogin", root, onPlayerLogin)
