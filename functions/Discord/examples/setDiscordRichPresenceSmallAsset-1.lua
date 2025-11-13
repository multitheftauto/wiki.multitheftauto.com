addCommandHandler("setsmalllogo",
    function ()
        if isDiscordRichPresenceConnected() then 
            setDiscordRichPresenceSmallAsset("my_small_logo", "This is my small logo!")
        end 
    end
)