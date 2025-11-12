-- Creates polygon colshape at 0, 0, 4
local shape = createColPolygon ( -1.08, -0.05, 2.92, -0.05, -1.08, -4.05, -5.08, -0.05, -1.08, 3.95 )
function removePointToPolygon ( plr, cmd, index )
    if ( not index ) then
        -- if index argument after command is not there
        outputChatBox ( "Correct syntax: /removepoint <index>", plr, 255, 25, 25 )
        return false
    end
    -- Convert string to number 'index'
    local index = tonumber ( index )
    -- Get all polygon colshape points
    local indexes = #getColPolygonPoints ( shape )
    if ( index > indexes ) then
        outputChatBox("Index point is greater than last index "..indexes, plr, 255, 25, 25)
        return false
    else
        -- Remove polygon point at index
        removeColPolygonPoint(shape, index)
    end
    outputChatBox ( "Point at index "..index.." removed", plr, 0, 255, 0 )
end
addCommandHandler ( "removepoint", removePointToPolygon )