local player=game.Players.LocalPlayer
local gamepassId=483446658

script.Parent.MouseButton1Click:connect(function()
	game:GetService("MarketplaceService"):PromptPurchase(player, gamepassId)
end)