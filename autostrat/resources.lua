
a = {
    local function elapsed(comp)
        return workspace:GetServerTimeNow() - comp
    end

    local function uuid()
        return game:GetService("HttpService"):GenerateGUID(false)
    end

    local function getwave()
        local display = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ReactGameTopGameDisplay")
        if not display then return nil, nil end
        local str = display.Frame.waveTimer.container.value.Text
        local m, s = str:match("^(%d+):(%d+)$")
        return tonumber(display.Frame.wave.container.value.Text), m and (tonumber(m) * 60 + tonumber(s)) or nil
    end

    local function getpos(model)
        if model.PrimaryPart then return model.PrimaryPart.Position end
        local ok, pos = pcall(function() return model:GetPivot().Position end)
        return ok and pos or Vector3.zero
    end

    local function userid()
        return game:GetService("Players").LocalPlayer.UserId
    end

    local function export(filename: string, filetype: string, safefile: boolean, filedata)
        if safefile and isfile(filename) then
            for i = 1, math.huge do
                if not isfile(filename .. " (" .. i .. ")") then
                    filename = filename .. " (" .. i .. ")"
                    break
                end
            end
        end
        writefile(filename .. "." .. filetype, filedata)
    end
    -- export("herklestrat", "lua", true, logs)
}
return a
--[[aaa
local Event = game:GetService("ReplicatedStorage").RemoteFunction
Event:InvokeServer(
    "Troops",
    "Place",
    {
        Rotation = CFrame.new(0, 0, 0, 1, -0, 0, 0, 1, -0, 0, 0, 1),
        Position = Vector3.new(10.845485687256, 0.97467517852783, 28.336650848389)
    },
    "Scout"
)

local Event = game:GetService("ReplicatedStorage").RemoteFunction
Event:InvokeServer(
    "Troops",
    "Upgrade",
    "Set",
    {
        Troop = workspace.Towers.Penguin,
        Path = 1
    }
)

local Event = game:GetService("ReplicatedStorage").RemoteFunction
Event:InvokeServer(
    "LobbyVoting",
    "Override",
    "Summer Castle"
)

local Event = game:GetService("ReplicatedStorage").RemoteEvent
Event:FireServer(
    "LobbyVoting",
    "Vote",
    "Summer Castle",
    Vector3.new(18.315761566162, 9.5739603042603, 57.878879547119)
)

local Event = game:GetService("ReplicatedStorage").RemoteEvent
Event:FireServer(
    "LobbyVoting",
    "Ready"
)

local Event = game:GetService("ReplicatedStorage").RemoteFunction
Event:InvokeServer(
    "Voting",
    "Skip"
)

]]