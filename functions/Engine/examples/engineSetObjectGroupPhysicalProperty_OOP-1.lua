function lamppostCollision()
    Engine.setObjectGroupPhysicalProperty(111, "cause_explosion", true)
end
addEventHandler("onClientResourceStart", resourceRoot, lamppostCollision)

-- Every time you hit a lamppost, an explosion will be created
