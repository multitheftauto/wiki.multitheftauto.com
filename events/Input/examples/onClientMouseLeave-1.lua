addEventHandler("onClientMouseLeave", getRootElement(), function(aX, aY)
    outputChatBox("You're no longer pointing at a GUI element at (" .. tostring(aX) .. ", " .. tostring(aY) .. ")")
end)