local LODDistance = Engine.getModelLODDistance(1337)
local actualLODDistance = math.min(300, LODDistance * (dxGetStatus().SettingDrawDistance / 100 + 1))