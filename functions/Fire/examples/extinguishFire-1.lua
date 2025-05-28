local start = {0, 0, 4}

for i = 1, 10 do
    createFire(start[1] + i, start[2], start[3])
end

extinguishFire(start[1], start[2], start[3], 10)