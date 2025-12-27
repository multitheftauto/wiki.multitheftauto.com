local function outputLocalPlayerRadius()
    outputChatBox("Your radius is " .. localPlayer.radius)
end
addCommandHandler("getmyradius", outputLocalPlayerRadius)