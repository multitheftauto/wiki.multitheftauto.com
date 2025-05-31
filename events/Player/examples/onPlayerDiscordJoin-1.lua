function discordJoin(justConnected, key)
    local myName = getPlayerName(source)
    if justConnected == true then
        outputChatBox ( myName .. " been referred here by " .. key )
    else
        outputChatBox ( myName .. " wanna play with " .. key )
    end

    local refer = getPlayerFromName(key)
    setElementData(refer, "myUsers", getElementData(refer, "myUsers") + 1)
    setPlayerDiscordJoinParams(refer, key, key, getElementData(refer, "myUsers"), 5)
end
addEventHandler("onPlayerDiscordJoin", getRootElement(), discordJoin)

function storeDiscordParams()
    local myName = getPlayerName(source)
    setPlayerDiscordJoinParams(source, myName, myName, 1, 5)
    setElementData(source, "myUsers", 1)
end

addEventHandler("onPlayerJoin", getRootElement(), storeDiscordParams)