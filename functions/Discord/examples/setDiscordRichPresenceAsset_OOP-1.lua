addCommandHandler("setlogo", function()
    if DiscordRPC.isConnected() then
        DiscordRPC.setAsset("my_logo", "This is my logo!")
    end
end)
