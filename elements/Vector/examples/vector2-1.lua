addEventHandler ( "onClientResourceStart", resourceRoot, function()
    local screenSize = Vector2(guiGetScreenSize())
    if screenSize.x < 1360 and screenSize.y < 768 then
        outputChatBox ("You are running on a low resolution")
    end
end)