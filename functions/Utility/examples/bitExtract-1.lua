function getColorAlpha(color)
   return bitExtract(color,24,8) -- return bits 24-32 ( the alpha, http://en.wikipedia.org/wiki/RGBA_color_space ) 
end