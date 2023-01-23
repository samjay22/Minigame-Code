repeat wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer
local core  = require(game:GetService("ServerScriptService"):WaitForChild("MainModule"))
local gui = script.Parent.Main
local guide = script.Parent.MobilePlayerMenu

local db = false

gui.Visible   = false
guide.Visible = false

core.ContextAction:BindAction(
	'TabMenu',
	function(n, i, o)
		if db then return end
		db = true
		print('Got tab')
		if gui.Visible == true then
			gui.Visible = false
		else
			gui.Visible = true
		end
		wait()
		db = false
	end,
	true,
	Enum.KeyCode.T
)

core.ContextAction:SetPosition(
	'TabMenu',
	guide.Position
)