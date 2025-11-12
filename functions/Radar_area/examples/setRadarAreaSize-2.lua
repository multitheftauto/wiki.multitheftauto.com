aRadarArea = createRadarArea ( 1024, 1024, 30, 140, 255, 255, 0, 85 )
flag = setRadarAreaSize ( aRadarArea, 50, 90 )
if ( flag ) then
    outputChatBox ( "Radar area size set successfully!" )
else
    outputChatBox ( "Failed to set radar area size." )
end