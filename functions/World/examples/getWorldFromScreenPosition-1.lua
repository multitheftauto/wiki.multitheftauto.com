function explosion ()
  local w, h = guiGetScreenSize ()
  local x, y, z = getWorldFromScreenPosition ( w/2, h/2, 10 )
  createExplosion ( x, y, z, 11 )
end
bindKey ( "i", "down", explosion )