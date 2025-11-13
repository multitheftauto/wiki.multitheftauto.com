function addGlassParticle(cmd,r,g,b,a,scale,count)
   if r and g and b then 
      local x,y,z = getElementPosition(localPlayer)
      fxAddGlass(x+3,y,z,r,g,b,255,1.0,5)
   end 
end
addCommandHandler("addGlass",addGlassParticle)