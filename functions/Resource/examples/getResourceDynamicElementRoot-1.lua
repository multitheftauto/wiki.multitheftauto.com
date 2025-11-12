-- We have some map files with many objects in our meta.xml.
-- And we have some objects, created by some resource scripts.

--      createObject(...) -- 1
--      createObject(...) -- 2
--      ...
--      createObject(...) -- 20

-- After resource start we must found all objects, created only
-- by current resource scripts (not maps) and make them invisible.

-- `resourceRoot` is predefined script variable containing current resource root pointer
addEventHandler( 'onResourceStart', resourceRoot,
    function()
        -- `resource` is predefined script variable containing current resource pointer
        local thisResourceDynamicRoot = getResourceDynamicElementRoot(resource)
        local onlyScriptObjects = getElementsByType( 'object', thisResourceDynamicRoot )
        
        for scriptObject in ipairs(onlyScriptObjects) do
            setElementAlpha( scriptObject, 0 )
        end
    end
)