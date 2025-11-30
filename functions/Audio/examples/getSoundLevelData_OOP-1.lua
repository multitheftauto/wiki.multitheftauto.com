local soundHandler = Sound("sound.wav")

function onSoundPlayRender()
    if (soundHandler) then
        local leftData, rightData = soundHandler:getLevelData()
        if (leftData) then
            dxDrawRectangle(0, 0, 64, leftData / 32768 * 256, tocolor(255, 0, 0))
            dxDrawRectangle(64, 0, 64, rightData / 32768 * 256, tocolor(0, 0, 255))
        end
    end
end
addEventHandler("onClientRender", root, onSoundPlayRender)
