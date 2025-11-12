local app_id = "YOUR_APPLICATION_ID"
if setDiscordApplicationID(app_id) then 
    local name = getPlayerName(localPlayer)
    setDiscordRichPresenceState("In-game")
    setDiscordRichPresenceDetails("currently as "..name)
end