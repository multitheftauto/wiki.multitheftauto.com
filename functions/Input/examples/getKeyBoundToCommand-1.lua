--This function is executed when the player uses the /getcommandbind [command] command.
--It outputs the key the command is bound to (if it is bound).
local function playerCommand(_, command)
	if not command then --if no command name was given, output a syntax error message.
		outputChatBox("* Syntax: /getcommandbind [command name] .", 255, 0, 0)
		return
	end
	
	local keyName = getKeyBoundToCommand(command)
	if keyName then
		outputChatBox("* The command /"..command.." is bound to the "..keyName.." key.", 0, 0, 255)
	else
		outputChatBox("* The command /"..command.." is not bound to any keys.", 0, 0, 255)
	end
end
addCommandHandler("getcommandbind", playerCommand)