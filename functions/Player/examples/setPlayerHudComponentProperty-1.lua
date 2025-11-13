addEventHandler('onClientResourceStart', resourceRoot, function()
    setPlayerHudComponentProperty('clock', 'fillColor', tocolor(50, 168, 82, 255))
    setPlayerHudComponentProperty('clock', 'dropColor', tocolor(94, 14, 7, 255))
    setPlayerHudComponentProperty('clock', 'fontOutline', 1)
    setPlayerHudComponentProperty('clock', 'fontStyle', 'subtitles')
    setPlayerHudComponentProperty('clock', 'proportional', true)

    setPlayerHudComponentProperty('money', 'fillColor', tocolor(11, 102, 158, 255))
    setPlayerHudComponentProperty('money', 'fillColorSecondary', tocolor(176, 23, 130, 255))
    setPlayerHudComponentProperty('money', 'fontOutline', 1)
    setPlayerHudComponentProperty('money', 'fontStyle', 'subtitles')

    setPlayerHudComponentProperty('health', 'fillColor', tocolor(50, 168, 82, 255))

    setPlayerHudComponentProperty('ammo', 'fillColor', tocolor(245, 66, 126, 255))
    setPlayerHudComponentProperty('weapon', 'fillColor', tocolor(235, 76, 52, 255))

    setPlayerHudComponentProperty('wanted', 'fillColorSecondary', tocolor(140, 138, 137, 255))
    setPlayerHudComponentProperty('wanted', 'fillColor', tocolor(66, 33, 252, 255))
end)