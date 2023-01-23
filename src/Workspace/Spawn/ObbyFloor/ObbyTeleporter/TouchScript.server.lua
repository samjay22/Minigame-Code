local Floor = script.Parent

local function OnPartTouched(OtherPart)
	local PartParent = OtherPart.Parent

	local Humanoid = PartParent:FindFirstChild("Humanoid")
	if Humanoid then
		local Player = Humanoid.Parent
		local HumanoidRoot = Player:WaitForChild("HumanoidRootPart")
		HumanoidRoot.Position = Vector3.new(104.5, 9.15, -2)
	endS
end

Floor.Touched:Connect(OnPartTouched)