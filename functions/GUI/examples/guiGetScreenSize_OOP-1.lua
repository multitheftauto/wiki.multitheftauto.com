addCommandHandler('checkres', function()
    local w, h = GuiElement.getScreenSize()
    outputChatBox("Your resolution is: "..w.."x"..h) -- e.g 1920x1080
end)