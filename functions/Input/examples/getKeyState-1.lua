-- define a function that outputs a message if control is pressed, and a different one if it isn't
function printMessageFunction()
	-- if the left or right control keys are pressed, the user has pressed the "lctrl + p" combo.
	if getKeyState("lctrl") or getKeyState("rctrl") then
		outputChatBox ("You have pressed 'Left Control + P'.")
	-- if none of those were pressed, the player just pressed the "p" key.
	else
		outputChatBox ("You have pressed 'p'.")
	end
end
-- bind the "p" key to our function
bindKey("p", "down", printMessageFunction)