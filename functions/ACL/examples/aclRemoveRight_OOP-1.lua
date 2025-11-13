addEventHandler("onResourceStart",resourceRoot,function()
   ACLGroup.get("Admin"):removeRight("function.setServerPassword")
end)