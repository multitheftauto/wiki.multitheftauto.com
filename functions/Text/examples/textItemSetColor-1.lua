r,g,b,a = textItemGetColor ( theTextItem )           -- get the text color and store it in the variables 'r', 'g', 'b' and 'a'
if ( r == 0 ) and ( g == 255 ) and ( b == 0 ) then   -- if the color is green
    textItemSetColor ( theTextItem, 0, 0, 255, 255 ) -- set it to blue
end