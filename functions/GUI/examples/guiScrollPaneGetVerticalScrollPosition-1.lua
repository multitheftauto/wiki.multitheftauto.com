local scrollpane = guiCreateScrollPane(0.3, 0.3, 0.2, 0.2, true)
local label = guiCreateLabel(0.3, 0.28, 0.1, 0.1, 'Vertical scroll: 0%', true, window)

for i = 1,10 do
    guiCreateButton(0.1, 0.4 + 0.25 * i, 0.2, 0.2, 'Button '..i, true, scrollpane)
end

setTimer(function()
    guiSetText(label, 'Vertical scroll: '..math.floor(guiScrollPaneGetVerticalScrollPosition(scrollpane))..'%')
end, 250, 0)