function OnPlayerFire(w,a,aC,hX,hY,hZ,hE)-- the function to which onClientPlayerFire is attached, contains the Paramteres for the the Bullet hit Position
 local sx,sy,sz = getPedWeaponMuzzlePosition(source)-- get the WeaponMuzzlePosition of the Player who shot
 Position = {sx,sy,sz,hX,hY,hZ} -- save it in a table so we can use it later in 'onClientRender'function
 removeEventHandler("onClientRender",root,onRender)-- remove onClientRender-Event from function onRender  to not have multiple add for same function
 addEventHandler("onClientRender",root,onRender) -- add the onClientRender-Event to the function onRender
end -- end of function onPlayerFire
addEventHandler("onClientPlayerWeaponFire",root,OnPlayerFire)

function onRender() -- function to which onClientRender-Event will be attached.
 if Position then -- check if there are Positions available
  local startX,startY,startZ,endX,endY,endZ = unpack(Position)-- unpack the Position table
  dxDrawLine3D( startX,startY,startZ,endX,endY,endZ,tocolor(200,0,0,255),3) -- draws the 3D line between start-Position and end-Position
 end -- end of if
end -- end of onRender