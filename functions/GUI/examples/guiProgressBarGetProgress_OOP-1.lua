local progressBar = GuiProgressBar(0.3, 0.4, 0.15, 0.03, true)
local label = GuiLabel(0.3, 0.38, 0.1, 0.025, 'Progress: 0%', true)

setTimer(function()
    local newProgress = (progressBar.progress + 1) % 100
    progressBar.progress = newProgress

    label.text = 'Progress: '..newProgress..'%'
end, 25, 0)