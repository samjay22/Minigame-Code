wait(5)
--Services
local Workspace = game:GetService('Workspace')
local Players = game:GetService('Players')
local Lighting = game:GetService('Lighting')
local ReplicatedFirst = game:GetService('ReplicatedFirst')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerScriptStorage = game:GetService('ServerScriptService')
local ServerStorage = game:GetService('ServerStorage')
local StarterGui = game:GetService('StarterGui')
local StarterPack = game:GetService('StarterPack')
local StarterPlayer = game:GetService('StarterPlayer')
local players;
local x,y,z;

--Buttons
local MainScriptOn = script.Parent.MainScriptOn
local MainScriptOff = script.Parent.MainScriptOff
--Extra Things
local MainScriptStatus = ReplicatedStorage:WaitForChild("StatusValue")
local lobby = Vector3.new(-438.08, 6.06, -1.66)
local MainScript = game.ServerScriptService:WaitForChild("MainScript")
--Functions

local function Random(n1, n2)
	return math.random(n1, n2)
end

local function MovePlayers(pos)
	players = game.Players:GetPlayers()
	for i, plr in ipairs(players) do
		if plr:HasAppearanceLoaded() and plr.Character.Torso then
			x = pos.x + Random(-7, 7)
			y = pos.y + Random(4, 8)
			z = pos.Z + Random(-7, 7)
			plr.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(x,y,z))) --CFrame.new(Vector3.new(x,y,z))
			plr.Character.Humanoid.WalkSpeed = 16
		end
	end
end

MainScriptOn.MouseButton1Click:connect(function()
	MainScript.Disabled = true
	MainScriptOff.Visible = true
	MainScriptOn.Visible = false
	MainScriptStatus.Value = "Script Offline"
	wait(1)
	MainScriptStatus.Value = "Game Ended... Moving Players Back To Lobby"
	MovePlayers(lobby)
	MainScriptStatus.Value = 'Well, Looks Like '  ..Players.LocalPlayer.Name..  ' Turned Off The Script!'
end)

MainScriptOff.MouseButton1Click:connect(function()
	MainScript.Disabled = false
	MainScriptOff.Visible = false
	MainScriptOn.Visible = true
	MainScriptStatus.Value = "Script Online"
	wait(1)
	MainScriptStatus.Value = "Loading Script..."
end)