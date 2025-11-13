local myWindow = guiCreateWindow ( 0, 0, 0.5, 0.4, "Information", true )  -- create a window which has "Information" in the title bar.
local tabPanel = guiCreateTabPanel ( 0, 0.1, 1, 1, true, myWindow )       -- create a tab panel which fills the whole window
local tabMap = guiCreateTab( "Map Information", tabPanel )                -- create a tab named "Map Information" on 'tabPanel'
local tabHelp = guiCreateTab( "Help", tabPanel )                          -- create another tab named "Help" on 'tabPanel'

-- adds a label (text) to each tab
guiCreateLabel(0.02, 0.04, 0.94, 0.2, "This is information about the current map", true, tabMap)
guiCreateLabel(0.02, 0.04, 0.94, 0.92, "This is help text.", true, tabHelp)