local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cấu hình KeySystem Vĩnh Viễn
local VALID_KEYS = {
    "SKY1337"
}

local KEY_FILE = "DungSkyHub_PermanentKey.txt"

-- GUI - Neon Xanh
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DungSkyMenu"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Tạo màn hình KeySystem
local keyGui = Instance.new("Frame")
keyGui.Size = UDim2.new(0, 350, 0, 200)
keyGui.Position = UDim2.new(0.5, -175, 0.5, -100)
keyGui.AnchorPoint = Vector2.new(0.5, 0.5)
keyGui.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
keyGui.BorderSizePixel = 0
keyGui.Visible = true
keyGui.Parent = screenGui

local keyCorner = Instance.new("UICorner", keyGui)
keyCorner.CornerRadius = UDim.new(0, 12)

local keyStroke = Instance.new("UIStroke", keyGui)
keyStroke.Color = Color3.fromRGB(0, 255, 128)
keyStroke.Thickness = 3

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, -20, 0, 40)
keyTitle.Position = UDim2.new(0, 10, 0, 10)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "🔑 SKY HUB - KEY SYSTEM 🔑"
keyTitle.Font = Enum.Font.GothamBlack
keyTitle.TextSize = 18
keyTitle.TextColor3 = Color3.fromRGB(0, 255, 128)
keyTitle.TextStrokeTransparency = 0
keyTitle.TextStrokeColor3 = Color3.fromRGB(0, 100, 50)
keyTitle.Parent = keyGui

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -40, 0, 40)
keyInput.Position = UDim2.new(0, 20, 0, 60)
keyInput.PlaceholderText = "Nhập key của bạn..."
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyInput.BorderSizePixel = 0
keyInput.Parent = keyGui

local keyInputCorner = Instance.new("UICorner", keyInput)
keyInputCorner.CornerRadius = UDim.new(0, 8)

local keyInputStroke = Instance.new("UIStroke", keyInput)
keyInputStroke.Color = Color3.fromRGB(0, 255, 128)
keyInputStroke.Thickness = 1

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(1, -40, 0, 40)
submitButton.Position = UDim2.new(0, 20, 0, 110)
submitButton.Text = "XÁC NHẬN KEY"
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 16
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
submitButton.BorderSizePixel = 0
submitButton.Parent = keyGui

local submitCorner = Instance.new("UICorner", submitButton)
submitCorner.CornerRadius = UDim.new(0, 8)

local submitStroke = Instance.new("UIStroke", submitButton)
submitStroke.Color = Color3.fromRGB(0, 255, 128)
submitStroke.Thickness = 2

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 0, 160)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
statusLabel.Text = "Vui lòng nhập key để sử dụng Sky Hub"
statusLabel.Parent = keyGui

-- Hàm kiểm tra key
local function checkKey(key)
    for _, validKey in pairs(VALID_KEYS) do
        if key == validKey then
            return true
        end
    end
    return false
end

-- Hàm lưu key
local function saveKey(key)
    writefile(KEY_FILE, HttpService:JSONEncode({
        key = key,
        activated = os.time()
    }))
end

-- Hàm kiểm tra key đã lưu
local function hasValidKey()
    if isfile(KEY_FILE) then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile(KEY_FILE))
        end)
        if success and data and checkKey(data.key) then
            return true
        end
    end
    return false
end

-- Icon (TextButton) - Hidden initially
local iconButton = Instance.new("TextButton")
iconButton.Name = "MenuIcon"
iconButton.Size = UDim2.new(0, 50, 0, 50)
iconButton.Position = UDim2.new(0, 20, 0, 20)
iconButton.Text = "⚡"
iconButton.Font = Enum.Font.GothamBold
iconButton.TextSize = 24
iconButton.TextColor3 = Color3.fromRGB(0, 255, 128)
iconButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
iconButton.BorderSizePixel = 0
iconButton.Draggable = true
iconButton.Active = true
iconButton.Visible = false -- Hidden initially
iconButton.Parent = screenGui

-- Xử lý sự kiện submit key
submitButton.MouseButton1Click:Connect(function()
    local key = string.upper(string.gsub(keyInput.Text, "%s+", ""))
    
    if checkKey(key) then
        saveKey(key)
        statusLabel.Text = "✅ Key hợp lệ - Đang mở menu..."
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "SKY HUB",
            Text = "Chào mừng "..player.Name.." đã trở lại!",
            Duration = 5,
            Icon = "rbxassetid://57254792"
        })
        
        wait(1)
        keyGui.Visible = false
        iconButton.Visible = true
    else
        statusLabel.Text = "❌ Key không hợp lệ! Vui lòng thử lại"
        statusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- Kiểm tra key khi khởi chạy
