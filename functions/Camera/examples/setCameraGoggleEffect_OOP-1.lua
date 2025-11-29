function nightvision()
   local effect = (Camera.goggleEffect == "normal") and "nightvision" or "normal"
   Camera.goggleEffect = effect
end
addCommandHandler("nightvision", nightvision)