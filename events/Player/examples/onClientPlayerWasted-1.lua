local messages = {
	"Better luck next time",
	"Don't think you're so cool now, do you?",
	"Nice one, pal",
	"Your opinion is void"
}

-- add an event for the local player only
addEventHandler("onClientPlayerWasted", localPlayer, function(killer, weapon, bodyPart)
	local randomMessage = messages[math.random(#messages)] -- get a random message from the table
	outputChatBox(randomMessage, 255, 0, 0) -- output the message
end)