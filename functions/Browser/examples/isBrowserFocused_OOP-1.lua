local theBrowser = guiBrowser ( 150, 150, 1280, 720, true, false, false)
addEventHandler("onClientKey", localPlayer,
	function(button, state)  -- adds the event handler.
		if button == "lctrl" and state = "down" then -- if the pressed key is lctrl and the state is down then we will check is the browser focused or not. 
			if theBrowser:isFocused() then
				outputChatbox("the browser is focused.") -- if the browser is focused then we will write this to chatbox.
			else
				outputChatbox("the browser is not focused.")-- if the browser is not focused then we will write this to chatbox.
			end
 		end
	end
)