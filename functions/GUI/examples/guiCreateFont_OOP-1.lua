local label = GuiLabel(100, 300, 400, 50, "Hello World!", false)
local font = GuiFont("myFont.ttf", 10)
if (font) then
    label.font = font
end
