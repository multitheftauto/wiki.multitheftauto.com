local invalidEventCheckPunishment = true -- should player be punished upon detection (make sure that resource which runs this code has admin rights)
local eventCheckPunishmentBan = true -- only relevant if invalidEventCheckPunishment is set to true; use true for ban or false for kick
local eventCheckPunishmentReason = "Triggered invalid event" -- only relevant if invalidEventCheckPunishment is set to true; reason which would be shown to punished player
local eventCheckPunishedBy = "Console" -- only relevant if invalidEventCheckPunishment is set to true; who was responsible for punishing, as well shown to punished player
local eventCheckBanByIP = false -- only relevant if invalidEventCheckPunishment and eventCheckPunishmentBan is set to true; banning by IP nowadays is not recommended (...)
local eventCheckBanByUsername = false -- community username - legacy thing, hence is set to false and should stay like that
local eventCheckBanBySerial = true -- only relevant if invalidEventCheckPunishment and eventCheckPunishmentBan is set to true; (...) if there is a player serial to use instead
local eventCheckBanTime = 0 -- only relevant if invalidEventCheckPunishment and eventCheckPunishmentBan is set to true; time in seconds, 0 for permanent
local eventCheckDebugMessageLevel = 4 -- this debug level allows to hide INFO: prefix, and use custom colors
local eventCheckDebugMessageRed = 255 -- debug message - red color
local eventCheckDebugMessageGreen = 127 -- debug message - green color
local eventCheckDebugMessageBlue = 0 -- debug message - blue color

function onPlayerTriggerInvalidEvent(eventName, isAdded, isRemote)
	local playerName = getPlayerName(source)
	local eventAdded = isAdded and "yes" or "no"
	local eventRemote = isRemote and "yes" or "no"
	local eventActionTaken = (not invalidEventCheckPunishment and "none") or (eventCheckPunishmentBan and "ban" or "kick")
	local eventLogText = "[Events]: "..playerName.." triggered invalid event '"..eventName.."' (event added: "..eventAdded..", event remote: "..eventRemote..", action taken: "..eventActionTaken..")"

	outputDebugString(eventLogText, eventCheckDebugMessageLevel, eventCheckDebugMessageRed, eventCheckDebugMessageGreen, eventCheckDebugMessageBlue)

	if (not invalidEventCheckPunishment) then
		return false
	end

	if (eventCheckPunishmentBan) then
		banPlayer(source, eventCheckBanByIP, eventCheckBanByUsername, eventCheckBanBySerial, eventCheckPunishedBy, eventCheckPunishmentReason, eventCheckBanTime)
	else
		kickPlayer(source, eventCheckPunishedBy, eventCheckPunishmentReason)
	end
end
addEventHandler("onPlayerTriggerInvalidEvent", root, onPlayerTriggerInvalidEvent)