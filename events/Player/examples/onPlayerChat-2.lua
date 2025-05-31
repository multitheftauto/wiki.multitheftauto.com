--This function is executed when a player joins, it sets the player's name-tag color to a random color.

local function playerJoin()
	local red, green, blue = math.random (50, 255), math.random (50, 255), math.random (50, 255)
        setPlayerNametagColor(source, red, green, blue)
end
addEventHandler ("onPlayerJoin", root, playerJoin)

--This function is executed when a player says something in chat, it outputs the player's message, with their nick colored to match their name tag color.

local function playerChat(message, messageType)
	if messageType == 0 then --Global (main) chat
                cancelEvent()
                local red, green, blue = getPlayerNametagColor(source)
		outputChatBox(getPlayerName(source)..": #FFFFFF"..message, root, red, green, blue, true )
		outputServerLog("CHAT: "..getPlayerName(source)..": "..message) -- Because we cancelled the onPlayerChat event, we need to log chat manually.
	end
end
addEventHandler("onPlayerChat", root, playerChat)