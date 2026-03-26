local scrollpane = GuiScrollPane(0.3, 0.3, 0.2, 0.2, true)

for i = 1,10 do
    GuiButton(0.1 + 0.25 * i, 0.4, 0.2, 0.2, 'Button '..i, true, scrollpane)
end

addCommandHandler('scroll', function(cmd, value)
    if (not tonumber(value)) then
        return
    end

    scrollpane.horizontalScrollPosition = tonumber(value)
end)