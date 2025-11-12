function CMD_requestInfo(player, _, resourceName)
    local res = resourceName and getResourceFromName(resourceName) or not resourceName and nil
	
    if(res == false) then
        outputChatBox("There is no resource named '" .. resourceName .. "'", player)
        return
    elseif(res and getResourceState(res) ~= "running") then
        outputChatBox("The provided resource '" .. resourceName .. "' is not running", player)
        return
    end

    local requests = getRemoteRequests(res)
	
    outputChatBox(("There are %d request%s running"):format(#requests, #requests == 1 and '' or 's'), player)
end

addCommandHandler("requestinfo", CMD_requestInfo)