function setID(_, id, group)
    Engine.setModelPhysicalPropertiesGroup(tonumber(id), tonumber(group))
end
addCommandHandler("setID", setID)
