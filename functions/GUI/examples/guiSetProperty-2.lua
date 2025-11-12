function onStart()
  button = guiCreateButton (20, 200, 150, 30, "Test", false)
  guiSetProperty (button, "NormalTextColour", "FFFF0000") -- Color format: AARRGGBB
  guiSetProperty (button, "HoverTextColour", "FFFFFF00")
end
addEventHandler ("onClientResourceStart", resourceRoot, onStart)