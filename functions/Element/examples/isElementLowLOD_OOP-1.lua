local lowlods = 0

for i, obj in ipairs(Element.getAllByType("object")) do
    if obj:isLowLOD() then
        lowlods = lowlods + 1
    end
end

print("There are " .. lowlods .. " low LOD objects around the world.")