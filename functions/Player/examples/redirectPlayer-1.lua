local ip_port = "123.123.1.2:1234"	-- enter IP and port in format: 192.168.1.1:22003
local password = "password_placeholder" -- If the server is passworded insert password here (if no password, it wont use the value)

function onConnectRedirect()
	redirectPlayer(source, gettok(ip_port,1,":"), tonumber(gettok(ip_port,2,":")), password)
end
addEventHandler ("onPlayerJoin", root, onConnectRedirect)