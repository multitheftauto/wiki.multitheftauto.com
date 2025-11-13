function checkBlurLevel( playerSource )
    local blur = getPlayerBlurLevel( playerSource )
    if blur then
        outputChatBox( "Blur level: " .. blur, playerSource )
    end
end
addCommandHandler("blurlevel", checkBlurLevel)