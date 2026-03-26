local password = GuiEdit(0.845, 0.94, 0.15, 0.05, "password", true) -- create edit box for a password
password.masked = true

addCommandHandler("showPassword", function()
    password.masked = not password.masked
    outputChatBox("Edit field is " .. (password.masked and "masked" or "not masked")) -- show info about edit box
end)