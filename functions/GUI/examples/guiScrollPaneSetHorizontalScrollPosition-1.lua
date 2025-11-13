if ( myScrollPane ) then -- if the scroll pane exist then
	-- set the position
        guiScrollPaneSetHorizontalScrollPosition( myScrollPane, 100 ) -- right end
        -- get the position
	local position = guiScrollPaneGetHorizontalScrollPosition( myScrollPane )
	-- output to the chatbox
	outputChatBox ( "Current position of scroll pane:" .. tostring(position) .. "%" )
else -- if the scroll pane was not found
       outputChatBox ("scroll pane not found!")
end