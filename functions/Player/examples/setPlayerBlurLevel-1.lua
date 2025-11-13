function changeBlurLevel ( playerSource, command, blur )
    blur = tonumber(blur)
    if not blur or blur > 255 or blur < 0 then
        outputChatBox ( "Enter a value between 0 - 255.", playerSource )
    else
        setPlayerBlurLevel ( playerSource, blur )
        outputChatBox ( "Blur level set to: " .. blur, playerSource )
    end
end

addCommandHandler("blur", changeBlurLevel)