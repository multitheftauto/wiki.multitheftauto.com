local myWebsite = "development.mtasa.com" -- define the text to be displayed in advert field
function createAdvert( )
    local advert = guiCreateEdit( 0.845, 0.94, 0.15, 0.05, myWebsite, true ) -- create edit box for the advert
    if advert then -- if it was successfully created
        guiEditSetReadOnly( advert, true ) -- make it read-only
    end
    addCommandHandler( "isReadOnly",
        function( )
            local readOnly = guiEditIsReadOnly( advert ) -- check edit box status
            outputChatBox( "Edit box is " .. ( readOnly and "read-only" or "not read-only" ) ) -- show info about edit box
        end
    )
end
addEventHandler( "onClientResourceStart", resourceRoot, createAdvert )