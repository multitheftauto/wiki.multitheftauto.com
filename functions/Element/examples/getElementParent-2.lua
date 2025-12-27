local function isFreeroamCar(vehicle)
    if (not vehicle) then
        return false
    end

    local parentResource = getElementParent(getElementParent(vehicle))
    return parentResource == getResourceRootElement(getResourceFromName("freeroam"))
end