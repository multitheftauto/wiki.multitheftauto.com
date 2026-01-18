function getProperty(_, group, property)
    local prop = {Engine.getObjectGroupPhysicalProperty(tonumber(group), property)}
    outputConsole(inspect(prop))
end
addCommandHandler("getProperty", getProperty)

-- /getProperty 120 special_col_response
