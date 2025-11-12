--By default, predefined variable 'root' is getRootElement()
local rootChildren = getElementChildren( root )

local resourceCount = 0
for k, child in ipairs( rootChildren ) do
	if getElementType( child ) == "resource" then
		resourceCount = resourceCount + 1
	end
end

outputChatBox( "There are " .. resourceCount .. " loaded resources." )