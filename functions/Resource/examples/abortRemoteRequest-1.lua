function CMD_abortRequests()
    local requests = getRemoteRequests()
	
    for _, request in ipairs(requests) do
        abortRemoteRequest(request)
    end
end

addCommandHandler("abortrequests", CMD_abortRequests)