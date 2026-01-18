local textures = Engine.getModelTextures(3722)
iprint(textures)

-- Prevent memory leak
for _,v in pairs(textures) do
    v:destroy()
end