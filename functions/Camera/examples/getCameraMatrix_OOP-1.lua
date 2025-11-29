local x, y, z, lx, ly, lz = Camera.getMatrix()
x, lx = x + 1, lx + 1

Camera.setMatrix(x, y, z, lx, ly, lz)