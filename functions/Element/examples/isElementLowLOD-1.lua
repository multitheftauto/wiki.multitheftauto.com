local lowlods = 0

for i, obj in ipairs(getElementsByType("object")) do
    if isElementLowLOD(obj) then
        lowlods = lowlods + 1
    end
end

print("There are " .. lowlods .. " low LOD objects around the world.")