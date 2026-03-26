-- create the window (the container for our label)
local myWindow = GuiWindow(0, 0, 0.5, 0.4, "Information", true)

-- create the label
local myLabel = GuiLabel(10, 10, 0, 0, "This is my text container", false, myWindow)

-- get the (absolute) text extent and font height, and use these to size the label
myLabel.size = Vector2(myLabel.textExtent, myLabel.fontHeight)
