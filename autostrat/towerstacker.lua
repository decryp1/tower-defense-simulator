if not LPH_OBFUSCATED then
    LPH_JIT_MAX       = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
end

_G.stackk = true;
_G.offset = math.random(2, 15);
_G.a = typeof(_G.a) == "thread" and _G.a or task.spawn(function() while task.wait(.1) do _G.offset = math.random(2, 15); end end);

if not _G.stackk or not _G.offset then print("use globals") return end;

local d = filtergc("function", {Constants = {"Quarantine"}})
for q, w in d do
    local i = debug.getinfo(w)
    if i.short_src:find("SharedGameFunctions") then
        local o = clonefunction(w)
        hookfunction(w, LPH_NO_VIRTUALIZE(function(a, b, c, d)
            if not _G.stackk then
                return o(a, b, c, d);
            end
            local val, result = o(a, b, c, d)
            if not val and result and typeof(result) ~= "RaycastResult" then
                return true, {Position = b};
            end
            return val, result;
        end))
        print("mewo")
    end
end

local old; old = hookmetamethod(game, "__namecall", newcclosure(LPH_NO_VIRTUALIZE(function(self, ...)
    if getnamecallmethod() == "InvokeServer" then
        local args = {...}
        if args[1] == "Troops" and args[2] == "Place" then
            local three = args[3]
            if three and three.Position and _G.stackk then
                three.Position = three.Position + Vector3.new(0, _G.offset, 0);
            end
        end
    end
    return old(self, ...);
end)))