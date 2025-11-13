[lua]
addEventHandler("onClientResourceStart", resourceRoot,
	function ()
		local image = guiCreateStaticImage(200, 200, 10, 10, "image.png", false) --Creates image at 200x200 point on screen
		local x, y = guiStaticImageGetNativeSize(image) --Gets the original size
		guiSetSize(image, x, y, false) --Sets the size to native one
	end)