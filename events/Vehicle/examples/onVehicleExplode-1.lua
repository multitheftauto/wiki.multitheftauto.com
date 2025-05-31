local vagosVehicle = nil

-- This will get called when the vagos vehicle explodes
function onVagosVehicleExplode ()
	outputChatBox ( "VAGOS VEHICLE DESTROYED!" )
end

-- This is called when THIS resource starts
function onThisResourceStart ()

	-- Create the vagos vehicle. A van.
	vagosVehicle = createVehicle ( 522, 0, 0, 5 )

	-- Add its explode handler. When this car explodes, onVagosVehicleExplode is called
	addEventHandler ( "onVehicleExplode", vagosVehicle, onVagosVehicleExplode )
end

--Add the resource start event
addEventHandler ( "onResourceStart", resourceRoot, onThisResourceStart )