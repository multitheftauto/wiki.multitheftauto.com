local x,y = guiGetScreenSize()  -- Get players resolution.
local playerName = getPlayerName ( localPlayer )  -- Get players name.
local MOTDText = "Welcome to our server, this is a test MOTD script for MTA's Wiki."  -- Example of MOTD message.

function drawStuff()
	dxDrawRectangle ( x/3.8, y/3.8, x/2.02, y/2, tocolor ( 0, 0, 0, 150 ) ) -- Create our black transparent MOTD background Rectangle.
	dxDrawText ( "Welcome " .. playerName, x/3.5, y/3.6, x, y, tocolor ( 255, 255, 255, 255 ), 1, "bankgothic" ) -- Create Welcome title.
        dxDrawText ( "Welcome " .. playerName, x/3.48, y/3.58, x, y, tocolor ( 0, 0, 0, 255 ), 1, "bankgothic" ) -- Create Welcome title shadow.
	dxDrawLine ( x/3.6, y/3.3, x/1.35, y/3.3, tocolor ( 255, 255, 255, 255 ), 2 ) -- Create underline for title.
	dxDrawLine ( x/3.59, y/3.275, x/1.348, y/3.275, tocolor ( 0, 0, 0, 255 ), 2 ) -- Create underline shadow.
	dxDrawText ( MOTDText, x/3.6, y/3, x, y, tocolor ( 255, 255, 255, 255 ), 1, "clear" ) -- Create MOTD text.
end

addEventHandler("onClientRender", root, drawStuff)  -- Keep everything visible with onClientRender.