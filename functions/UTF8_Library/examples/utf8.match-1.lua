local input = "Level: 5, Rank: General, 128.42 points"
local level, rank, points = utf8.match( input, "Level: (%d+), Rank: (.-), (%d+.?%d*) points" )
level, points = tonumber( level ), tonumber( points )

print( level, rank, points ) -- 5, General, 128.42