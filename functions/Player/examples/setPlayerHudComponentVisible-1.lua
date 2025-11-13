-- Hide some of the hud components when a player joins the server
addEventHandler ( "onPlayerJoin", root, 
    function ()
        setPlayerHudComponentVisible ( source, "ammo", false )    -- Hide the ammo displays for the newly joined player
        setPlayerHudComponentVisible ( source, "weapon", false )  -- Hide the weapon displays for the newly joined player
    end
)