local function outputLocalPlayerRadius()
    outputChatBox("Your radius is " .. getElementRadius(localPlayer))
end
addCommandHandler("getmyradius", outputLocalPlayerRadius)