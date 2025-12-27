addCommandHandler("checkdata", function(cmd, data)
    if (localPlayer:hasData(data)) then
        outputChatBox("You have element data " .. data .. ".")
    else
        outputChatBox("You do not have element data " .. data .. ".")
    end
end)