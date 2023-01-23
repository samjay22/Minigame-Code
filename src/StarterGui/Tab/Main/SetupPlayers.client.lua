repeat wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer
local players = game:GetService('Players')

local temp = script.Parent.Template
local cash = temp.Cash
local rank = temp.Rank
local name = temp.Name


while wait(5) do
	for _, plr in ipairs(players:GetPlayers()) do
		
	end
end
