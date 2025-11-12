setDevelopmentMode (true)

addCommandHandler ("devdebug",
    function ()
        showCol (not isShowCollisionsEnabled())
    end
)