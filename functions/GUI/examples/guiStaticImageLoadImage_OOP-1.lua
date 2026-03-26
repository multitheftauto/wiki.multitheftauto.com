local myImage = GuiStaticImage(0.45, 0.48, 0.2, 0.5, "myimage.png", true)

Timer(function()
    myImage.image = "otherimage.png"
end, 10000, 1)