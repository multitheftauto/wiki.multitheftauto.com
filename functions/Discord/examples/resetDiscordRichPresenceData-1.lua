setDiscordApplicationID("you_application_key")
setDiscordRichPresenceAsset("asset_logo", "Name of Asset")
if resetDiscordRichPresenceData()  then -- we reset to default by MTA Application.
    outputChatBox("Discord Rich Presence has been cleared and restored to default settings.")
end