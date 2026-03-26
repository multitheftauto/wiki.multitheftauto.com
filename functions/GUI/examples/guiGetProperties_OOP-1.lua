addCommandHandler("btn", function()
    local btn = GuiButton(20, 200, 150, 30, "Test", false)
    local props = btn.properties
    for propName, propVal in pairs(props) do
        outputConsole(propName .. " = " .. propVal)
    end
end)
