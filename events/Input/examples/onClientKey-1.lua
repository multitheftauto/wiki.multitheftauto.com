function playerPressedKey(button, press)
    if (press) then -- Only output when they press it down
        outputChatBox("You pressed the "..button.." key!")
    end
end
addEventHandler("onClientKey", root, playerPressedKey)