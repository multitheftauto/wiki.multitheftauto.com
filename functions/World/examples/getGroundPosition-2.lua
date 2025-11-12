function getGroundDistance( thePlayer, zHeight  )
	local x,y,z = getElementPosition(thePlayer) -- get position
    local groundPosition = getGroundPosition(x,y,z) -- get default ground pos 
	local hit, x1, y1, groundPosition = processLineOfSight(x,y,z+1,x,y,z-(zHeight+0.7))  -- using zHeight get a better ground position
	local distance = getDistanceBetweenPoints3D(x, y, z, x,y, (groundPosition or z))  -- get distance between both positions 
	return distance -- return the distance
end

-- Some cool examples:  
addCommandHandler("gdistance",function(_, amount)
    local distance = getGroundDistance(localPlayer, tonumber(amount))
    outputChatBox("The distance to reach ground is: " .. distance)
end)

addCommandHandler("do_im_flying",function()
    local distance = getGroundDistance(localPlayer, 20)
    if distance > 1 then 
        outputChatBox("Superman!! the distance between you and ground is: " .. distance)
    else 
        outputChatBox("naah")
    end 
end)