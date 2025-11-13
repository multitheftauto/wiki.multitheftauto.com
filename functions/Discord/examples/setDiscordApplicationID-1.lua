local app_id = "YOUR_APPLICATION_ID"
if setDiscordApplicationID(app_id) then 
    setDiscordRichPresenceAsset("asset_name_from_application")
    outputChatBox("Yay, we're now using our own application!")
end