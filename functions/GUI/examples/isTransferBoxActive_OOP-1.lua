Camera.fade(false)

function checkTransfer()
    if GuiElement.isTransferBoxActive() then
        Timer(checkTransfer, 2000, 1) -- TransferBox is still active, check again after 2 seconds.
    else 
        Camera.fade(true) -- TransferBox isn't active, fade in camera.
    end
end
addEventHandler("onClientResourceStart", resourceRoot, checkTransfer)