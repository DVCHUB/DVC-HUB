local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "⚡ DVC HUB - PREMIUM VERSION ⚡", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "DVCHubConfig",
    IntroText = "Loading DVC HUB..."
})

-- Biến cấu hình hệ thống
_G.AutoFarm = false
_G.AutoFarmBoss = false
_G.AutoChest = false
_G.BringMob = false
_G.FastAttack = false
_G.EspPlayers = false

---------------------------------------------------------------------------
-- TAB 1: MAIN FARM (Cày Cấp & Gom Quái)
---------------------------------------------------------------------------
local FarmTab = Window:MakeTab({Name = "Cày Cấp Main", Icon = "rbxassetid://4483345998"})

FarmTab:AddToggle({
    Name = "Auto Farm Level (Tự động cày)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        spawn(function()
            while _G.AutoFarm do
                task.wait(0.1)
                pcall(function()
                    -- Đi tìm quái gần nhất
                    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            -- Gom quái lại một chỗ nếu bật Bring Mob
                            if _G.BringMob then
                                v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                                v.HumanoidRootPart.CanCollide = false
                            end
                            -- Dịch chuyển tới quái và đánh
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 529))
                        end
                    end
                end)
            end
        end)
    end    
})

FarmTab:AddToggle({
    Name = "Gom Quái (Bring Mobs)",
    Default = false,
    Callback = function(Value)
        _G.BringMob = Value
    end
})

FarmTab:AddToggle({
    Name = "Đánh Siêu Nhanh (Fast Attack)",
    Default = false,
    Callback = function(Value)
        _G.FastAttack = Value
        spawn(function()
            while _G.FastAttack do
                task.wait()
                pcall(function()
                    -- Đoạn này để kích hoạt animation đánh nhanh liên tục (giảm cooldown)
                    local Combat = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if Combat then Combat:Activate() end
                end)
            end
        end)
    end
})

---------------------------------------------------------------------------
-- TAB 2: BOSS & CHEST (Săn Boss & Nhặt Rương)
---------------------------------------------------------------------------
local BossTab = Window:MakeTab({Name = "Săn Boss & Rương", Icon = "rbxassetid://4483345998"})

BossTab:AddToggle({
    Name = "Auto Săn Tất Cả Boss (Tự tìm Boss)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmBoss = Value
        spawn(function()
            while _G.AutoFarmBoss do
                task.wait(0.5)
                pcall(function()
                    -- Quét các thực thể là Boss trong Workspace
                    for _, b in pairs(game.Workspace.Enemies:GetChildren()) do
                        if b:FindFirstChild("Humanoid") and b.Humanoid.Health > 0 and b:AttributeUpdate("IsBoss") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 529))
                        end
                    end
                end)
            end
        end)
    end
})

BossTab:AddToggle({
    Name = "Auto Nhặt Rương Toàn Bản Đồ (Gom Beli)",
    Default = false,
    Callback = function(Value)
        _G.AutoChest = Value
        spawn(function()
            while _G.AutoChest do
                task.wait()
                pcall(function()
                    -- Tìm rương (Chest) để bay tới ăn tiền
                    for _, c in pairs(game.Workspace:GetChildren()) do
                        if string.find(c.Name, "Chest") and c:FindFirstChild("TouchInterest") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, c, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, c, 1)
                        end
                    end
                end)
            end
        end)
    end
})

---------------------------------------------------------------------------
-- TAB 3: TELEPORT (Dịch Chuyển VIP)
---------------------------------------------------------------------------
local TeleportTab = Window:MakeTab({Name = "Dịch Chuyển VIP", Icon = "rbxassetid://4483345998"})

TeleportTab:AddDropdown({
    Name = "Dịch chuyển sang Đảo khác",
    Default = "Chọn Đảo",
    Options = {"Đảo Tân Thủ", "Đảo Khỉ", "Đảo Sa Mạc", "Đảo Tuyết", "Đảo Trời", "Đảo Lửa Băng"},
    Callback = function(Value)
        local lp = game.Players.LocalPlayer
        -- Thay các tọa độ Vector3.new bên dưới bằng tọa độ game thật của em
        if Value == "Đảo Tân Thủ" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        elseif Value == "Đảo Khỉ" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(-1500, 50, 200)
        elseif Value == "Đảo Sa Mạc" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(3000, 50, -2500)
        elseif Value == "Đảo Tuyết" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(-2500, 50, -3000)
        elseif Value == "Đảo Trời" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(5000, 1000, -5000)
        elseif Value == "Đảo Lửa Băng" then lp.Character.HumanoidRootPart.CFrame = CFrame.new(8000, 50, 8000)
        end
    end
})

---------------------------------------------------------------------------
-- TAB 4: SHOP & ITEMS (Mua Đồ Từ Xa)
---------------------------------------------------------------------------
local ShopTab = Window:MakeTab({Name = "Cửa Hàng", Icon = "rbxassetid://4483345998"})

ShopTab:AddButton({
    Name = "Mua Kiếm Katana (Từ Xa)",
    Callback = function()
        -- Ví dụ gọi hàm Remote để mua đồ của Game mà không cần chạy tới NPC
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end
})

ShopTab:AddButton({
    Name = "Random Trái Ác Quỷ (Nếu đủ Beli)",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "BuyFruit")
    end
})

---------------------------------------------------------------------------
-- TAB 5: VISUAL & ESP (Nhìn Xuyên Tường)
---------------------------------------------------------------------------
local VisualTab = Window:MakeTab({Name = "Xuyên Tường (ESP)", Icon = "rbxassetid://4483345998"})

VisualTab:AddToggle({
    Name = "Hiện Vị Trí Người Chơi (Player ESP)",
    Default = false,
    Callback = function(Value)
        _G.EspPlayers = Value
        while _G.EspPlayers do
            task.wait(1)
            pcall(function()
                for _, p in pairs(game.Players:GetChildren()) do
                    if p ~= game.Players.LocalPlayer and p.Character and not p.Character.HumanoidRootPart:FindFirstChild("DVC_ESP") then
                        -- Tạo khung Highlight đỏ quanh người chơi khác
                        local Box = Instance.new("Highlight")
                        Box.Name = "DVC_ESP"
                        Box.FillColor = Color3.fromRGB(255, 0, 0)
                        Box.OutlineColor = Color3.fromRGB(255, 255, 255)
                        Box.Parent = p.Character
                    end
                end
            end)
        end
        -- Xóa ESP khi tắt
        if not Value then
            for _, p in pairs(game.Players:GetChildren()) do
                if p.Character and p.Character:FindFirstChild("DVC_ESP") then
                    p.Character.DVC_ESP:Destroy()
                end
            end
        end
    end
})

---------------------------------------------------------------------------
-- TAB 6: SETTINGS (Cài Đặt Hệ Thống)
---------------------------------------------------------------------------
local SettingsTab = Window:MakeTab({Name = "Cài Đặt", Icon = "rbxassetid://4483345998"})

SettingsTab:AddButton({
    Name = "Tắt Menu Tạm Thời (Gọn Màn Hình)",
    Callback = function()
        OrionLib:Destroy()
    end
})

-- Khởi chạy toàn bộ hệ thống Menu DVC HUB
OrionLib:Init()