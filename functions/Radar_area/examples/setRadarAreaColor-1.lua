someArea = createRadarArea ( 1024, 1024, 75, 100, 0, 0, 0, 255 ) -- create a black radar area
local flag = setRadarAreaColor ( someArea, 255, 85, 85, 170 )    -- change its color
if ( flag ) then                                                 -- if the function returned true...
   outputChatBox ( "Color set successfully!" )
else                                                             -- if the function returned false...
   outputChatBox ( "Failed to set color." )
end