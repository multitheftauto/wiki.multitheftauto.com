local x, y, z, lx, ly, lz = getCameraMatrix()
x, lx = x + 1, lx + 1

setCameraMatrix(x, y, z, lx, ly, lz)
