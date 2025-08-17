local soundHandler = playSound ("audio.mp3")
local x, y = guiGetScreenSize ()
local samples = 256

function renderWave ()
    if (isElement (soundHandler)) then
        local waveData = getSoundWaveData (soundHandler, samples)
        if (waveData) then -- Avoid NaN values.
            for i=0, samples-1 do
                dxDrawRectangle ((x-samples)+i, y-128, 1, waveData[i] * 128)
            end
        end
    end
end
addEventHandler ("onClientRender", root, renderWave)