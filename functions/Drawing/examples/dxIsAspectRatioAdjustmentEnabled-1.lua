addEventHandler("onClientRender", root, function()
    dxSetAspectRatioAdjustmentEnabled(true)

    local enabled, ratio = dxIsAspectRatioAdjustmentEnabled()
	
    if(enabled) then
        dxDrawText("Aspect ratio is: " .. ratio, 250, 250)
    end
end)