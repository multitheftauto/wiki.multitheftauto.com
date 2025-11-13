addEvent("onReadFile",true)
addEventHandler("onReadFile",root,function(data)
	local file = fileCreate("text.txt")					--Save "data" into "text.txt"
	fileWrite(file,data)
	fileClose(file)
end)