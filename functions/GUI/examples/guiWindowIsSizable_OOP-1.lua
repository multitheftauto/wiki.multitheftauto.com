local window = GuiWindow(0.5, 0.5, 0.22, 0.22, "isSizable window", true)

bindKey('l', 'down', function()
    window.sizable = not window.sizable
end)