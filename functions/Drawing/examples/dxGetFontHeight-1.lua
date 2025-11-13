screenWidth, screenHeight = guiGetScreenSize() -- Get the screen resolution
scale = 2  -- The scale of both texts

-- We add an event handler to keep drawing the text 
addEventHandler("onClientRender",root,function()

   -- Draw the first text 400 pixels from the top and left of the screen
   dxDrawText("Hello!", 400, 400, screenWidth,screenHeight,tocolor(255,255,255,255),scale,"pricedown")

   -- Draw the second text above the first one.
   -- The variable "offset" will return the height of the first text, so we can position the second text above the first one. 
   -- If we changed the scale, the second text would still be above the first one, since we calculated the height of the font. 
   offset = dxGetFontHeight(scale,"pricedown")
   dxDrawText("Hello!", 400, 400 - offset, screenWidth, screenHeight,tocolor(255,255,255,255),scale,"pricedown")
end)