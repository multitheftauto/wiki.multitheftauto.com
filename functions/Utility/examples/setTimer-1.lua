-- define function to be called
function delayedChat ( text )
	outputChatBox ( "Delayed text: " .. text )
end

-- set a timer so the function is called after 1 second
setTimer ( delayedChat, 1000, 1, "Hello, World!" )