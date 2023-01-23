repeat wait() until game.Players.LocalPlayer
local MPS = game:GetService("MarketplaceService")
local buttons = {
	["B1"] = script.Parent.Buy,
	["B2"] = script.Parent.Close
}
local player = game.Players.LocalPlayer

local GamePassID = script.Parent.Id.Value -- Set this to the ID of the gamepass
local MoneyToGive = 100
local debounce;
local hit;
buttons['B1'].MouseButton1Click:connect(function()
	MPS:PromptProductPurchase(player, GamePassID)
end)

buttons['B2'].MouseButton1Click:connect(function()
	script.Parent.Visible = false
end)



