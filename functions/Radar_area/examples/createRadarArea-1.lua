-- create our hill area for our gamemode
local hillArea = createColRectangle ( -2171.0678710938, 678.17950439453, 15, 15 )
local hillRadar = createRadarArea ( -2183.5678710938, 705.67950439453, 40, -40, 0, 255, 0, 175 )

-- add hill_Enter as a handler for when a player enters the hill area
function hill_Enter ( thePlayer, matchingDimension )
        -- announce to everyone that the player entered the hill
        if (getElementType(thePlayer) == "player") then
                outputChatBox( getPlayerName(thePlayer) .. " entered the zone!", root, 255, 255, 109 )
                setRadarAreaFlashing ( hillRadar, true )
        end
end
addEventHandler ( "onColShapeHit", hillArea, hill_Enter )

-- add hill_Enter as a handler for when a player leaves the hill area
function hill_Exit ( thePlayer, matchingDimension )
        -- check if the player is not dead
        if (getElementType(thePlayer) == "player") then
                if isPedDead ( thePlayer ) ~= true then
                        -- if he was alive, announce to everyone that the player has left the hill
                        outputChatBox ( getPlayerName(thePlayer) .. " left the zone!", root, 255, 255, 109 )
                        setRadarAreaFlashing ( hillRadar, false )
                end
        end
end
addEventHandler ( "onColShapeLeave", hillArea, hill_Exit )