if fileExists("text.txt")
	file = fileOpen("test.txt")						--Open a file (you can create it yourself).
	local data = fileRead(file,100*1024*1024)				--Max 100 MB
	fileClose(file)								--Close File
	triggerLatentServerEvent("onReadFile",5000,false,root,data)	--trigger
end