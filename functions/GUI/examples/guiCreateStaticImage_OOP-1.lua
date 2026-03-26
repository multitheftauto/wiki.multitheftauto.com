function showClientImage()
    GuiStaticImage(20, 200, 100, 100, "imagename.png", false)
end
addEventHandler("onClientResourceStart", resourceRoot, showClientImage)
