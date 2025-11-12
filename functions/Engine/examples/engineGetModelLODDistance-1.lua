local LODDistance = engineGetModelLODDistance( 1337 )
local actualLODDistance = math.min( 300, LODDistance * ( dxGetStatus().SettingDrawDistance / 100 + 1 ) )