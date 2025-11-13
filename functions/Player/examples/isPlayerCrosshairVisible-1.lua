addCommandHandler("crosshair", function()
    local crosshairStatus = isPlayerCrosshairVisible() and "visible" or "hidden"

    outputChatBox("Your crosshair is: "..crosshairStatus)
end)