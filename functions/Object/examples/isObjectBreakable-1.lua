addEventHandler("onClientResourceStart", resourceRoot, function()
    local object = createObject(1337, 5540.6654, 1020.55122, 1240.545)
    if isObjectBreakable(object) then
        outputChatBox("Yes, the object is breakable.")
    else
        outputChatBox("No, the object is not breakable")
    end
end)