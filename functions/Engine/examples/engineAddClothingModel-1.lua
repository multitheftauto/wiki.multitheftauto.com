local dff = engineLoadDFF("shirt_model_1.dff")
local txd = engineLoadTXD("shirt_model_1.txd")

engineAddClothingModel(dff, "shirt_model_1.dff")
engineAddClothingTXD(txd, "shirt_model_1.txd")

addClothingModel("shirt_model_1", "shirt_model_1", 0)