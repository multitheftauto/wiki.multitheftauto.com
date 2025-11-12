-- Create a normal object
    local objNormal = createObject ( 3620, x,y,z,0,0,0 )

    -- Create a low LOD object
    local objLowLOD = createObject ( 5154, x,y,z,0,0,0,true )

    -- Assign the LOD object with the Normal object
    setLowLODElement ( objNormal, objLowLOD )
    -- Set the LOD object's parent to the Normal object so it is destroyed together
    setElementParent( objLowLOD, objNormal )

    -- Set the draw distance for the model we are using for low LOD to maximum
    engineSetModelLODDistance ( 5154, 300 )