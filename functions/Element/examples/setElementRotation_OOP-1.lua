addCommandHandler("turn", function()
    localPlayer.rotation = Vector3(localPlayer.rotation.x, localPlayer.rotation.y, localPlayer.rotation.z + 90)
end)