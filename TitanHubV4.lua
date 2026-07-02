-- ==================================================================================
-- TITAN HUB V4 - THE GOD MODE INTERFACE SIMULATOR (OVER 4000 CHARACTERS)
-- ==================================================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- KHỞI TẠO SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TitanHubV4"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- HÀM TIỆN ÍCH TIẾT KIỆM THỜI GIAN
local function ApplyCorner(instance, radius)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radius or 8)
    Corner.Parent = instance
end

local function ApplyStroke(instance, color, thickness)
    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = instance
    Stroke.Color = color or Color3.fromRGB(0, 255, 180)
    Stroke.Thickness = thickness or 1
end

-- 1. NÚT MỞ MENU MINI (GLOWING TOGGLE)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ScreenGui
OpenBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
OpenBtn.Size = UDim2.new(0, 70, 0, 45)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
OpenBtn.Text = "👑 TITAN V4"
OpenBtn.TextColor3 = Color3.fromRGB(0, 255, 180)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.TextSize = 14
ApplyCorner(OpenBtn, 8)
ApplyStroke(OpenBtn)

-- 2. KHUNG MENU CHÍNH CYBERPUNK (MAIN FRAME)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 560, 0, 400)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 12, 16)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
ApplyCorner(MainFrame, 14)
ApplyStroke(MainFrame, Color3.fromRGB(0, 255, 180), 1.5)

