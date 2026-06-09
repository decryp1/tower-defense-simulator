logs = {}
towers = {}
conns = {}
otime = workspace:GetServerTimeNow()

conns.sell = workspace.Towers.ChildRemoved:Connect(function(child)
	local entry = towers[child]
	if not entry then return end
	local wave, timer = getwave()
    if towers[child].Owner.Value == userid() then
        table.insert(logs, {"sell", wave, timer, elapsed(otime), entry.name, tostring(entry.pos), entry.uuid})
    end
	--table.insert(logs, {"sell", wave, timer, elapsed(otime), entry.name, tostring(entry.pos), entry.uuid})
	towers[child] = nil
end)

local o; o = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	local args = {...}
	if getnamecallmethod() == "InvokeServer" and self == game:GetService("ReplicatedStorage").RemoteFunction then
		local wave, timer = getwave()
		if args[1] == "Troops" then
			if args[2] == "Place" then
				local pos = args[3] and args[3].Position
				local name = tostring(args[4])
				table.insert(logs, {"place", wave, timer, elapsed(otime), name, tostring(pos)})
				task.defer(function()
					if not workspace:FindFirstChild("Towers") or not pos then return end
					for i, v in ipairs(workspace.Towers:GetChildren()) do
						if v.Name == name and not towers[v] and (getpos(v) - pos).Magnitude < 1.5 then
							local id = uuid()
							towers[v] = {name=name, pos=getpos(v), uuid=id}
							v:SetAttribute("hh", id)
							break
						end
					end
				end)
			elseif args[2] == "Upgrade" then
				local troop, path = args[4] and args[4].Troop, args[4] and args[4].Path
				local entry = troop and towers[troop]
				table.insert(logs, {"upgrade", wave, timer, elapsed(otime), entry and entry.uuid or tostring(troop), path})
			end
		end -- no sell becuase theres no instance reference so yeah
	end
	return o(self, ...)
end))