function checkPing()
        local ping = getPlayerPing(localPlayer)  -- get the ping from the source element (the player who joined)
        if (ping > 100) then                          -- if it's higher than 100...
                outputChatBox("Your ping is pretty high! Please try to lower it if possible.") -- output a message to the player
        end
end
addCommandHandler("ping", checkPing)