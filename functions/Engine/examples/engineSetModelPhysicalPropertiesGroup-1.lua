function setID(_, id, group)
    engineSetModelPhysicalPropertiesGroup(tonumber(id), tonumber(group))
end
addCommandHandler("setID", setID)
