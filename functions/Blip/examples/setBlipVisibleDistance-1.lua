local blip = createBlip(0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1000)
outputDebugString("Blip visible distance: "..getBlipVisibleDistance(blip)) --1000
setBlipVisibleDistance(blip, 2000)
outputDebugString("Blip visible distance: "..getBlipVisibleDistance(blip)) --2000