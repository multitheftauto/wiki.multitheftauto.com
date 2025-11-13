local app_id = "YOUR_APPLICATION_ID"
if setDiscordApplicationID(app_id) then 
    setDiscordRichPresenceButton(1, "Connect to server", "mtasa://youraddressip")
    setDiscordRichPresenceButton(2, "MTA Homepage", "https://mtasa.com")
end