-- The handler function for the console command
function nametagColorChange ( thePlayer, commandName, r, g, b )
    -- Apply the new color mix of RGB to the command handler activator
    setPlayerNametagColor ( thePlayer, r, g, b )
end
-- This is a command handler that activates on text "nametagcolor" in the console. It also asks 
-- the player to provide values for the extra parameters r, g, b after the command name. These will 
-- be the new color mix of RGB to apply to the player's name tag.
addCommandHandler ( "nametagcolor", nametagColorChange )