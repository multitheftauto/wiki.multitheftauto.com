addEventHandler("onClientResourceStart", resourceRoot, function()
    if #Element.getAllByType("object") > 500 then
        Engine.setAsynchronousLoading(true, false)
    end
end)
