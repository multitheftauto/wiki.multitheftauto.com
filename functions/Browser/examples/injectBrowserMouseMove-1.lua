addEventHandler("onClientCursorMove", root,
    function (relativeX, relativeY, absoluteX, absoluteY)
        injectBrowserMouseMove(browser, absoluteX, absoluteY)
    end
)