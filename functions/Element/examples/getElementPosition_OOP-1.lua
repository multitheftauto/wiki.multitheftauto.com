addCommandHandler('mypos', function()
    local pos = localPlayer.position
    outputChatBox("Your position: "..pos.x..", "..pos.y..", "..pos.z)
end)