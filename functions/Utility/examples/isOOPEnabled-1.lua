local function checkOOPStatus()
   if isOOPEnabled() then
        outputChatBox("* OOP is enabled! Welcome to matrices' paradise.", getRandomPlayer and root or 0, getRandomPlayer and 0 or 255, getRandomPlayer and 255 or 0, getRandomPlayer and 0 or nil)
        local player
        if getRandomPlayer then -- Are we executed serverside?
            player = Player.getRandom() -- Make it easy, use OOP to get a random player
        else
            local players = getElementsByType("player")
            if #players > 0 then -- Is the server empty?
                player = players[math.random(1, #players)]  -- Get a random player using player elements table
            end
        end
        if not player then
            return -- We don't have a player. Cancel further execution of this function.
        end
        player.position = player.position + player.matrix.left * 10 -- Move him 10 units left, taking into account rotation
        outputChatBox(player.name .. " was moved 10 meters left as a demostration of OOP capabilities!", getRandomPlayer and root or 180, 180, getRandomPlayer and 180 or 255, getRandomPlayer and 255 or nil)
   else
        outputChatBox("* OOP is disabled! You should like the good ol' tables.", getRandomPlayer and root or 255, getRandomPlayer and 255 or 140, getRandomPlayer and 140 or 0, getRandomPlayer and 0 or nil)
   end
end
checkOOPStatus() -- Execute this at resource start