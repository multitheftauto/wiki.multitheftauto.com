local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    DiscordRPC.setButton(1, "Connect to server", "mtasa://youraddressip")
    DiscordRPC.setButton(2, "MTA Homepage", "https://mtasa.com")
end