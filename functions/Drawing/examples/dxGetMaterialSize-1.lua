myTexture = dxCreateTexture( "man.png" )
local width, height = dxGetMaterialSize( myTexture )
outputChatBox( "man.png is " .. tostring(width) .. " pixels wide and " .. tostring(height) .. " pixels high" )