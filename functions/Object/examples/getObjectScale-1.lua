addCommandHandler("getscale",
    function()
	local theObject = createObject(1337, getElementPosition(localPlayer))
	local x, y, z = getObjectScale(theObject)
	outputChatBox("Object scale: X: "..x..", Y: "..y.." Z: "..z.."")
    end
)