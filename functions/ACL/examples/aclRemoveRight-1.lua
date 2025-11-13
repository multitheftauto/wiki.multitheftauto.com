addEventHandler("onResourceStart",resourceRoot,function()
   aclRemoveRight(aclGet("Admin"),"function.setServerPassword")
end)