local app_id = "YOUR_APPLICATION_ID"
if setDiscordApplicationID(app_id) then 
    setDiscordRichPresenceState("In-game")
    setDiscordRichPresencePartySize(1, 32)
end