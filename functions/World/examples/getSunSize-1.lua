function commandGetSunSize(player, command)
    local size = getSunSize()
    if (size) then
        outputChatBox("The current size of the sun is "..size..".", player, 0, 255, 0)
    else
        outputChatBox("The size of the sun is normal.", player, 0, 255, 0)
    end
end
addCommandHandler("getsunsize", commandGetSunSize)