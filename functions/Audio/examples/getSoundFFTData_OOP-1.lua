local soundHandler = Sound("sound.wav")

function onSoundPlayRender()
    if (soundHandler) then
        local soundFFT = soundHandler:getFFTData(2048, 256)
        if (soundFFT) then
            for i = 0, 255 do -- Data starts from index 0
                dxDrawRectangle(i, 0, 1, math.sqrt(soundFFT[i]) * 256)
            end
        end
    end
end
addEventHandler("onClientRender", getRootElement(), onSoundPlayRender)
