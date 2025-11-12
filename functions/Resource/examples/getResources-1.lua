function displayResources()
     outputConsole("List of resources:")
     local resourceTable = getResources() -- get a table of resources
     for resourceKey, resourceValue in ipairs(resourceTable) do
          -- iterate through the table and output each resource's name
          local name = getResourceName(resourceValue)
          outputConsole(" " .. name)
     end
end