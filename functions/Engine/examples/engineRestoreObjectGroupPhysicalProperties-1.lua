function restorePhysicalGroup(_, group)
    engineRestoreObjectGroupPhysicalProperties(tonumber(group))
end
addCommandHandler ( "restorePhysicalGroup", restorePhysicalGroup )
--restorePhysicalGroup(120)