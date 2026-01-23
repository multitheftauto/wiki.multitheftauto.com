-- *****************************************************************************
-- SERVER CODE
function greetingCommandOne(playerSource, commandName, playerName)
    if playerName then
        local thePlayer = getPlayerFromName(playerName)
        if thePlayer then
            triggerClientEvent(thePlayer, "onGreeting", thePlayer, "Hello World!")
        else
            -- invalid player name specified
        end
    else
        -- No player name specified
    end
end
addCommandHandler("greet_one", greetingCommandOne)

-- *****************************************************************************
-- CLIENT CODE
function greetingHandler(message)
    outputChatBox("The server says: " .. message)
end
addEvent("onGreeting", true)
addEventHandler("onGreeting", localPlayer, greetingHandler)
