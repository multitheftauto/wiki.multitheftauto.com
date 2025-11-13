function consoleactiveCommand(arg)
    local active = (isConsoleActive() and "active.") or "not active."
    outputChatBox("Your console is " .. active)
end
addCommandHandler("consoleactive", consoleactiveCommand)