addCommandHandler("checkdiscord", function()
    if DiscordRPC.isConnected() then
        outputChatBox("You are using Discord Rich Presence, that's cool!")
    end
end)
