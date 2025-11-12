-- Remove all world models
for i=700,20000 do
    removeWorldModel(i,10000,0,0,0)
end

-- Turn off occlusions with simple check
if getOcclusionsEnabled() then
    setOcclusionsEnabled( false )
end