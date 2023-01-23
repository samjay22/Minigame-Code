local replicatedstorage = game:GetService("ReplicatedStorage")
local status = replicatedstorage:WaitForChild("StatusValue")
local plrcount = game.Players.NumPlayers

script.Parent.Text = status.Value

status.Changed:connect(function()
	script.Parent.Text = status.Value
end)

if plrcount == 1 then
	status.Value = "There needs to be 2 or more players in the game to begin"
else
	status.Value = "Game is beginning soon!"	
end
wait(plrcount >= 2)