-- THANH TIÊU ĐỀ (TOP BAR)
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 20, 28)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0.04, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🪐 TITAN HUB V4 [FULL GAMEPLAY REPLICA]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Position = UDim2.new(0.92, 0, 0.22, 0)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.BackgroundColor3 = Color3.fromRGB(240, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
ApplyCorner(CloseBtn, 6)

-- THANH THÔNG BÁO DƯỚI CÙNG (FOOTER STATUS)
local Footer = Instance.new("Frame")
Footer.Parent = MainFrame
Footer.Position = UDim2.new(0, 0, 1, -25)
Footer.Size = UDim2.new(1, 0, 0, 25)
Footer.BackgroundColor3 = Color3.fromRGB(18, 20, 28)

local StatusText = Instance.new("TextLabel")
StatusText.Parent = Footer
StatusText.Size = UDim2.new(0.95, 0, 1, 0)
StatusText.Position = UDim2.new(0.04, 0, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Hệ thống: Ổn định. Nhấn phím [RightControl] để ẩn nhanh menu."
StatusText.TextColor3 = Color3.fromRGB(140, 140, 150)
StatusText.Font = Enum.Font.SourceSansItalic
StatusText.TextSize = 13
StatusText.TextXAlignment = Enum.TextXAlignment.Left

local function ShowLog(msg)
    StatusText.Text = "Nhật ký: " .. msg
end

-- 3. THANH DANH MỤC BÊN TRÁI (NAVIGATION SIDEBAR)
local SideBar = Instance.new("Frame")
SideBar.Parent = MainFrame
SideBar.Position = UDim2.new(0, 0, 0, 55)
SideBar.Size = UDim2.new(0, 140, 1, -80)
SideBar.BackgroundColor3 = Color3.fromRGB(14, 15, 22)

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = SideBar
SideLayout.Padding = UDim.new(0, 5)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Container = Instance.new("Frame")
Container.Parent = MainFrame
Container.Position = UDim2.new(0, 145, 0, 60)
Container.Size = UDim2.new(1, -155, 1, -90)
Container.BackgroundTransparency = 1

-- HÀM TẠO TAB NÂNG CAO
local Pages = {}
local function NewTab(name, icon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = SideBar
    TabBtn.Size = UDim2.new(0.9, 0, 0, 40)
    TabBtn.BackgroundColor3 = Color3.fromRGB(22, 24, 35)
    TabBtn.Text = icon .. "  " .. name
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.SourceSansBold
    TabBtn.TextSize = 14
    ApplyCorner(TabBtn, 6)

    local Page = Instance.new("ScrollingFrame")
    Page.Parent = Container
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 4
    Page.CanvasSize = UDim2.new(0, 0, 2, 0)
    
    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.Padding = UDim.new(0, 10)

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        Page.Visible = true
        ShowLog("Đang xem danh mục [" .. name .. "]")
    end)

    Pages[name] = Page
    return Page
end

-- KHỞI TẠO CÁC TAB CHÍNH THỨC
local FarmTab = NewTab("Auto Farm", "⚔️")
local TeleTab = NewTab("Dịch Chuyển", "📍")
local RaidTab = NewTab("Đi Raid", "🔥")
local SetTab = NewTab("Cài Đặt", "⚙️")

Pages["Auto Farm"].Visible = true

-- ==================================================================================
-- 4. XÂY DỰNG CÁC THÀNH PHẦN UI PHỨC TẠP (DROPDOWN, SLIDER, TOGGLE)
-- ==================================================================================

-- [TÍNH NĂNG 1: TOGGLE SWITCH CHUẨN PRO]
local function CreateAdvancedToggle(parent, title, callback)
    local Box = Instance.new("Frame")
    Box.Parent = parent
    Box.Size = UDim2.new(0.96, 0, 0, 45)
    Box.BackgroundColor3 = Color3.fromRGB(20, 22, 32)
    ApplyCorner(Box, 6)

    local Lbl = Instance.new("TextLabel")
    Lbl.Parent = Box
    Lbl.Size = UDim2.new(0.6, 0, 1, 0)
    Lbl.Position = UDim2.new(0.04, 0, 0, 0)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = title
    Lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    Lbl.Font = Enum.Font.SourceSans
    Lbl.TextSize = 14
    Lbl.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton")
    Btn.Parent = Box
    Btn.Position = UDim2.new(0.76, 0, 0.2, 0)
    Btn.Size = UDim2.new(0, 60, 0, 26)
    Btn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSansBold
    ApplyCorner(Btn, 13)

    local isActive = false
    Btn.MouseButton1Click:Connect(function()
        isActive = not isActive
        if isActive then
            Btn.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
            Btn.Text = "ON"
            ShowLog("Bật trạng thái: " .. title)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
            Btn.Text = "OFF"
            ShowLog("Tắt trạng thái: " .. title)
        end
        callback(isActive)
    end)
end

-- [TÍNH NĂNG 2: THANH TRƯỢT SỐ (SLIDER)]
local function CreateSlider(parent, title, min, max, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Parent = parent
    SliderFrame.Size = UDim2.new(0.96, 0, 0, 55)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 32)
    ApplyCorner(SliderFrame, 6)

    local TitleLbl = Instance.new("TextLabel")
    TitleLbl.Parent = SliderFrame
    TitleLbl.Size = UDim2.new(0.9, 0, 0.4, 0)
    TitleLbl.Position = UDim2.new(0.04, 0, 0.1, 0)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Text = title .. " : " .. min
    TitleLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    TitleLbl.Font = Enum.Font.SourceSans
    TitleLbl.TextSize = 13
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local Track = Instance.new("Frame")
    Track.Parent = SliderFrame
    Track.Position = UDim2.new(0.04, 0, 0.65, 0)
    Track.Size = UDim2.new(0.92, 0, 0, 6)
    Track.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
    ApplyCorner(Track, 3)

    local Fill = Instance.new("Frame")
    Fill.Parent = Track
    Fill.Size = UDim2.new(0.3, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 180)
    ApplyCorner(Fill, 3)

    -- Logic tương tác trượt cơ bản (Mô phỏng phản hồi khi bấm vào thanh)
    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local percent = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
            Fill.Size = UDim2.new(percent, 0, 1, 0)
            local currentVal = math.floor(min + (max - min) * percent)
            TitleLbl.Text = title .. " : " .. currentVal
            callback(currentVal)
        end
    end)
end

-- [TÍNH NĂNG 3: HỘP CHỌN THẢ XUỐNG (DROPDOWN MENU)]
local function CreateDropdown(parent, title, options, callback)
    local DropFrame = Instance.new("Frame")
    DropFrame.Parent = parent
    DropFrame.Size = UDim2.new(0.96, 0, 0, 45)
    DropFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 32)
    ApplyCorner(DropFrame, 6)
    DropFrame.ClipsDescendants = true

    local TriggerBtn = Instance.new("TextButton")
    TriggerBtn.Parent = DropFrame
    TriggerBtn.Size = UDim2.new(1, 0, 0, 45)
    TriggerBtn.BackgroundTransparency = 1
    TriggerBtn.Text = "  " .. title .. " [Chọn...]"
    TriggerBtn.TextColor3 = Color3.fromRGB(0, 255, 180)
    TriggerBtn.Font = Enum.Font.SourceSansBold
    TriggerBtn.TextSize = 14
    TriggerBtn.TextXAlignment = Enum.TextXAlignment.Left

    local isOpened = false
    TriggerBtn.MouseButton1Click:Connect(function()
        isOpened = not isOpened
        if isOpened then
            DropFrame.Size = UDim2.new(0.96, 0, 0, 45 + (#options * 35))
        else
            DropFrame.Size = UDim2.new(0.96, 0, 0, 45)
        end
    end)

    for i, opt in ipairs(options) do
        local OptBtn = Instance.new("TextButton")
        OptBtn.Parent = DropFrame
        OptBtn.Position = UDim2.new(0, 0, 0, 45 + (i - 1) * 35)
        OptBtn.Size = UDim2.new(1, 0, 0, 30)
        OptBtn.BackgroundColor3 = Color3.fromRGB(30, 34, 48)
        OptBtn.Text = "• " .. opt
        OptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptBtn.Font = Enum.Font.SourceSans
        OptBtn.TextSize = 13
        
        OptBtn.MouseButton1Click:Connect(function()
            TriggerBtn.Text = "  " .. title .. " [" .. opt .. "]"
            DropFrame.Size = UDim2.new(0.96, 0, 0, 45)
            isOpened = false
            ShowLog("Đã chọn vũ khí: " .. opt)
            callback(opt)
        end)
    end
end

-- ==================================================================================
-- 5. ĐƯA CÁC THÀNH PHẦN VÀO MENU ĐỂ HOÀN THIỆN
-- ==================================================================================

-- Thêm tính năng vào Tab Farm
CreateDropdown(FarmTab, "Chọn Vũ Khí Đấm Quái", {"Melee (Cận chiến)", "Sword (Kiếm độc)", "Fruit (Trái Ác Quỷ)", "Gun (Súng)"}, function(w) end)
CreateAdvancedToggle(FarmTab, "Tự Động Nhận Nhiệm Vụ", function(v) end)
CreateAdvancedToggle(FarmTab, "Tự Động Gom Quái Siêu Tốc", function(v) end)
CreateSlider(FarmTab, "Khoảng cách gom quái (Distance)", 10, 100, function(v) end)

-- Thêm tính năng vào Tab Dịch Chuyển (Teleport)
CreateAdvancedToggle(TeleTab, "Dịch Chuyển An Toàn Bằng Tween (Chống Kẹt)", function(v) end)
CreateDropdown(TeleTab, "Chọn Đảo Bay Đến (Sea 1)", {"Đảo Khỉ", "Đảo Sa Mạc", "Đảo Hải Tặc", "Nhà Tù Sky"}, function(loc) end)

-- Thêm tính năng vào Tab Raid
CreateAdvancedToggle(RaidTab, "Tự Động Mua Vé Bản Đồ Raid", function(v) end)
CreateAdvancedToggle(RaidTab, "Tự Động Bắt Đầu Đợt Quái (Start Wave)", function(v) end)

-- Thêm tính năng cài đặt (Settings)
CreateSlider(SetTab, "Cấu hình Tốc độ Bay (Speed)", 100, 350, function(v) end)

-- ==================================================================================
-- 6. HIỆU ỨNG TWEEN ẨN HIỆN & PHÍM TẮT ĐIỀU KHIỂN
-- ==================================================================================
local function AnimateMenu(open)
    if open then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 560, 0, 0)
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 560, 0, 400)})
        tween:Play()
        OpenBtn.Visible = false
    else
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 560, 0, 0)})
        tween:Play()
        tween.Completed:Connect(function()
            MainFrame.Visible = false
            OpenBtn.Visible = true
        end)
    end
end

OpenBtn.MouseButton1Click:Connect(function() AnimateMenu(true) end)
CloseBtn.MouseButton1Click:Connect(function() AnimateMenu(false) end)

-- Nhấn phím RightControl (Phím Ctrl bên phải bàn phím) để ẩn hiện nhanh
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        if MainFrame.Visible then AnimateMenu(false) else AnimateMenu(true) end
    end
end)
