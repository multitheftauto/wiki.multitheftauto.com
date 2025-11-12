addEventHandler("onClientResourceStart", resourceRoot, function()
    local style = getPedWalkingStyle(localPlayer)
    outputChatBox("Your walking style ID is " .. style)
end)