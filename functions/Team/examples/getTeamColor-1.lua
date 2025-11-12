function teamInfo ( source )
    local r, g, b
    local playerTeam = getPlayerTeam( source )
  
    -- Make a string to print out the player's team information
    local text = getPlayerName ( source )

    if ( playerTeam ) then -- If the player is on a team (team is not false)
        -- Add the team name to the string
        text = text .. " is on " .. getTeamName ( playerTeam )
    
        -- Get the red, green, and blue values of the team's color
        r, g, b = getTeamColor ( playerTeam )
    
        -- Convert the colors to strings and add them to the string
        text = text .. " with team colors: " .. tostring(r) .. ", " .. tostring(g) .. ", " .. tostring(b)
    else                   -- if he's not on a team
        text = text .. " is not on a team."
    end

    -- Print the string with the player's team information
    outputChatBox ( text )
end

-- Add console command to print out your team information
addCommandHandler ( "teamInfo", teamInfo )