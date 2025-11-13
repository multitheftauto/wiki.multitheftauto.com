addEventHandler("onResourceStart", getRootElement(),
    function(res)
        outputConsole("Resource " .. getResourceName(res) .. " just started.")
    end
)