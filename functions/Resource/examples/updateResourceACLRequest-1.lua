function allowAllACLRequests(theResource)
  local requests = getResourceACLRequests (theResource)
  for _,request in ipairs(requests) do
    updateResourceACLRequest ( theResource, request.name, true ) 
  end
end