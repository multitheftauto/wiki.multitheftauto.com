function versionCheck(_,_,_,_, clientVersion)
	if clientVersion < 259 then
		cancelEvent(true, "Update your MTA before you join this server!")
	end
end
addEventHandler("onPlayerConnect", root, versionCheck)