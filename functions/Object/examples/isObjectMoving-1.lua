addEventHandler ("onClientResourceStart", resourceRoot,
    function ()
        local x, y, z = getElementPosition (localPlayer)
        object = createObject (1239, x, y, z)

        moveObject (object, 5000, x, y, z + 5)
    end
)

addCommandHandler ("getmoving",
    function (commandName)
        outputChatBox ("Is object "..(isObjectMoving(object) and "moving" or "not moving"))
    end
)