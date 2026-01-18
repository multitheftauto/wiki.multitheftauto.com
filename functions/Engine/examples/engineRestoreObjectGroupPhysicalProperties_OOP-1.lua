function restorePhysicalGroup(_, group)
    Engine.restoreObjectGroupPhysicalProperties(tonumber(group))
end
addCommandHandler("restorePhysicalGroup", restorePhysicalGroup)
-- restorePhysicalGroup(120)
