local myImage = guiCreateStaticImage( 0.45, 0.48, 0.2, 0.5, "myimage.png", true )
setTimer( guiStaticImageLoadImage, 10000, 1, myImage, "otherimage.png" )