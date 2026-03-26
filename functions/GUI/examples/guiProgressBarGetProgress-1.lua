local progressBar = guiCreateProgressBar(0.3, 0.4, 0.15, 0.03, true)
local label = guiCreateLabel(0.3, 0.38, 0.1, 0.025, 'Progress: 0%', true)

setTimer(function()
    local newProgress = (guiProgressBarGetProgress(progressBar) + 1) % 100
    guiProgressBarSetProgress(progressBar, newProgress)

    guiSetText(label, 'Progress: '..newProgress..'%')
end, 25, 0)