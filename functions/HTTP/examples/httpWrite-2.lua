<*
local file = fileOpen ( "icons/icon.png" )
if file then
	while not fileIsEOF(file) do            
		buffer = fileRead(file, 500)         
		httpWrite(buffer, buffer:len())
	end
	fileClose(file)                           
	httpSetResponseHeader ( "content-type", "image/png")
else
	*>
	Could not read file
	<*
end
*>