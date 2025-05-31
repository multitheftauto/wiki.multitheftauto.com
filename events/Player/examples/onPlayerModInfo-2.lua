checkModels = { "m4.dff", "ak47.dff" }

function handleOnPlayerModInfo ( filename, modList )
    for _,item in ipairs(modList) do			-- Check each modified item
        for _,checkName in ipairs(checkModels) do
            if item.name == checkName then		-- See if modified item is in our check list
                outputChatBox ( "Not allowed to used modified weapons. Please restore " .. filename )
            end
        end
    end
end
	
addEventHandler ( "onPlayerModInfo", getRootElement(), handleOnPlayerModInfo )

-- Ensure no one gets missed when the resource is (re)started
addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,plr in ipairs( getElementsByType("player") ) do
            resendPlayerModInfo( plr )
        end
    end
)