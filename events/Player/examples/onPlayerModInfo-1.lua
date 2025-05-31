function handleOnPlayerModInfo ( filename, modList )
    -- Print player name and file name
    outputChatBox( getPlayerName(source) .. " " .. filename )

    -- Print details on each modification
    for idx,item in ipairs(modList) do
        outputChatBox( idx .. ") id:" .. item.id .. " name:" .. item.name )
        if item.sizeX then
            outputChatBox( "size:" .. item.sizeX .. "," .. item.sizeY .. "," .. item.sizeZ )
            outputChatBox( "originalSize:" .. item.originalSizeX .. "," .. item.originalSizeY .. "," .. item.originalSizeZ )
        end
        if item.length then
            outputChatBox( "length:" .. item.length .. " md5:" .. item.md5 )
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