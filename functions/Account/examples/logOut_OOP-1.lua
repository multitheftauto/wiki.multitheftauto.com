function logoutAll()
    local players = Element.getAllByType("player") -- Get every player
    for k, player in ipairs(players) do -- For every player do the following...
        local account = player.account -- Get every player's account
        if (not account.guest) then -- For every player that's logged in....
            player:logOut() -- Log them out.
        end
    end
end
-- Trigger it when the resource (re)starts
addEventHandler("onResourceStart", getResourceRootElement(), logoutAll)
