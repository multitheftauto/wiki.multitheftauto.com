addEventHandler("onClientClick", root,
    function(button, state)
        if state == "down" then
            browser:injectMouseDown(button)
        else
            browser:injectMouseUp(button)
        end 
    end
)