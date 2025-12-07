local app_id = "YOUR_APPLICATION_ID"
if DiscordRPC.setApplication(app_id) then 
    local name = localPlayer.name
    DiscordRPC.setState("In-game")
    DiscordRPC.setDetails("currently as "..name)
end