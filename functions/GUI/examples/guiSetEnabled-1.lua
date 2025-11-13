function ChangeMyButtonEnabled ( )        
    guiSetEnabled ( MyButton, not guiGetEnabled ( MyButton ) ) -- enable button if disabled. Disable if enabled
end
MyGuiWindow = guiCreateWindow(254,206,478,306,"Awesome Gui Window",false) -- Your gui window
MyButton = guiCreateButton(0.477,0.8268,0.1946,0.0784,"Hello World!",true,MyGuiWindow) -- Creates a button in your gui window
ChangeMyButtonEnabled ( ) -- Execute function