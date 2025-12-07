local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    DiscordRPC.setState("waiting in lobby")
end