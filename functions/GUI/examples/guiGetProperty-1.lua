addEventHandler("onClientResourceStart", getResourceRootElement(),
    function()
        button = guiCreateButton(20, 200, 150, 30, "Test", false)
    end
)

addCommandHandler("togglebtn",
    function()
        local currentState = guiGetProperty(button, "Disabled")
        if currentState == "False" then
            guiSetProperty(button, "Disabled", "True")
        else
            guiSetProperty(button, "Disabled", "False")
        end
    end
)