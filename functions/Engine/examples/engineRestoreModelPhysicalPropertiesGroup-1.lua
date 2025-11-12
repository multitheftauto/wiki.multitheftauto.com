function restoreID(_, id)
    engineRestoreModelPhysicalPropertiesGroup(tonumber(id))
end
addCommandHandler ( "restoreID", restoreID )