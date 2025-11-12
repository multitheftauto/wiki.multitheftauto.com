function math.round(number, decimals, method) -- math.round, useful function taken from the wiki: https://wiki.multitheftauto.com/wiki/Math.round
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function onWasted()
	local delay = math.random(500, 5000) -- 0.5s to 5s of delay
	setTimer(function(thePlayer) -- Starts the Timer
		local whoDied = "Someone" -- In case the name can't be read, Someone will appear
		if isElement(thePlayer) then -- This checks if thePlayer's element still exists (which means thePlayer hasnt disconnected yet)
			whoDied = getPlayerName(thePlayer) -- Changes Someone to thePlayer's name
		end
		outputChatBox(whoDied.." #FFFFFFhas #FF0000died #FFFFFF"..math.round(delay/1000, 1).." seconds ago.", root, 255, 175, 0, true) -- This will output to everyone on the server that thePlayer (or Someone) died X seconds ago.
	end
	,delay, 1, source) -- The source at the end is an argument for the function we made before, you can't use the source directly because it won't be readed
end
addEventHandler("onPlayerWasted", root, onWasted) -- Executed every time someone dies