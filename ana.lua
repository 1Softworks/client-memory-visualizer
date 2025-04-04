local function safecall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("Error:", result)
        return nil
    end
    return result
end

local function getreadablesize(bytes)
    local units = {'B', 'KB', 'MB', 'GB'}
    local size = bytes
    local unit = 1
    while size > 1024 and unit < #units do
        size = size / 1024
        unit = unit + 1
    end
    return string.format("%.2f %s", size, units[unit])
end

local function analyzememory()
    print("\n=== X7K9M4 ===")
    
    local memorystats = safecall(function()
        return gcinfo() or collectgarbage("count")
    end) or 0
    
    print("Memory Usage:", getreadablesize(memorystats * 1024))
    
    local globalcount = 0
    print("\nH2J9P5:")
    for k, v in pairs(getfenv(0) or {}) do
        globalcount = globalcount + 1
        print(string.format("- %s: %s", tostring(k), type(v)))
    end
    print("Total Globals:", globalcount)
    
    local functioncount = 0
    local functioninfo = {}
    
    print("\nL4R8T3:")
    for _, v in pairs(getfenv(0) or {}) do
        if type(v) == "function" then
            functioncount = functioncount + 1
            
            local info = safecall(debug.getinfo, v) or {}
            local source = info.source or "unknown"
            local line = info.linedefined or 0
            
            functioninfo[source] = functioninfo[source] or {}
            functioninfo[source][line] = (functioninfo[source][line] or 0) + 1
        end
    end
    
    print("Total Functions:", functioncount)
    for source, lines in pairs(functioninfo) do
        for line, count in pairs(lines) do
            print(string.format("- %s:%d (%d instances)", source, line, count))
        end
    end
    
    local tablecount = 0
    print("\nW6Y2N8:")
    for _, v in pairs(getfenv(0) or {}) do
        if type(v) == "table" then
            tablecount = tablecount + 1
            local size = 0
            for _ in pairs(v) do
                size = size + 1
            end
            print(string.format("- Table size: %d elements", size))
        end
    end
    print("Total Tables:", tablecount)
    
    local threadcount = 0
    print("\nQ5F7B1:")
    for _, v in pairs(getfenv(0) or {}) do
        if type(v) == "thread" then
            threadcount = threadcount + 1
            local status = safecall(coroutine.status, v) or "unknown"
            print(string.format("- Thread status: %s", status))
        end
    end
    print("Total Threads:", threadcount)
    
    local membefore = safecall(gcinfo) or 0
    safecall(collectgarbage, "collect")
    local memafter = safecall(gcinfo) or 0
    
    print("\nC3V8M2:")
    print(string.format("- Before: %s", getreadablesize(membefore * 1024)))
    print(string.format("- After: %s", getreadablesize(memafter * 1024)))
    print(string.format("- Cleaned: %s", getreadablesize((membefore - memafter) * 1024)))
    
    print("\n=== Z9D4K7 ===\n")
end

local function safespawn(func)
    local thread = coroutine.create(func)
    local success, error = coroutine.resume(thread)
    if not success then
        warn("Thread error:", error)
    end
end

safespawn(function()
    while true do
        analyzememory()
        wait(10)
    end
end)

print("Memory Analyzer Started - Updating every 10 seconds")
