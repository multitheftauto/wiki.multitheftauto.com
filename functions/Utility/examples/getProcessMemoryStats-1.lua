setTimer(function()
    local div = 1024^2

    local pmem = getProcessMemoryStats()

    if pmem then
        outputServerLog(("[SYS] %.2f MiB  rss:%.2f MiB  shr:%.2f MiB  prv:%.2f MiB"):format(
            pmem.virtual / div,
            pmem.resident / div,
            pmem.shared / div,
            pmem.private / div
        ))
    end
end, 5 * 60000, 0)