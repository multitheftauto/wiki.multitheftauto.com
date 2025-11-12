local cj = createPed(0, 2498.5, -1684.0, 13.5, 20) -- create a ped at cjs house in grove street and give it an ak
givePedWeapon(cj, 30, 3000, true)

local marker = createMarker(2493.0, -1669.0, 13.5, "checkpoint", 3, 255, 0, 0, 128) -- create a marker and get its associated colshape for later use
local colshape = getElementColShape(marker)

function renderHandler()
	local intruder = getElementsWithinColShape(colshape)[2] -- get the second element found within the colshape, because the first one will normally be the marker itself
	if intruder then
		local x,y,z = getElementPosition(intruder) -- if an intruder exists, get its position and have the cj ped fire at it
		setPedAimTarget(cj, x, y, z)
		setPedControlState(cj, "fire", true)
		setPedControlState(cj, "aim_weapon", true) -- needed for akimbo weapons (22, 26, 28, 32) and the sniper rifle
	else
		setPedControlState(cj, "fire", false) -- otherwise stop shooting
		setPedControlState(cj, "aim_weapon", false)
	end
end
addEventHandler("onClientRender", root, renderHandler) -- add an event handler to go through the target acquisition procedure every frame