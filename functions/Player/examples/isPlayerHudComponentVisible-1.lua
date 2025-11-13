addEventHandler("onClientResourceStart",resourceRoot,function()
	local components = {"ammo","area_name","armour","breath","clock","health","money",
		"radar","vehicle_name","weapon","radio","wanted","crosshair"
	} --Table filled with all the available components to check
	for _,component in ipairs(components)do
		if isPlayerHudComponentVisible(component)then --check if the component is visible
			outputChatBox("Hud Component: "..component.." is visible!") --if it is then tell the client that
		else
			outputChatBox("Hud Component: "..component.." is not visible!") --if it is not then tell the client that it isn't
		end
	end
end)