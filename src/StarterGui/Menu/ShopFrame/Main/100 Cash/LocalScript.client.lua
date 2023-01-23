repeat wait() until game.Players.LocalPlayer

local buttons = {
	["B1"] = script.Parent.TextButton,
}

local player = game.Players.LocalPlayer
local to_open = player.PlayerGui.BuyGui:FindFirstChild(script.Parent.Name)


buttons['B1'].MouseButton1Click:connect(function()
	to_open.Visible = true
end)
