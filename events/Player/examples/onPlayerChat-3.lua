function onChat(message, messageType)
    if string.find(message, 'kill') then  -- Searches for the string 'kill' in the message sent
        killPed ( source, source ) -- Kills that player that typed the string 'kill'
    end
end
addEventHandler("onPlayerChat", root, onChat)