local Player = game.Players.LocalPlayer

local frame = script.Parent.Parent.ShopFrame

local end_size = UDim2.new(0, 65,0, 25)
local start_size = UDim2.new(0, 50,0, 25)


script.Parent.MouseEnter:connect(function()
	script.Parent:TweenSize(end_size, 1 ,2,0.1)
end)

script.Parent.MouseLeave:connect(function()
	script.Parent:TweenSize(start_size, 1 ,2,0.1)
end)

script.Parent.MouseButton1Click:connect(function()
	if frame.Visible then
		frame.Visible = false
		script.Parent:TweenSize(start_size, 1 ,2,0.1)
	else
		frame.Visible = true
	end
end)


frame.X.MouseButton1Click:connect(function()
	frame.Visible = false
	script.Parent:TweenSize(start_size, 1 ,2,0.1)
end)