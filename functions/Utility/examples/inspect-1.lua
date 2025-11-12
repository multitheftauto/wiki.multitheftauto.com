local Table = {    
    ["matrix"] = {position = {getElementPosition(localPlayer)},rotation = {getElementRotation( localPlayer )}},
    ["localplayer"] = getPlayerName(localPlayer),
}
local inspectedTblStr = inspect(Table)

addEventHandler("onClientRender",root,
    function( )
        --> then draw the created string.
        --> Try to NOT use such functions under onClientRender, since it works with loops, and if we want to print a bigger table, it will drop some frames.
        dxDrawText(inspectedTblStr,10,250)
    end
)