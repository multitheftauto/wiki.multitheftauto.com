local radarareas = getElementsByType ( "radararea" ) -- get a table of radararea elements
for k, theArea in ipairs(radarareas) do -- use a generic for loop to step through each of the elements
   local sizeX, sizeY = getRadarAreaSize ( theArea ) -- get the size of the radar area
   if ( sizeX < 100 and sizeY < 100 ) then -- check if it's smaller than 100 by 100
      outputChatBox ( "A small radar area was found!" )
   end
end