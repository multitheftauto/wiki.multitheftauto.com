local dummies = {
	"light_front_main",
	"light_rear_main",
	"light_front_second",
	"light_rear_second",
	"seat_front",
	"seat_rear",
	"exhaust",
	"engine",
	"gas_cap",
	"trailer_attach",
	"hand_rest",
	"exhaust_second",
	"wing_airtrail",
	"veh_gun"
}

function draw()
	local veh = getPedOccupiedVehicle( localPlayer )
	if not veh then return end

	local mat = getElementMatrix(veh)
	local vx,vy,vz = getMatrixPosition(mat)
	local fx,fy,fz = getMatrixForward(mat)
	local lx,ly,lz = getMatrixLeft(mat)
	local ux,uy,uz = getMatrixUp(mat)
	local model = getElementModel(veh)

	for i,dum in ipairs(dummies) do
		local v = {getVehicleModelDummyPosition(model, dum)}
		if v[1] ~= 0 or v[2] ~= 0 or v[3] ~= 0 then
			local px,py,pz = vx,vy,vz
			px = px+fx*v[2]+lx*v[1]+ux*v[3]
			py = py+fy*v[2]+ly*v[1]+uy*v[3]
			pz = pz+fz*v[2]+lz*v[1]+uz*v[3]

			local sx,sy = getScreenFromWorldPosition( px,py,pz,0,false )
			if sx then
				dxDrawRectangle( sx-10, sy-10, 20, 20, v[4] )
				dxDrawText(i-1, sx-5,sy-5,20,20,tocolor( 0,0,0 ))
			end
		end
	end
end
addEventHandler("onClientRender", root, draw)

-- Utility functions, not related to main functionality
function getElementMatrix(element)
    local rx, ry, rz = getElementRotation(element, "ZXY")
    rx, ry, rz = math.rad(rx), math.rad(ry), math.rad(rz)
    local matrix = {}
    matrix[1] = {}
    matrix[1][1] = math.cos(rz)*math.cos(ry) - math.sin(rz)*math.sin(rx)*math.sin(ry)
    matrix[1][2] = math.cos(ry)*math.sin(rz) + math.cos(rz)*math.sin(rx)*math.sin(ry)
    matrix[1][3] = -math.cos(rx)*math.sin(ry)
    matrix[1][4] = 1

    matrix[2] = {}
    matrix[2][1] = -math.cos(rx)*math.sin(rz)
    matrix[2][2] = math.cos(rz)*math.cos(rx)
    matrix[2][3] = math.sin(rx)
    matrix[2][4] = 1

    matrix[3] = {}
    matrix[3][1] = math.cos(rz)*math.sin(ry) + math.cos(ry)*math.sin(rz)*math.sin(rx)
    matrix[3][2] = math.sin(rz)*math.sin(ry) - math.cos(rz)*math.cos(ry)*math.sin(rx)
    matrix[3][3] = math.cos(rx)*math.cos(ry)
    matrix[3][4] = 1

    matrix[4] = {}
    matrix[4][1], matrix[4][2], matrix[4][3] = getElementPosition(element)
    matrix[4][4] = 1

    return matrix
end

function getMatrixLeft(m)
    return m[1][1], m[1][2], m[1][3]
end
function getMatrixForward(m)
    return m[2][1], m[2][2], m[2][3]
end
function getMatrixUp(m)
    return m[3][1], m[3][2], m[3][3]
end
function getMatrixPosition(m)
    return m[4][1], m[4][2], m[4][3]
end