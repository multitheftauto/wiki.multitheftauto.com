local soundHandler = playSound("audio.mp3")
local samples = 256

function renderWave()
    if (isElement(soundHandler)) then
        local waveData = getSoundWaveData(soundHandler, samples)
        if (waveData) then -- Avoid NaN values.
            for i = 0, samples - 1 do
                dxDrawRectangle(i, 128, 1, math.abs(waveData[i]) * -128)
            end
        end
    end
end
addEventHandler("onClientRender", root, renderWave)
