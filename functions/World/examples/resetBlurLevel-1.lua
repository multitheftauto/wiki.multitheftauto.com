function resetBlurCommand ()
    if resetBlurLevel () then
        outputChatBox ("Reset blur level.", 0, 255, 0)
    else
        outputChatBox ("Failed to reset blur level.", 255, 0, 0)
    end
end

addCommandHandler ("resetblur", resetBlurCommand)