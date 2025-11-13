setDevelopmentMode (true)

addCommandHandler ("devdebug",
    function ()
        showSound (not isShowSoundEnabled())
    end
)