local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    DiscordRPC.setState("In-game")
    DiscordRPC.setStartTime(1)
    DiscordRPC.setEndTime(60) -- 1 minute Remaining
end