addEventHandler("onClientResourceStart",resourceRoot,
	function()
		-- create a window and create a scrollpane on it
		local window = guiCreateWindow(5,5,130,150,"",false)
		-- the width and height values here are largely irrelevant as the scrollpane will automatically resize when needed
		scrollpane = guiCreateScrollPane(0,0,130,150,false,window)
	end
)

addCommandHandler("fill",
	function()
		-- if the scrollpane exists
		if scrollpane then
			-- delete all the existing labels
			for i,v in ipairs(getElementChildren(scrollpane)) do
				destroyElement(v)
			end
		
			-- for every player in the server
			for i,v in ipairs(getElementsByType("player")) do
				-- create a label with their name on the scrollpane
				guiCreateLabel(5,i*20,90,20,tostring(getPlayerName(v)),false,scrollpane)
			end
		end
	end
)