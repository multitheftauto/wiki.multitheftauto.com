function scBar()
    Window = guiCreateWindow(0.3664, 0.2764, 0.3508, 0.3477, "Window", true)--We create a window.
    guiCreateScrollBar(15, 81, 24, 245, false, false, Window)--We create a scrollbar as a child of 'Window'
end
addEventHandler("onClientResourceStart", resourceRoot, scBar) --We handle it with 'onClientResourceStart' event.