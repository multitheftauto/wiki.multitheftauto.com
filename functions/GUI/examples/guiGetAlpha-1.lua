function guiFade( gui, state )
	if state == "in" then -- This state will fade IN the GUI
	fadeIn = setTimer(guiFade, 50, 1, gui, state) -- We loop the function to make it lower the alpha each 50 ms
	alpha = guiGetAlpha(gui) -- We get the GUI's actual alpha after each loop
	guiSetAlpha(gui, alpha - 0.1) -- We set the GUI's actual alpha after each loop
	if alpha == 0 then -- If the loop reached "0"...
		guiSetVisible(gui, false) -- We set the GUI visibility to 0 so it won't be clickable or editable
		killTimer(fadeIn) -- ... We kill the timer
		fadeIn = nil -- And to make sure it doesn't exist anymore, we set it to nil
		end
	elseif state == "out" then -- This state will fade OUT the GUI
		guiSetVisible(gui, true) -- Since the GUI will still be click-able, we'll set it's visibility to "false"
		fadeOut = setTimer(guiFade, 50, 1, gui, state) -- We loop the function to make it higher the alpha each 50 ms
		alpha = guiGetAlpha(gui) -- We get the GUI's actual alpha after each loop
		guiSetAlpha(gui, alpha + 0.1) -- We set the GUI's actual alpha after each loop
		if alpha == 1 then -- If the loop reached "1"...
			killTimer(fadeOut) -- ... We kill the timer
			fadeOut = nil -- And to make sure it doesn't exist anymore, we set it to nil
		end
	end
end

-- NOTE: If you're using a button to pop up the GUI-Element. Use "guiSetEnabled" along with the button. You'll have also to set a timer in order to disable it by the time it fades, either way it will bug.