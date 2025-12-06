addCommandHandler("camdrunk", function(_, level)
    local level = math.floor(level)
    if level and level >= 0 and level <= 255 then
        setCameraDrunkLevel(level)
        outputChatBox("Camera drunk level updated to " .. level .. ".")
    else
        outputChatBox("Camera drunk level must be between 0 and 255.")
    end
end)
