function drawline()
   local x, y, z = getPedTargetStart(localPlayer) -- Gets the Point to start From.
   if (x) then -- Checks if there is a Point to start From.
      local sx, sy, sz = getPedTargetCollision(localPlayer) -- Gets the Point where the Targets Collision is.
      dxDrawLine3D(x, y, z, sx, sy, sz) -- Draws the Line
   end
end
addEventHandler("onClientPreRender", root, drawline) -- Adds the Handler.