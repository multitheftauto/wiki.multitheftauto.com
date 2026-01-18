local textures = engineGetModelTextures(3722)
iprint(textures)

-- Prevent memory leak
for _,v in pairs(textures) do
    destroyElement(v)
end