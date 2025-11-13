local vertices = {}
function onClick(btn, state, x, y)
	if btn ~= "left" then return end
	if state ~= "up" then return end
	local vertex = {x, y, tocolor(math.random(255), math.random(255), math.random(255))}
	table.insert(vertices, vertex)
end
addEventHandler("onClientClick", root, onClick)

function draw()
	dxDrawPrimitive("trianglefan", true, unpack(vertices))
end
addEventHandler("onClientPreRender", root, draw)