-- This script can backup your resource with a easy command! /backupresource [resourcename]
function backupResource (player,command,resourcetobackup) -- start the function
  if (resourcetobackup) and (getResourceFromName(resourcetobackup)) then -- check if the resource is exist
    copyResource (getResourceFromName(resourcetobackup),resourcetobackup .. "_backup") -- copy the resource and give it the name [resource]_backup
    outputChatBox ("Resource " .. resourcetobackup .. " succesfully backed up!",player,255,0,0,false) -- say it's OK!
  else -- if it isn't exist
    outputChatBox ("Resource can't be backed up! (don't forget the parameters!)",player,255,0,0,false) -- say it isn't exist!
  end
end
addCommandHandler ("backupresource",backupResouce) -- add command