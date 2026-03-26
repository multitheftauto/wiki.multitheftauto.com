function dontAllowAnyOpenWindow()
	if GuiElement.isMTAWindowActive() then
		localPlayer.health = 0
	end
end
Timer(dontAllowAnyOpenWindow, 50, 0)
