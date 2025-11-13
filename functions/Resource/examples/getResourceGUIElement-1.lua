function destroyAllGUIs()
	-- Destroy all of the gui-root's children
	for _, guiElement in ipairs(getElementChildren(getResourceGUIElement())) do
		if isElement(guiElement) then -- This checks that the element still exists (in case we already destroyed it's parent).
			destroyElement(guiElement)
		end
	end
end