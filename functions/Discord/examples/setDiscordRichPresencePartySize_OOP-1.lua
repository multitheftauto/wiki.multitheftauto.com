local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    DiscordRPC.setState("In-game")
    DiscordRPC.setPartySize(1, 32)
end