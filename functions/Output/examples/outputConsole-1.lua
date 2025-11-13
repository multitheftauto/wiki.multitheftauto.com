function message(player,command)
	if command == "public" then
		outputConsole("Public console message")
	else
		outputConsole("Private console message",player)
	end
end
addCommandHandler("public",message)
addCommandHandler("private",message)