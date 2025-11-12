function resourceStartNotify ( resourcename )
	-- Example of outputting tables, and elements directly
	iprint(getElementsByType("player"))
	iprint(getElementsByType("vehicle"))
	-- Example of outputting multiple items at once
	iprint("this resource:",getThisResource(),"state:",getResourceState(getThisResource()),"resource root:",getResourceRootElement(getThisResource()))
end
addEventHandler( "onResourceStart", getRootElement(), resourceStartNotify )