local soundHandler = playSound ( "sound.wav" )

function onSoundPlayRender ( )
    if ( soundHandler ) then
        local waveData = getSoundWaveData ( soundHandler, 256 )
        if ( waveData ) then
            for i=0,255 do
                dxDrawRectangle ( i, 128, 1, waveData[i] * 128)
            end
        end
    end
end
addEventHandler ( "onClientRender", getRootElement(), onSoundPlayRender )