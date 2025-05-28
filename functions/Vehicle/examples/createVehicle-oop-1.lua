function makeVehicle(model, x, y, z, rx, ry, rz)
    assert(type(model)=="number", "Model must be a number")
    assert(type(x)=="number", "X coordinate must be a number")
    assert(type(y)=="number", "Y coordinate must be a number")
    assert(type(z)=="number", "Z coordinate must be a number")
    if not rx then rx = 0 end
    if not ry then ry = 0 end
    if not rz then rz = 0 end
    assert(type(rx)=="number", "Rotation X must be a number")
    assert(type(ry)=="number", "Rotation Y must be a number")
    assert(type(rz)=="number", "Rotation Z must be a number")
    return Vehicle(model, x, y, z, rx, ry, rz)
end