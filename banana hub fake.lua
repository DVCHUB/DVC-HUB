local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🍌 BANANA HUB MY OWN 🍌",
   LoadingTitle = "Đang tải Banana Hub...",
   LoadingSubtitle = "by Anh Đẹp Trai Uy Tín",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BananaHubConfig",
      FileName = "BigHub"
   },
   KeySystem = false -- Đặt thành true nếu em muốn làm thêm hệ thống lấy Key
})

-- TAB CHÍNH: TỰ ĐỘNG CÀY (AUTO FARM)
local FarmTab = Window:CreateTab("Auto Farm", 4483362458) -- Icon ID

local ToggleFarm = FarmTab:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
          print("Đã Bật Auto Farm")
          -- Đoạn này em sẽ viết code vòng lặp nhận Quest và đánh quái vào đây
          spawn(function()
              while _G.AutoFarm do
                  task.wait(1)
                  -- Ví dụ logic: game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ...
              end
          end)
      else
          print("Đã Tắt Auto Farm")
      end
   end,
})

-- TAB TIỆN ÍCH: TRÁI ÁC QUỶ (FRUIT)
local FruitTab = Window:CreateTab("Trái Ác Quỷ", 4483362458)

local ButtonBringFruit = FruitTab:CreateButton({
   Name = "Gom Trái Ác Quỷ (Bring Fruits)",
   Callback = function()
       print("Đang gom tất cả trái ác quỷ trên map...")
       -- Logic tìm và dịch chuyển trái ác quỷ đến người chơi
       for _, v in pairs(game.Workspace:GetChildren()) do
           if v:IsA("Tool") and string.find(v.Name, "Fruit") then
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
           end
       end
   end,
})

-- TAB THÔNG TIN (MISC)
local MiscTab = Window:CreateTab("Thông Tin", 4483362458)

MiscTab:CreateParagraph({Title = "Tác giả:", Content = "Hub này được tạo bởi Bạn và sự hỗ trợ từ AI Uy Tín!"})

Rayfield:Notify({
   Title = "Thành Công!",
   Content = "Banana Hub của riêng bạn đã sẵn sàng!",
   Duration = 5,
   Image = 4483362458,
})