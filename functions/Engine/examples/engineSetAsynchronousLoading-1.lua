addEventHandler("onClientResourceStart", resourceRoot, function()
    if #getElementsByType("object") > 500 then
        engineSetAsynchronousLoading(true, false)
    end
end)
