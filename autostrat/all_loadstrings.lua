return {
  local function piecestring(traffic) return loadstring(game:HttpGet(traffic))(); end
  ["autostrat"]       =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/autostrat.lua",
  ["gatlingexploit"]  =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/gatlingexploit.lua",
  ["joinhandler"]     =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/joinhandler.lua",
  ["resources"]       =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/resources.lua",
  ["stratrecorder"]   =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/stratrecorder.lua",
  ["towerstacker"]    =  "https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/towerstacker.lua"
}
--[[
loadstrings = loadstring(game:HttpGet("https://raw.githubusercontent.com/decryp1/tower-defense-simulator/refs/heads/main/autostrat/all_loadstrings"))()
print(type(loadstrings.piecestring))
print(loadstrings.piecestring(loadstrings["resources"]))
]]
