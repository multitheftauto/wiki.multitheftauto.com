addCommandHandler("setsmalllogo", function()
    if DiscordRPC.isConnected() then
        DiscordRPC.setSmallAsset("my_small_logo", "This is my small logo!")
    end
end)
