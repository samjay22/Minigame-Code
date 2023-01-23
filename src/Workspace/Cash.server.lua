game.Players.PlayerAdded:connect(function(player)
local stat = Instance.new("IntValue")
stat.Name = "leaderstats"
stat.Parent = player
local cash = Instance.new("IntValue")
cash.Name = "Cash"
cash.Parent = stat
end)