function blockPM(fullMsg,r,msg)
	if (getPlayerName(r) == "Bob") then -- If they sent a PM to "Bob"
		cancelEvent() -- Then cancel it
		outputChatBox("Bob is not accepting PM's at this time.",source,255,0,0) -- And output it was cancelled.
	end
end
addEventHandler("onPlayerPrivateMessage",root,blockPM)