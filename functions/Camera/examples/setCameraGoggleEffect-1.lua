function nightvision()
   local effect = (getCameraGoggleEffect() == "normal") and "nightvision" or "normal"
   setCameraGoggleEffect(effect)
end
addCommandHandler("nightvision", nightvision)