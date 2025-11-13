function replaceColorAlpha(color, alpha)
   return bitReplace(color,alpha,24,8) -- return value with replaced bits 24-32 ( the alpha, http://en.wikipedia.org/wiki/RGBA_color_space ) 
end