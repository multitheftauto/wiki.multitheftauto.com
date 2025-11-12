function sendTableToServer()
	local tableToSent = {1, 2, 3} -- this table would be passed to server

	triggerServerEvent("onServerSendTable", resourceRoot, tableToSent) -- refer to the note on wiki page (under theElement), for understanding which element you should use as 2nd argument
end
addCommandHandler("table", sendTableToServer)