-- Create composite object
    objMainBit = createObject ( 3620, x,y,z )
    objLeftBit = createObject ( 5158, x,y,z )
    objRightBit = createObject ( 5158, x,y,z )
    objDetailBit1 = createObject ( 1337, x,y,z )
    objDetailBit2 = createObject ( 1337, x,y,z )
    objInternalBit = createObject ( 1337, x,y,z )
    attachElements ( objLeftBit, objMainBit, -10, 0, 0 )
    attachElements ( objRightBit, objMainBit, 10, 0, 0 )
    attachElements ( objDetailBit1, objMainBit, 5, 0, 0 )
    attachElements ( objDetailBit2, objLeftBit, 5, 5, 0 )
    attachElements ( objInternalBit, objRightBit, 5, 7, 0 )

    -- Create low LOD object (which represents the whole composite model)
    objlowLOD = createObject ( 5154, x,y,z, 0, 0, 0, true )

    -- Attach low LOD object so it moves with the main model
    attachElements ( objlowLOD, objMainBit, 0, 0, 0 )

    -- Set the low LOD object's parent to the main object so it is destroyed together
    setElementParent( objLowLOD, objMainBit )

    -- Set associations so the low LOD model is displayed when the main parts are not full visible
    setLowLODElement ( objMainBit, objlowLOD )
    setLowLODElement ( objLeftBit, objlowLOD )
    setLowLODElement ( objRightBit, objlowLOD )

    -- Note that the detail and internal parts have not been associated to the low LOD object

    -- Set the draw distance for the model we are using for low LOD to maximum
    triggerClientEvent("onClientChangeModelLODDistance", resourceRoot, 5154, 300 )