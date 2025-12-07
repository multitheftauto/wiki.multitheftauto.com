local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    DiscordRPC.setAsset("asset_name_from_application")
    outputChatBox("Yay, we're now using our own application!")
end