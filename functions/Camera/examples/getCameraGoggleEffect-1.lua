function nightvision()
    if (getCameraGoggleEffect() == "normal") then
        setCameraGoggleEffect("nightvision")
    elseif (getCameraGoggleEffect() == "nightvision") then
        setCameraGoggleEffect("normal")
    end
end
addCommandHandler("nightvision", nightvision)