local RF = game:GetService("ReplicatedFirst")
RF:RemoveDefaultLoadingScreen()
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:SetTopbarTransparency(0)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
local background = PlayerGui:WaitForChild("LoadingGui").Background
local logo = PlayerGui.LoadingGui.Logo
local text = PlayerGui.LoadingGui.Text
local statusbar = PlayerGui.StatusGui.Status
local NowPlaying = PlayerGui.NowPlaying.Frame
local ShopGUI = PlayerGui.BuyGui

NowPlaying.Visible = false
background.Visible = true
statusbar.Visible = false
game.StarterGui.LoadingGui.LoadingMusic.Playing = true

for i = 0, 1, 0.1 do
 logo.ImageTransparency= 1-i
 text.TextTransparency= 1-i
 wait(0.1)
end

logo.ImageColor3 = Color3.fromRGB(0, 255, 0)
wait(1)
logo.ImageColor3 = Color3.fromRGB(0, 0, 255)
wait(1)
logo.ImageColor3 = Color3.fromRGB(255, 0, 0)
wait(1)
logo.ImageColor3 = Color3.fromRGB(255, 0, 128)
wait(1)
logo.ImageColor3 = Color3.fromRGB(170, 0, 255)

local blackbar = game.Players.LocalPlayer.PlayerGui.LoadingGui.BackBar
local Name = game.Players.LocalPlayer.PlayerGui.LoadingGui.GameName

for i = 0, 1, 0.1 do
 logo.ImageTransparency= 0+i
 text.TextTransparency= 0+i
 blackbar.ImageTransparency= 1-i
 Name.ImageTransparency= 1-i
 wait(0.1)
end

local ContentService = game:GetService("ContentProvider")
local Bar = game.Players.LocalPlayer.PlayerGui.LoadingGui.LoadingBar

local AmountOfAssestsLoaded = game.StarterGui.LoadingGui.AssestsLoaded
local AllAssets = game.ContentProvider.RequestQueueSize
AssestsLoaded = game.ContentProvider.RequestQueueSize
AmountOfAssestsLoaded.Value = game.ContentProvider.RequestQueueSize
while game.ContentProvider.RequestQueueSize > 0 do
	if game.ContentProvider.RequestQueueSize < AssestsLoaded then
		AmountOfAssestsLoaded.Value = game.ContentProvider.RequestQueueSize
		AmountOfAssestsLoaded.Changed:connect(function(assetsToLoad)
			local newx = 1 - AmountOfAssestsLoaded.Value / AllAssets
			Bar:TweenSize(UDim2.new(newx,0,1,0),"Out","Quad", 0.5, true)
		end)
	end	
	wait()
end
Bar:TweenSize(UDim2.new(0,350,0,50),"Out","Quad", 0.5, true)

for i = 0, 1, 0.1 do
 background.ImageTransparency= 0+i
 game.StarterGui.LoadingGui.LoadingMusic.Volume= 1-i
 Bar.ImageTransparency= 0+i
 blackbar.ImageTransparency= 0+i
 Name.ImageTransparency= 0+i
 wait(0.1)
end
statusbar.BackgroundTransparency = 0.5
statusbar.Visible = true
NowPlaying.Visible = true


game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)



