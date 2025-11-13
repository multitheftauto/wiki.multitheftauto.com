function checkTransfer()
    if isTransferBoxActive() then
        setTimer(checkTransfer, 2000, 1) -- TransferBox is still active, check again after 2 seconds.
    else 
        fadeCamera(true) -- TransferBox isn't active, fade in camera.
    end
end
addEventHandler("onClientResourceStart", resourceRoot, checkTransfer)