--Create a gridlist
myWindow = guiCreateWindow ( 0.30, 0.10, 0.5, 0.60, "GUI window title", true )

--Add a command handler to change the alpha of the GUI window.
--Usage example: '/alpha 0.8', where 0.8 is stored as alphaAmount
function changeAlpha ( commandName, alphaAmount )
		alphaAmount = tonumber(alphaAmount)
		guiSetAlpha ( myWindow, alphaAmount )
end
addCommandHandler ( "alpha", changeAlpha )