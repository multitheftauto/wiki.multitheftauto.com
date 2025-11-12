function disableClubMusic()
    if getElementInterior(localPlayer) == 17 and getDistanceBetweenPoints3D(493.39, -22.72, 1000.68, getElementPosition(localPlayer)) < 50 and getInteriorSoundsEnabled() then
        setInteriorSoundsEnabled(false)
    elseif not getInteriorSoundsEnabled() then
        setInteriorSoundsEnabled(true)
    end
end
addEventHandler("onClientPreRender", root, disableClubMusic)