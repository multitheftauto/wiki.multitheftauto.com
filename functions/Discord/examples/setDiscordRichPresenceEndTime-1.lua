local app_id = "YOUR_APPLICATION_ID"
if setDiscordApplicationID(app_id) then 
    setDiscordRichPresenceState("In-game")
    setDiscordRichPresenceStartTime(1)
    setDiscordRichPresenceEndTime(60) -- 1 minute Remaining
end