if hasValidKey() then
    -- Thông báo khi tự động đăng nhập bằng key đã lưu
    game.StarterGui:SetCore("SendNotification", {
        Title = "SKY HUB",
        Text = "Chào mừng "..player.Name.." đã trở lại!",
        Duration = 5,
        Icon = "rbxassetid://57254792"
    })
    
    keyGui.Visible = false
    iconButton.Visible = true
else
    keyGui.Visible = true
    iconButton.Visible = false
end

local iconCorner = Instance.new("UICorner", iconButton)
iconCorner.CornerRadius = UDim.new(0, 12)

local iconStroke = Instance.new("UIStroke", iconButton)
iconStroke.Color = Color3.fromRGB(0, 255, 128)
iconStroke.Thickness = 2

-- Main Frame - Tự động điều chỉnh kích thước
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 300)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Cho phép di chuyển mainFrame
local dragging = false
local dragInput, dragStart, startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, 
        startPos.X.Offset + delta.X,
        startPos.Y.Scale, 
        startPos.Y.Offset + delta.Y
    )
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0, 255, 128)
mainStroke.Thickness = 3

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 0, 40)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ SKY HUB ⚡"
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 22
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
titleLabel.TextStrokeTransparency = 0
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 50)
titleLabel.Parent = mainFrame

-- Tabs Container
local tabButtons = Instance.new("Frame")
tabButtons.Size = UDim2.new(1, -20, 0, 40)
tabButtons.Position = UDim2.new(0, 10, 0, 60)
tabButtons.BackgroundTransparency = 1
tabButtons.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout", tabButtons)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 10)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Tab Pages với ScrollingFrame
local pages = Instance.new("Frame")
pages.Name = "Pages"
pages.Size = UDim2.new(1, -20, 1, -110)
pages.Position = UDim2.new(0, 10, 0, 110)
pages.BackgroundTransparency = 1
pages.Parent = mainFrame

-- Hàm tạo tab với ScrollingFrame tự động điều chỉnh
local function createTab(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 80, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(0, 255, 128)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = tabButtons

    local tabCorner = Instance.new("UICorner", button)
    tabCorner.CornerRadius = UDim.new(0, 8)

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = name.."Tab"
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.Visible = false
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    scrollFrame.Parent = pages
    
    local listLayout = Instance.new("UIListLayout", scrollFrame)
    listLayout.Padding = UDim.new(0, 10)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
        local newHeight = math.clamp(110 + listLayout.AbsoluteContentSize.Y + 20, 200, 500)
        mainFrame.Size = UDim2.new(0, 300, 0, newHeight)
    end)

    return button, scrollFrame
end

-- Tạo Tab 
local mainTabButton, MainTab = createTab("Main")
local settingsTabButton, SettingsTab = createTab("Settings")
local modTabButton, ModTab = createTab("Mod")
local shopTabButton, ShopTab = createTab("Shop")

-- Hàm tạo nút tiêu chuẩn với hiệu ứng nhấn màu xanh
local function createStandardButton(parent, text, yOffset)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, yOffset or 0)
    button.Text = text
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.AutoButtonColor = false
    button.Parent = parent
    
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", button)
    stroke.Color = Color3.fromRGB(0, 255, 128)
    stroke.Thickness = 1
    
    -- Hiệu ứng hover
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
    end)
    
    -- Hiệu ứng nhấn màu xanh
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    return button
end

-- 💥

-- Thêm nút vào MainTab
local spinBtn = createStandardButton(MainTab, "Bắt đầu quay", 10)
local autoClickButton = createStandardButton(MainTab, "Tự Động Đánh: OFF", 60)
local aimbotButton = createStandardButton(MainTab, "Aimbot: OFF", 160)

-- Thêm nút vào SettingsTab
local afkButton = createStandardButton(SettingsTab, "Bật AFK", 10)
local fixLagButton = createStandardButton(SettingsTab, "Fix Lag: OFF", 60)
local espButton = createStandardButton(SettingsTab, "ESP: OFF", 110)
local hideNamesButton = createStandardButton(SettingsTab, "Ẩn tên: OFF", 210)
local infoButton = createStandardButton(SettingsTab, "Thông Tin Server", 210)

-- Thêm nút vào ModTab
local noClipButton = createStandardButton(ModTab, "NoClip: OFF", 10)
local infJumpButton = createStandardButton(ModTab, "Nhảy vô hạn: OFF", 110)
local hitboxButton = createStandardButton(ModTab, "Hitbox: OFF", 160)

