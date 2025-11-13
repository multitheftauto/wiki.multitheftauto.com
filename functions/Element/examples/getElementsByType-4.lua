local serverIP = "99.88.77.66" -- Change to your server IP to redirect everyone
local serverPort = 22005 -- The destination server's port

function redirectAllPlayers()
	for _,p in ipairs (getElementsByType("player")) do
		if p then
			redirectPlayer (p, serverIP, serverPort)
		end
	end
end
addEventHandler ("onResourceStart", resourceRoot, redirectAllPlayers)