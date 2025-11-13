function stopAllResources()
    -- we store a table of resources
    local allResources = getResources()
    -- for each one of them,
    for i, resource in ipairs(allResources) do
        -- if it's running, and it is not the current resource
        if ( getResourceState(resource) == "running" ) and ( resource ~= getThisResource() ) then
            -- then stop it
            stopResource(resource)
        end
    end
end