function funcInput ( player, key, keyState )
  outputChatBox ( getPlayerName ( player) .. " " .. (keyState == "down" and "pressed" or "released") .. " the " .. key .. " key!" )
end

function bindTheKeys ( player, commandName )
  bindKey ( player, "F1", "down", funcInput )   -- bind the player's F1 down key
  bindKey ( player, "F1", "up", funcInput )     -- bind the player's F1 up key
  bindKey ( player, "fire", "both", funcInput ) -- bind the player's fire down and up control
end
addCommandHandler ( "bindme", bindTheKeys )