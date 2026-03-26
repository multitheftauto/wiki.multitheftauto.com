local window = GuiWindow(300, 300, 500, 700, 'Help panel', false)
local title = window.text
print(title) -- "Help panel"

local button = GuiButton(320, 360, 200, 40, "I need help", false)
print(button.text) -- "I need help"