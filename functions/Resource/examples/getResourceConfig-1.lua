function resourceStart ( )                         -- When the resource is started
    local node = getResourceConfig( "config.xml" )  -- get the configuration file
    local subNode = xmlFindChild( node, "group", 0 )      -- get a subnode in it
    outputChatBox( xmlNodeGetAttribute( subNode, "attr" ),root )    -- output its attributes value to chatbox
end
addEventHandler ( "onResourceStart", resourceRoot, resourceStart )