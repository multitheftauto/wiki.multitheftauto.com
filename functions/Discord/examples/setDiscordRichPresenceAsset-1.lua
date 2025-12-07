addCommandHandler("setlogo", function()
    if isDiscordRichPresenceConnected() then
        setDiscordRichPresenceAsset("my_logo", "This is my logo!")
    end
end)
