function outputPressedCharacter(character)
	if character==" " then --if the character is a space
		character = "space" --change 'character' to 'space'
	end
    outputChatBox("You pressed the character "..character.."!") --output the character
end
addEventHandler("onClientCharacter", getRootElement(), outputPressedCharacter)