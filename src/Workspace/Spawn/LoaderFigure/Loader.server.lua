--// Wonuf

local Model = script.Parent
local Config = Model.Configuration
local Username = Config.Username.Value

local function resetModel()
	for i,v in pairs(Model:GetChildren()) do
		if v:IsA('CharacterMesh') or v:IsA('Shirt') or v:IsA('Pants') or v:IsA('Hat') or v:IsA('ShirtGraphic') then
			v:Destroy()
		end
	end
	if Model.Head:findFirstChild('Mesh') then
		Model.Head.Mesh:Destroy()
	end
end

local function updateModel()
	local AppModel = game.Players:GetCharacterAppearanceAsync(game.Players:GetUserIdFromNameAsync(Username))
	Model.Name = Username
	for i,v in pairs(AppModel:GetChildren()) do
		if v:IsA('SpecialMesh') or v:IsA('BlockMesh') or v:IsA('CylinderMesh') then
			v.Parent = Model.Head
		elseif v:IsA('Decal') then
			Model.Head.face.Texture = v.Texture
		elseif v:IsA('BodyColors') or v:IsA('CharacterMesh') or v:IsA('Shirt') or v:IsA('Pants') or v:IsA('ShirtGraphic') or v:IsA('Folder') then
			if Model:findFirstChild('Body Colors') then
				Model['Body Colors']:Destroy()
			end
			v.Parent = Model
		elseif v:IsA('Hat') or v:IsA('Accessory') then
			v.Parent = Model
			v.Handle.CFrame = Model.Head.CFrame * CFrame.new(0, Model.Head.Size.Y / 2, 0) * v.AttachmentPoint:inverse()
		end
	end
	if not Model.Head:FindFirstChild('Mesh') then
		local m = Instance.new('SpecialMesh', Model.Head)
		m.MeshType = Enum.MeshType.Head
		m.Scale = Vector3.new(1.25, 1.25, 1.25)
	end
end
updateModel()
if Config.AutoUpdate.Value then
	while wait(Config.AutoUpdate.Delay.Value) do
		resetModel()
		updateModel()
	end
end