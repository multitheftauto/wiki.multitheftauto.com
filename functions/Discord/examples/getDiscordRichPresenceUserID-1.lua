addCommandHandler("getmyuserid", function()
    if isDiscordRichPresenceConnected() then
        local id = getDiscordRichPresenceUserID()
        if id == "" then
            outputChatBox("You didn't allow consent to share Discord data! Grant permission in the settings!")
        else
            outputChatBox("Your Discord userid: " .. id)
        end
    end
end)
