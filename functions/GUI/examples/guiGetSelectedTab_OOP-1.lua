local tabPanel = GuiTabPanel(0, 0.1, 1, 1, true) -- create a tab panel which fills the whole window
local tab1 = GuiTab("Welcome", tabPanel) -- create a tab for the tab panel above
local tab2 = GuiTab("Info", tabPanel) -- create another tab for the tab panel at the top

function check()
    if (tabPanel.selectedTab == tab1) then -- Check what tab is currently shown
        tabPanel.selectedTab = tab2 -- if the "Welcome" tab is selected, change it to tab2("Info" tab)
    else
        tabPanel.selectedTab = tab1 -- if the "Info" tab is selected, change it to tab1("Welcome" tab)
    end
end
