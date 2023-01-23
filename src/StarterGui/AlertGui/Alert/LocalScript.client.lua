local replicatedstorage = game:GetService("ReplicatedStorage")
local alert = replicatedstorage:WaitForChild("AlertValue")

local gui = script.Parent

local end_pos = UDim2.new(1, -300, 0.5, -30)
local start_pos = UDim2.new(1, 0, 0.5, -30)

alert.Changed:connect(function()
	wait(0.5)
	gui.Text = alert.Value
	gui:TweenPosition(end_pos, 1, 7, 1)
	wait(1.5)
	gui:TweenPosition(start_pos, 0, 7, 1)
end)

--[[
alert.OnClientEvent:connect(function(text)
	wait(0.5)
	gui.Text = text
	gui:TweenPosition(end_pos, 1 ,7,1)
	wait(1.5)
	gui:TweenPosition(start_pos, 0 ,7,1)
end)
]]--