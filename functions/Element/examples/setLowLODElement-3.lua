addEvent("onClientChangeModelLODDistance",true)
addEventHandler("onClientChangeModelLODDistance", resourceRoot,
    function(model,distance)
        engineSetModelLODDistance ( model, distance )
    end
)