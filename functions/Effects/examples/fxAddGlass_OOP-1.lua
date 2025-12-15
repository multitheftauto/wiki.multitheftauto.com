function addGlassParticle(cmd,r,g,b,a,scale,count)
   if r and g and b then 
      local x,y,z = localPlayer:getPosition()
      Effect.addGlass(x+3,y,z,r,g,b,255,1.0,5)
   end 
end
addCommandHandler("addGlass",addGlassParticle)