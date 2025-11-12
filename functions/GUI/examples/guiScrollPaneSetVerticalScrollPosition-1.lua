if ( myScrollPane ) then -- if the scroll pane exist then
	-- set the position
        guiScrollPaneSetVerticalScrollPosition( myScrollPane, 33.3 ) -- 1/3 from the upside
        -- get the position
	local position = guiScrollPaneGetVerticalScrollPosition( myScrollPane )
	-- output to the chatbox
	outputChatBox ( "Current position of scroll pane:" .. tostring(position) .. "%" )
else -- if the scroll pane was not found
       outputChatBox ("scroll pane not found!")
end