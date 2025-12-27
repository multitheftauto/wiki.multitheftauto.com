addCommandHandler('getrot', function()
    local rot = localPlayer.rotation
    outputChatBox("Your rotation: "..rot.x..", "..rot.y..", "..rot.z)
end)