local r,g,b,a = getRadarAreaColor ( area )           -- get the color of 'area' and store it in 'r', 'g', 'b' and 'a'
if r == 0 and g == 255 and b == 0 then               -- if the radar area is fully green
    outputChatBox ( "This is Grove Street turf!" )   -- announce it as grove street area
elseif r == 255 and g == 0 and b == 255 then         -- if it is purple however
    outputChatBox ( "This is Ballas turf!" )         -- announce it as ballas area
end