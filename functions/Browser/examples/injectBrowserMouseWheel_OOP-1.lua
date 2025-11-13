local webBrowser = Browser(1000, 1000, false, false)
showCursor(true)

function webBrowserRender()
        dxDrawImage(0, 0, 1000, 1000, webBrowser, 0, 0, 0, tocolor(255,255,255,255), true)
end

addEventHandler("onClientBrowserCreated", webBrowser,
        function()
              webBrowser.url = "https://www.youtube.com/tv#/watch?mode=transport&v=jofNR_WkoCE"
              addEventHandler("onClientRender", root, webBrowserRender)
              addEventHandler("onClientKey", root, onKey)
	end
)

function onKey(button)
	if button == "mouse_wheel_down" then
		webBrowser:injectMouseWheel(-40, 0)
	elseif button == "mouse_wheel_up" then
		webBrowser:injectMouseWheel(40, 0)
	end
end