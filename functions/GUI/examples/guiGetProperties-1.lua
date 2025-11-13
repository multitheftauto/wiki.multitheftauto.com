addCommandHandler("btn",
    function()
        local btn = guiCreateButton(20, 200, 150, 30, "Test", false)
        local props = guiGetProperties(btn)
        for propName,propVal in pairs(props) do
            outputConsole(propName .. " = " .. propVal)
        end
    end
)