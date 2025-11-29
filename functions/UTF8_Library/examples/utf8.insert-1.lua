local word = 'world'
local output = utf8.insert('hello ', word)
print(output) -- hello world

local output2 = utf8.insert('hello ', utf8.len('hello ') + 1, word)
print(output2) -- hello world