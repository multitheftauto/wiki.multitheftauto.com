local o = Object(1337, 0, 0, 0)

addCommandHandler("test", function()
    if o.onScreen then
        outputChatBox("Element is on screen")
    else
        outputChatBox("Element is off screen")
    end
end)