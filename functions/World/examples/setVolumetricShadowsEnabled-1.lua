if not ( isVolumetricShadowsEnabled () ) then -- check if the volumetric shadows not enabled
    setVolumetricShadowsEnabled ( true )
    setWorldProperty ( "ShadowStrength", 500 ) -- set shadows alpha
else
    setWorldProperty ( "ShadowStrength", 500 )
end