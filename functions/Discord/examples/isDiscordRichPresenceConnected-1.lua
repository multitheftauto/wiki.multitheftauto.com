addCommandHandler("checkdiscord",
    function ()
        if isDiscordRichPresenceConnected() then 
            outputChatBox("You are using Discord Rich Presence, that's cool!")
        end 
    end
)