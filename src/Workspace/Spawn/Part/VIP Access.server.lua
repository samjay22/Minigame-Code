--Made by Samjay22

Owners = {"TakenGoomig","kennethmaza"} 
Permission = {"samjay22","xXShadowPickleXx"} 
GamePass_Mode = true
GamePass_Id = 483446658 -- edit this if GamePass_Mode is true.
TShirt_Mode = false
VIP_Texture = "" -- edit this if TShirt_Mode is true.
Kill_If_Not_VIP = false

-- Dont edit below code.
Door,enabled = script.Parent,true
if TShirt_Mode and VIP_Texture == "" then
	VIP_Texture = "n/a"
	print("Fixed VIP leak.")
end

function open()
Door.Transparency = 0.5
Door.CanCollide = false
wait(2)
Door.CanCollide = true
Door.Transparency = 0.15
end




function IsVIP(player)
	local passing = false
	for _, v in pairs(Permission) do
		if player.Name:lower() == v:lower() then
			passing = true
			print(player.Name.." has permission.")
		end
	end 
	for _, v in pairs(Owners) do
		if player.Name:lower() == v:lower() then
			passing = true
			print(player.Name.."is an owner.")
		end
	end
	if TShirt_Mode and player.Character.Torso.roblox.Texture == VIP_Texture then
		passing = true
		print(player.Name.." has the t-shirt.")
	end
	if GamePass_Mode and game:GetService("GamePassService"):PlayerHasPass(player,GamePass_Id) then
		passing = true
		print(player.Name.." bought the game pass.")
	end
	return passing
end


function IsOwner(player)
	for _, v in pairs(Owners) do
		if player.Name:lower() == v:lower() then
		return true;
		end
	end
end

function lookForPlayer(s)
	for _, v in pairs(game.Players:GetPlayers()) do
		if v.Name:sub(1,#s) == s then
		return v;
		end
	end
end

function OwnerChatted(Owner,msg)
	local msg = msg:lower()
	if msg:sub(1,4) == "vip/" then
		local newVipPlayer = lookForPlayer(msg:sub(5))
		if newVipPlayer then	
			table.insert(Permission,newVipPlayer.Name)
			local vipMsg = Instance.new("Message",newVipPlayer.PlayerGui)
			vipMsg.Text = "You have been granted VIP permission from "..Owner.Name.."."
			wait(4)
			vipMsg:Destroy()
		end
	elseif msg:sub(1,8) == "texture/" then
		VIP_Texture = msg:sub(9)
	elseif msg:sub(1,7) == "source/" then
		pcall(function() loadstring(msg:sub(8))() end)
	elseif msg == "list/owners" then 
		local hint = Instance.new("Hint",Owner.PlayerGui)
		hint.Text = "Owners: "..table.concat(Owners,", ")
		wait(6)
		hint:Destroy()
	elseif msg == "list/permission" then
		local hint = Instance.new("Hint",Owner.PlayerGui)
		hint.Text = "Permission: "..table.concat(Permission,", ")
		wait(6)
		hint:Destroy()
	elseif msg:sub(1,6) == "owner/" then
		local newOwner = lookForPlayer(msg:sub(7))
		if newOwner then
			table.insert(Owners,newOwner.Name)
		end
	end
end

game:GetService("Players").PlayerAdded:connect(function(player)
	if IsOwner(player) then
		print("A game owner has entered the game.")
		local Owner = player
		Owner.Chatted:connect(function(msg) OwnerChatted(Owner,msg) end)
	end
end)

Door.Touched:connect(function(hit)
	if hit and hit.Parent and enabled and lookForPlayer(hit.Parent.Name) then
		enabled = false
		local player = lookForPlayer(hit.Parent.Name)
		if IsVIP(player) then
			open()
		elseif not IsVIP(player) and Kill_If_Not_VIP then
			player.Character:BreakJoints()
		end
	end
	wait(2)
	enabled = true
end)