-- Display a gui label
local myLabel = guiCreateLabel( 100, 300, 400, 50, "GUI label", false )

-- Use 'toggle' command to switch custom font on and off
addCommandHandler( "toggle",
    function()
        if not myFont then
            myFont = guiCreateFont( "segoeui.ttf", 20 )  -- Create GUI custom font
            guiSetFont( myLabel, myFont )                -- Apply font to a widget
        else        
            destroyElement( myFont )                     -- Destroy custom font
            myFont = nil
        end
    end
)