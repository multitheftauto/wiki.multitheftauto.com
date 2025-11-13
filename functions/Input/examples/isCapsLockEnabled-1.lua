function checkCaps()
    iprint(isCapsLockEnabled(), getTickCount())
end
addCommandHandler("caps", checkCaps)