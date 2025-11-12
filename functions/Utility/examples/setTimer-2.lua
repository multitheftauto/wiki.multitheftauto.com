function mainFunction()
        outputChatBox ("Instant text!")
	setTimer ( function()
		outputChatBox ( "5 second delay text!" )
	end, 5000, 1 )
end

mainFunction() --call function