function handleRestore( didClearRenderTargets )
    if didClearRenderTargets then
        -- Do any work here to restore render target contents as required
    end
end
addEventHandler("onClientRestore",root,handleRestore)