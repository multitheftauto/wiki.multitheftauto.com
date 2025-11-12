function cMemoFPlayer()
    Window = guiCreateWindow(0.3664, 0.2764, 0.3508, 0.3477, "GUI Window", true)
    guiCreateMemo(17, 79, 414, 246, "", false, Window)
end
addEventHandler("onClientResourceStart", resourceRoot, cMemoFPlayer)