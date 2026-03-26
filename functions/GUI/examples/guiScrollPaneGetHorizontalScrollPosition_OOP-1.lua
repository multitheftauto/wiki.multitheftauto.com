local scrollpane = GuiScrollPane(0.3, 0.3, 0.2, 0.2, true)
local label = GuiLabel(0.3, 0.28, 0.1, 0.1, 'Horizontal scroll: 0%', true, window)

for i = 1,10 do
    GuiButton(0.1 + 0.25 * i, 0.4, 0.2, 0.2, 'Button '..i, true, scrollpane)
end

setTimer(function()
    label.text = 'Horizontal scroll: '..math.floor(scrollpane.horizontalScrollPosition)..'%'
end, 250, 0)