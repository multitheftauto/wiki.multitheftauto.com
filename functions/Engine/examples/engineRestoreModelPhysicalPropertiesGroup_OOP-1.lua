function restoreID(_, id)
    Engine.restoreModelPhysicalPropertiesGroup(tonumber(id))
end
addCommandHandler("restoreID", restoreID)
