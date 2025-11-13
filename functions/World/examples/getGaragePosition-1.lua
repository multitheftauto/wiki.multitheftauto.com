function getNearestGarageFromElement (element)
  nearestID = -1
  nearestDistance = 999999999999
  local ex,ey,ez = getElementPosition (element)
  for i=0,49 do
    local x,y,z = getGaragePosition (i)
    if (getDistanceBetweenPoints3D (ex,ey,ez,x,y,z) < nearestDistance) then
      nearestID = i
      nearestDistance = getDistanceBetweenPoints3D (ex,ey,ez,x,y,z)
    end
  end
  local _nearestID = nearestID
  nearestID = nil
  return _nearestID
end

addCommandHandler ("findgarage",
function(command)
  local garageID = getNearestGarageFromElement (getLocalPlayer())
  if (garageID ~= -1) then
    local x,y,z = getGaragePosition (garageID)
    local garageBlip = createBlip (x,y,z,41)
    setTimer (
      function (garageBlip)
        destroyElement (garageBlip)
      end
    ,10000,1,garageBlip)
  end
end)