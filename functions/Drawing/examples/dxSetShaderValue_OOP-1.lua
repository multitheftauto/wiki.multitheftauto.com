local myShader = DxShader("hello.fx")
local myTexture = DxTexture("man.png")

myShader:setValue("texture0", myTexture) -- Set a texture
myShader:setValue("bShowThing", true) -- Set a bool                  
myShader:setValue("speed", 2.4) -- Set a float
myShader:setValue("positionOfCheese", 100, 200, 300) -- Set a list of numbers, with max 16 numbers. Btw, this is a float: 3.4. This can be used to fill an array in HLSL.
