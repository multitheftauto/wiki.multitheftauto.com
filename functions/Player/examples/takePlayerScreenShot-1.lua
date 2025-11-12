local screenSizeX,screenSizeY = guiGetScreenSize() -- save the current screen dimensions
local imgtexture
local takenBy

function wepFire(weapon)
	if weapon == 43 then -- if the weapon the player just fired is the camera
		triggerServerEvent("onPlayerTakesPhoto",localPlayer)
	end
end
addEventHandler("onClientPlayerWeaponFire",localPlayer,wepFire)

function updateLatestPhoto(img)
	if imgtexture then -- clean up the old dxTextrue if there is one
		destroyElement(imgtexture)
	end
	imgtexture = dxCreateTexture(img) -- create a new dxTexture from the image data so that we can render it using dxDrawImage
	takenBy = "taken by "..getPlayerName(source) -- let's also credit the photographer
end
addEvent("updatePhoto",true)
addEventHandler("updatePhoto",root,updateLatestPhoto)

function renderPhoto()
	if imgtexture then
		local sizeX, sizeY = 320, 240
		dxDrawImage(screenSizeX-sizeX,screenSizeY-sizeY,sizeX,sizeY,imgtexture) -- render the picture as well as the name of the photographer in the bottom right corner of the screen
		dxDrawText(takenBy,screenSizeX-sizeX,screenSizeY-sizeY,screenSizeX,screenSizeY,tocolor(0,0,0))
	end
end
addEventHandler("onClientRender",root,renderPhoto)