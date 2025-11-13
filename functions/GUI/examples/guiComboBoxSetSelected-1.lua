function drawGUI()
	guiWindow = guiCreateWindow(100,100,200,100,"ComboBox test area",false,false) -- create the container window
	local combobox = guiCreateComboBox(20,30,150,20,"Checked ComboBox",false,guiWindow) -- note the parameter after header, it will create a ComboBox
    guiComboBoxAddItem(combobox,"Selected") --Add items to combobox
    guiComboBoxAddItem(combobox,"UnSelected")
	guiComboBoxSetSelected(combobox,0)--set the first row which is the selected row Selected.
	guiSetVisible(guiWindow,false) -- set it invisible just in case
end
addCommandHandler("combobox",function()
	if not guiWindow then -- if it hasn't been declared yet
		drawGUI() -- we draw the gui window
		guiSetVisible(guiWindow,true) -- we set it visible again. Strictly speaking it's not necessary, could have omitted both this and the upper guiSetVisible, but this is needed if you want to cache a window without actually showing it
	else -- if we actually have run this function before and declared guiWindow
		guiSetVisible(guiWindow, not guiGetVisible(guiWindow)) -- we just toggle the visibility. If it was visible, not visible returns false and thus sets it's visibility false, effectivly hiding it	
	end
	showCursor(not isCursorShowing()) -- similar to above visibility
end)