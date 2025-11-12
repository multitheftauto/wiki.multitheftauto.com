-- Remove all world models
for i=550,20000 do
    removeWorldModel(i,10000,0,0,0)
end
-- Turn off occlusions
setOcclusionsEnabled( false )