function onClientResourceStartReplaceModels()
	local modelsToReplace = {
		{ -- replace object
			colFile = "object.col",
			txdFile = "object.txd",
			dffFile = "object.dff",
			modelID = 1337,
			alphaTransparency = false,
			filteringEnabled = true,
		},
		{ -- replace vehicle
			colFile = false, -- if file is not present set to false/nil
			txdFile = "vehicle.txd",
			dffFile = "vehicle.dff",
			modelID = 434,
			alphaTransparency = false,
			filteringEnabled = true,
		},
		{ -- replace skin
			colFile = false, -- if file is not present set to false/nil
			txdFile = "ped.txd",
			dffFile = "ped.dff",
			modelID = 16,
			alphaTransparency = false,
			filteringEnabled = true,
		},
		{ -- replace weapon 
			colFile = false, -- if file is not present set to false/nil
			txdFile = "m4.txd",
			dffFile = "m4.dff",
			modelID = 356,
			alphaTransparency = false,
			filteringEnabled = true,
		},
	}

	for assetID = 1, #modelsToReplace do
		local modelData = modelsToReplace[assetID]
		local modelCol = modelData.colFile
		local modelTxd = modelData.txdFile
		local modelDff = modelData.dffFile
		local modelID = modelData.modelID

		if (modelCol) then
			local colData = engineLoadCOL(modelCol)

			if (colData) then
				engineReplaceCOL(colData, modelID)
			end
		end

		if (modelTxd) then
			local filteringEnabled = modelData.filteringEnabled
			local txdData = engineLoadTXD(modelTxd, filteringEnabled)

			if (txdData) then
				engineImportTXD(txdData, modelID)
			end
		end

		if (modelDff) then
			local dffData = engineLoadDFF(modelDff)

			if (dffData) then
				local alphaTransparency = modelData.alphaTransparency
				
				engineReplaceModel(dffData, modelID, alphaTransparency)
			end
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStartReplaceModels)