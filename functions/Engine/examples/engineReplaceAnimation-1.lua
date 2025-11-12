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
local customBlockName = "myNewBlock"

-- load the IFP file
local IFP = engineLoadIFP( "parkour.ifp", customBlockName )

-- let us know if IFP failed to load
if not IFP then
    outputChatBox( "Failed to load 'parkour.ifp'" )
end

-- replace the crouch animation
engineReplaceAnimation( localPlayer, "ped", "weapon_crouch", customBlockName, "HandPlant" )