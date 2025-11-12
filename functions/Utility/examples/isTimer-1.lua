-- This anti spam is just an example and won't work if you have other scripts and game modes which manipulate chat,
-- If you do then this script would need to be put with the other script/gamemode that handles chat else cancelEvent() won't work.

antiSpam = {} -- This makes a table called antiSpam
function antiChatSpam() -- The function that the event has called. Will stop all mainchat/teamchat/me spam.
	if isTimer(antiSpam[source]) then -- Check if timer is running using isTimer (this is an example of its use and all)
		cancelEvent()  -- If timer is running then cancel the event
		outputChatBox("Sorry bro, you may only send 1 message a second to prevent spam.", source, 255, 255, 0) -- Message to player
	else
		antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 1000, 1, source) -- Timer lasting 1 second.
		-- The "function(source) antiSpam[source] = nil end" should clear the player from table after 1 second so he can chat again. 
                -- antiSpam[source] = setTimer(... is using the table to bind that player to the timer.
	end
end
addEventHandler("onPlayerChat", root, antiChatSpam) -- Event we're using, don't waste your time with getRootElement() (root is the same)
-- You now have an antispam to prevent people super spamming your chatbox!