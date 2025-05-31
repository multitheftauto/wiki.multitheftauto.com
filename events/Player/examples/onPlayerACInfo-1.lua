function handleOnPlayerACInfo( detectedACList, d3d9Size, d3d9MD5, d3d9SHA256 )
    outputChatBox( "ACInfo for " .. getPlayerName(source)
                .. " detectedACList:" .. table.concat(detectedACList,",")
                .. " d3d9Size:" .. d3d9Size
                .. " d3d9SHA256:" .. d3d9SHA256
                )
end
	
addEventHandler( "onPlayerACInfo", root, handleOnPlayerACInfo )

-- Ensure no one gets missed when the resource is (re)started
addEventHandler( "onResourceStart", resourceRoot,
    function()
        for _,plr in ipairs( getElementsByType("player") ) do
            resendPlayerACInfo( plr )
        end
    end
)