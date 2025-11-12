function outputServerIp()
    outputChatBox("You are currently connected to ".. getServerIp(true))
end

addCommandHandler("serverIp", outputServerIp)