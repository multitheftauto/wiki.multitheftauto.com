function CMD_requestInfo(player, _, resourceName)
    local res = resourceName and getResourceFromName(resourceName) or not resourceName and nil
	
    if(res == false) then
        outputChatBox("There is no resource named '" .. resourceName .. "'")
        return
    elseif(res and getResourceState(res) ~= "running") then
        outputChatBox("The provided resource '" .. resourceName .. "' is not running")
        return
    end
	
    local requests = getRemoteRequests(res)
	
    for _, request in ipairs(requests) do
        local requestInfo = getRemoteRequestInfo(request)
		
        if(requestInfo) then
            iprint(requestInfo)
        end
    end
end

addCommandHandler("requestinfo", CMD_requestInfo)