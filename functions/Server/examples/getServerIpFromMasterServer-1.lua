function outputServerIp()
    outputChatBox(getServerIpFromMasterServer())
end

addCommandHandler("serverIp", outputServerIp)