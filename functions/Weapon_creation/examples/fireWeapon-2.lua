local weaponElement = nil

function onClientResourceStart()
	weaponElement = createWeapon("m4", 0, 0, 0) -- when the resource starts, create the M4 and attach it to the local player with an offset to place it above their head facing forwards
	attachElements(weaponElement, localPlayer, 0, 0, 1, 0, 0, 90)
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)

function onClientRender() -- fire the M4 every frame using the "onClientRender" event
	fireWeapon(weaponElement)
end
addEventHandler("onClientRender", root, onClientRender)