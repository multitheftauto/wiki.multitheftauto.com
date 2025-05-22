-- Calculate angle between vec1 and vec2
function angle(vec1, vec2)
    -- Calculate the angle by applying law of cosines
    return math.acos(vec1:dot(vec2)/(vec1.length*vec2.length))
end

local vec1 = Vector3(1, 0, 0)
local vec2 = Vector3(0, 0, 0)
local dotproduct = vec1:dot(vec2)

if dotproduct == 0 then
    outputDebugString("vec1 is orthogonal to vec2")
end

outputDebugString("Angle between vec1 and vec2: "..math.deg(angle(vec1, vec2)).."°")