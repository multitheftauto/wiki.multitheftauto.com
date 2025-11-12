local newMarker = createMarker ( 0, 0, 2, "checkpoint", 2, 255, 0, 0, 255 )  -- Create a red checkpoint marker
setMarkerTarget(newMarker, 0, 10, 5) -- set target arrow direction

setMarkerTargetArrowProperties(newMarker, 0, 255, 255, 255) -- Set target arrow color to light blue (aqua)