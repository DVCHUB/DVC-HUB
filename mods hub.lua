local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "DVC_UI"
gui.ResetOnSpawn = false
gui.Parent = Player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,700,0,420)
Main.Position = UDim2.new(0.5,-350,0.5,-210)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.Parent = gui

Instance.new("UICorner",Main).CornerRadius = UDim.new(0,12)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0,170,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(35,35,35)
Sidebar.Parent = Main

Instance.new("UICorner",Sidebar).CornerRadius = UDim.new(0,12)

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,8)
Layout.Parent = Sidebar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,55)
Title.BackgroundTransparency = 1
Title.Text = "DVC UI V2"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 24
Title.Parent = Sidebar

local Pages = Instance.new("Frame")
Pages.Size = UDim2.new(1,-180,1,-20)
Pages.Position = UDim2.new(0,180,0,10)
Pages.BackgroundTransparency = 1
Pages.Parent = Main

local function CreatePage(name)

	local page = Instance.new("Frame")
	page.Name = name
	page.Size = UDim2.new(1,0,1,0)
	page.Visible = false
	page.BackgroundTransparency = 1
	page.Parent = Pages

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,0,0,40)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1,1,1)
	label.TextSize = 28
	label.Text = name
	label.Parent = page

	return page

end

local Home = CreatePage("Home")
local Inventory = CreatePage("Inventory")
local Shop = CreatePage("Shop")
local Settings = CreatePage("Settings")

Home.Visible = true

local function ShowPage(Page)

	for _,v in pairs(Pages:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
		end
	end

	Page.Visible = true

	Page.Position = UDim2.new(0.05,0,0,0)
	Page.BackgroundTransparency = 1

	TweenService:Create(Page,TweenInfo.new(.25),{
		Position = UDim2.new(0,0,0,0)
	}):Play()

end

local function CreateTab(Name,Page)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,-10,0,42)
	Button.BackgroundColor3 = Color3.fromRGB(45,45,45)
	Button.Text = Name
	Button.Font = Enum.Font.GothamSemibold
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 18
	Button.Parent = Sidebar

	Instance.new("UICorner",Button).CornerRadius = UDim.new(0,8)

	Button.MouseButton1Click:Connect(function()

		ShowPage(Page)

	end)

end

CreateTab("🏠 Home",Home)
CreateTab("🎒 Inventory",Inventory)
CreateTab("🛒 Shop",Shop)
CreateTab("⚙ Settings",Settings)