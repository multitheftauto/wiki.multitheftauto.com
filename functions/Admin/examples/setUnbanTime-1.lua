addCommandHandler("banMe",
function (player)
local ban = banPlayer(player)
setUnbanTime(ban, 500)
end
)