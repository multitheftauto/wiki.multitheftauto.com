function checkArea(sourcePlayer)
    if ( isRadarAreaFlashing ( glenpark ) ) then          -- if the radar area in the variable glenpark is flashing
        outputChatBox ( "Glen Park is under attack!!!" )  -- announce it
    end
end
addCommandHandler("checkArea", checkArea)