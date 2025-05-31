local obj = createObject (5239, -2417.22339, -606.70374, 132.56250)
moveObject (obj, 3000, -2417.22339, -606.70374, 137.56250)

addEventHandler ("onClientObjectMoveStop", obj,
    function ()
        outputChatBox ("Object stopped moving!")
    end
)