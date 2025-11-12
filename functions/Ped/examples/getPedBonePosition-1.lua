addEventHandler( "onClientRender",root,
   function( )
      local px, py, pz, tx, ty, tz, dist
      px, py, pz = getCameraMatrix( )
       for _, v in ipairs( getElementsByType ( 'player' ) ) do
         tx, ty, tz = getElementPosition( v )
         dist = math.sqrt( ( px - tx ) ^ 2 + ( py - ty ) ^ 2 + ( pz - tz ) ^ 2 )
         if dist < 30.0 then
            if isLineOfSightClear( px, py, pz, tx, ty, tz, true, false, false, true, false, false, false,localPlayer ) then
               local sx, sy, sz = getPedBonePosition( v, 5 )
               local x,y = getScreenFromWorldPosition( sx, sy, sz + 0.3 )
               if x then -- getScreenFromWorldPosition returns false if the point isn't on screen
                dxDrawText( getPlayerName( v ), x, y, x, y, tocolor(150, 50, 0), 0.85 + ( 15 - dist ) * 0.02, "bankgothic" )
               end
            end
         end
      end
   end
)