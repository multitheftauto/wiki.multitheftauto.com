function renderSyncedElements ()
    -- Retrieve ped elements streamed in
    for k,el in ipairs (getElementsByType('ped', root, true)) do
        repeat
            if (not isElementSyncer(el)) then
                -- Skip if local player isn't syncer
                break
            end
            
            local pedX, pedY, pedZ = getElementPosition (el)
            local sX, sY, sD = getScreenFromWorldPosition (pedX, pedY, pedZ + 1.2)
            if (not sX) or (sD > 50) then
                -- Not on screen or too far away
                break
            end
            
            dxDrawText ('Syncer', sX, sY, 0, 0, tocolor(255,255,255,255), 20 / sD, 'arial')
        until true
    end
end
addEventHandler ('onClientRender', root, renderSyncedElements)