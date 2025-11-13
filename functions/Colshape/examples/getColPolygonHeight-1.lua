-- Creates polygon colshape at 0, 0, 4
 local colPoly = createColPolygon ( -1.08, -0.05, 2.92, -0.05, -1.08, -4.05, -5.08, -0.05, -1.08, 3.95 )
 -- Set its height to 4 unit
 setColPolygonHeight ( colPoly, 2.32, 7.12 )
 
 function showPolyHeight ( player, command )
     -- Get element position
     local x, y = getElementPosition ( colPoly )
     -- Get table floor and ceil of the colshape height and unpack it
     local z, z1 = unpack ( getColPolygonHeight ( colPoly ) )
     local heights = z1 - z
     -- Output it in his chatbox
     outputChatBox( "The Polygon Colshape at "..x..", "..y.." height is "..heights, player, 255, 255, 0)
 end
 addCommandHandler ( "getpolyheight", showPolyHeight )