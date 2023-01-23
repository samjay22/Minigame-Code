db = true
script.Parent.Touched:connect(function(obj)
	if game.Players:FindFirstChild(obj.Parent.Name) and db then
		db = false
		obj.Parent.Humanoid.WalkSpeed = 16
		wait()
		db = true
	end
end)
