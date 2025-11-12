--[[
credits to Paul_Cortez for the IFP file.
parkour.ifp has following animations:

BckHndSpingBTuck
BckHndSping
CartWheel
FrntHndSpring
HandPlant
]]

-- you can choose any name you want, do not choose a default GTA:SA block name
-- Remember to namespace your block. That's why it starts with `test.`
local customBlockName = "test.myNewBlock"

-- load the IFP file
local IFP = engineLoadIFP( "parkour.ifp", customBlockName )

-- let us know if IFP failed to load
if not IFP then
    outputChatBox( "Failed to load 'parkour.ifp'" )
end

-- execute the command using /animation <NameOfCustomAnimation>
-- for example, /animation CartWheel
function setanimation( _, animationName )
    -- check if IFP file has loaded
    if IFP then
        -- now play our custom animation
        setPedAnimation( localPlayer, customBlockName, animationName )
    end
end
addCommandHandler( "animation", setanimation )