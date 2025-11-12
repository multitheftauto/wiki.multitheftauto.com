function minMaxOutput( theElement )
    local x0, y0, z0, x1, y1, z1 = getElementBoundingBox( theElement )

    if ( x0 ) then
        outputChatBox( "The coords are: " .. x0 .. ", " .. y0 .. ", " .. z0 .. ", " .. x1 .. ", " .. y1 .. ", " .. z1 )
    else
        outputChatBox( "Failed to retrieve bounding box" )
    end
end