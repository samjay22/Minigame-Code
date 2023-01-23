repeat wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer
local coins  = player.leaderstats.Cash
local text   = script.Parent.Text

while wait(1) do
	script.Parent.Text = text .. coins.Value 
end
