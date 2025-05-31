addEventHandler("onClientObjectBreak", root,
    function()
        if getElementInterior(source) ~= 0 then
            cancelEvent()
        end
    end
)