-- Thêm nút vài ShopTab
local buyPhoLonButton = createStandardButton(ShopTab, "Mua Phóng Lợn", 110)
local buyMaTauButton = createStandardButton(ShopTab, "Mua Mã Tấu", 110)
local buyBandageButton = createStandardButton(ShopTab, "Mua Băng Gạc", 10)
local autoBuyBandageButton = createStandardButton(ShopTab, "Tự Động Mua Băng Gạc: OFF", 60)

-- Kích hoạt tab mặc định
MainTab.Visible = true
settingsTabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainTabButton.BackgroundColor3 = Color3.fromRGB(0, 100, 50)

-- Sửa lại hàm switchTab
local function switchTab(tabToShow)
    -- Ẩn tất cả các tab
    MainTab.Visible = false
    SettingsTab.Visible = false
    ModTab.Visible = false
    ShopTab.Visible = false
    
    -- Hiển thị tab được chọn
    tabToShow.Visible = true
    
    -- Cập nhật màu nút tab
    mainTabButton.BackgroundColor3 = tabToShow == MainTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
    settingsTabButton.BackgroundColor3 = tabToShow == SettingsTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
    modTabButton.BackgroundColor3 = tabToShow == ModTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
    shopTabButton.BackgroundColor3 = tabToShow == ShopTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
end

-- Cập nhật sự kiện click cho các tab
mainTabButton.MouseButton1Click:Connect(function()
    switchTab(MainTab)
end)

settingsTabButton.MouseButton1Click:Connect(function()
    switchTab(SettingsTab)
end)

modTabButton.MouseButton1Click:Connect(function()
    switchTab(ModTab)
end)

shopTabButton.MouseButton1Click:Connect(function()
    switchTab(ShopTab)
end)

-- Toggle hiển thị menu với hiệu ứng
iconButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        mainFrame.Size = UDim2.new(0, 300, 0, 0)
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 300, 0, 200)
        }):Play()
    end
end)

-- Thêm nút đóng GUI
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(0, 8)

local closeStroke = Instance.new("UIStroke", closeButton)
closeStroke.Color = Color3.fromRGB(255, 50, 50)
closeStroke.Thickness = 2

-- Hiệu ứng hover cho nút đóng
closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    }):Play()
end)

-- Sự kiện đóng GUI
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- ⚙️ SPIN
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    while not char:FindFirstChild("HumanoidRootPart") do
        char = player.Character or player.CharacterAdded:Wait()
    end
    return char
end

local character = getCharacter()
local hrp = character:WaitForChild("HumanoidRootPart")

local bav = Instance.new("BodyAngularVelocity")
bav.AngularVelocity = Vector3.new(0, 150, 0)
bav.MaxTorque = Vector3.new(0, math.huge, 0)
bav.P = 1000
bav.Name = "Spinner"

local isSpinning = false

spinBtn.MouseButton1Click:Connect(function()
    isSpinning = not isSpinning
    if isSpinning then
        bav.Parent = hrp
        spinBtn.Text = "Dừng quay"
    else
        bav.Parent = nil
        spinBtn.Text = "Bắt đầu quay"
    end
end)

player.CharacterAdded:Connect(function(char)
    character = char
    hrp = character:WaitForChild("HumanoidRootPart")
    if isSpinning then
        bav.Parent = hrp
    end
end)

-- ⚙️ AFK
local afk = false
local heartbeatConnection

afkButton.MouseButton1Click:Connect(function()
    afk = not afk
    afkButton.Text = afk and "Đang AFK" or "Bật AFK"

    if afk then
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                hrp.CFrame = hrp.CFrame * CFrame.new(0.01, 0, 0)
                wait(1.5)
                hrp.CFrame = hrp.CFrame * CFrame.new(-0.01, 0, 0)
            end
        end)
    else
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
    end
end)

-- ⚙️ FIX LAG
local fixLag = false

fixLagButton.MouseButton1Click:Connect(function()
    fixLag = not fixLag
    fixLagButton.Text = "Fix Lag: " .. (fixLag and "ON" or "OFF")

    if fixLag then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            end
        end
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = true
            end
        end
    end
end)

-- ⚙️ ESP
local showESP = false

local function createESP(player)
    if player == Players.LocalPlayer then return end
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = player.Character:WaitForChild("Head")
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = player.Character

    local nameLabel = Instance.new("TextLabel", billboard)
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Text = player.Name
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextScaled = true

    local healthLabel = Instance.new("TextLabel", billboard)
    healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
    healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.TextScaled = true

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local hp = math.floor(player.Character.Humanoid.Health)
            healthLabel.Text = "HP: " .. hp
        end
    end)

    player.CharacterRemoving:Connect(function()
        if billboard then billboard:Destroy() end
        if connection then connection:Disconnect(