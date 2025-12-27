local shape = ColShape.Sphere(0, 0, 0, 5)

addCommandHandler('checkColShape', function(player)
    local isWithin = player:isWithinColShape(shape)
    if isWithin then
        player:outputChat("You are within the colshape!")
    else
        player:outputChat("You are outside the colshape.")
    end
end)