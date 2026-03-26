local progressBar = GuiProgressBar(0.3, 0.4, 0.15, 0.03, true)

addCommandHandler('setProgress', function(cmd, value)
    if (not tonumber(value)) then
        return
    end

    progressBar.progress = tonumber(value)
end)