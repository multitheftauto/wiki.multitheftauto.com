function drawGUI()
	local guiWindow = guiCreateWindow(100,100,200,100,"Checkbox test area",false,false) -- create the container window
	local checkedBox = guiCreateCheckBox(20,30,150,20,"Checked checkbox",true,false,guiWindow) -- note the parameter after header, it will make the checkbox be checked
	local uncheckedBox = guiCreateCheckBox(20,60,150,20,"Unchecked checkbox",false,false,guiWindow) -- not here though
	guiSetVisible(guiWindow,false) -- set it invisible just in case
	return guiWindow -- we return the guiWindow
end
function cmdGUI(cmd)
	if not checkBoxWindow then -- if it hasn't been declared yet
		checkBoxWindow = drawGUI() -- we draw the gui window
		guiSetVisible(checkBoxWindow,true) -- we set it visible again. Strictly speaking it's not necessary, could have omitted both this and the upper guiSetVisible, but this is needed if you want to cache a window without actually showing it
	else -- if we actually have run this function before and declared checkBoxWindow
		guiSetVisible(checkBoxWindow, not guiGetVisible(checkBoxWindow)) -- we just toggle the visibility. If it was visible, not visible returns false and thus sets it's visibility false, effectivly hiding it	
	end
	showCursor(not isCursorShowing()) -- similar to above visibility
end
addCommandHandler("guiwindow",cmdGUI) -- trigger cmdGUI function with this command