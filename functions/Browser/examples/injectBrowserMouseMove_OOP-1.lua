addEventHandler("onClientCursorMove", root, function(relativeX, relativeY, absoluteX, absoluteY)
    browser:injectMouseMove(absoluteX, absoluteY)
end)