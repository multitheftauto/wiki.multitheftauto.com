local LIMITED_COMMANDS = {
    -- ["COMMAND_NAME"] = TIME_LIMIT_IN_SEC
    ["something"] = 5,  -- Can use this command only once in every 5 sec
    ["spam"]      = 10, -- Can use this command only once in every 10 sec
}

local EXEC = {}

addEventHandler("onPlayerCommand", root, function(cmd)
    local limit_sec = LIMITED_COMMANDS[cmd]
    if not limit_sec then return end

    local tick = getTickCount()

    if not EXEC[source]      then EXEC[source] = {}     end
    if not EXEC[source][cmd] then EXEC[source][cmd] = 0 end

    if EXEC[source][cmd] + (limit_sec * 1000) > tick then
        cancelEvent()
        return outputChatBox("#FF0000[ANTISPAM]#FFFFFF You can use this command once, in every "..limit_sec.." sec.", source, 255, 255, 255, true)
    end
    EXEC[source][cmd] = tick
end)

addEventHandler("onPlayerQuit", root, function()
    EXEC[source] = nil
end)