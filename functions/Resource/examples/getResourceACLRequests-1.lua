function showAllACLRequests()
  for _,resource in ipairs(getResources()) do
    local requests = getResourceACLRequests (resource)
    if #requests > 0 then
      outputConsole( getResourceName(resource).." has "..#requests.." ACL request(s)" )
      for i,request in ipairs(requests) do
        outputConsole( tostring(i)
                 .. "  name:" .. request.name
                 .. "  access:" .. tostring(request.access)
                 .. "  pending:" .. tostring(request.pending)
                 .. "  who:" .. request.who
                 .. "  date:" .. request.date
               )
      end
    end
  end
end