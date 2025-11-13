local texture = dxCreateTexture(4,4)        --Create a texture
local pixel = dxGetTexturePixels(texture)  --Get pixel element
local sx,sy = dxGetPixelsSize(pixel)             --Get pixel size
local tab = {}                                           --Define a table
for i=0,sx-1 do                                         --From 0th pixel to 3th pixel in width
    tab[i+1] = {}                                         --Define a table
    for j=0,sy-1 do                                     --From 0th pixel to 3th pixel in height
        local r,g,b,a = dxGetPixelColor(pixel,i,j) --Get pixel color
        tab[i+1][j+1] = {r,g,b,a}                      --Save the color in the table
    end
end