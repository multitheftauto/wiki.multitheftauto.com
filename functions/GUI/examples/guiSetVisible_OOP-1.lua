-- Create a GUI window called 'myWindow'
local myWindow = GuiWindow(0.3, 0.3, 0.5, 0.60, "GUI window title", true)
myWindow.visible = false -- hide the window

bindKey('o', 'down', function()
    myWindow.visible = not myWindow.visible
end)