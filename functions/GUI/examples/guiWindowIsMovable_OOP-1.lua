local window = GuiWindow(0.5, 0.5, 0.22, 0.22, "isMovable window", true)

bindKey('l', 'down', function()
    window.movable = not window.movable
end)