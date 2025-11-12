addCommandHandler( "clipboard", -- add a command handler for the command
   function( command, ... )
      local text = table.concat({...}, " ") -- if the text has spaces this will turn it into a string
      local success = setClipboard( text ) -- set the clipboard and find out if it worked
      if success then
         outputChatBox( "Clipboard text set to: " .. text, 0, 255, 0 ) -- if it did, tell the player
      else
         outputChatBox( "Failed to set the clipboards text", 255, 0, 0 ) -- if it didn't, tell the player
      end
   end
)