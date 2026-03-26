local tabPanel = GuiTabPanel(0, 0.1, 1, 1, true) -- create a tab panel which fills the whole window
local tab1 = GuiTab("Welcome", tabPanel) -- create a tab for the tab panel above
local tab2 = GuiTab("Info", tabPanel) -- create another tab for the tab panel at the top
tabPanel.selectedTab = tab2 -- Select "Info" tab