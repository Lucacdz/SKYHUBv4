local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI - Neon Xanh
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DungSkyMenu"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Icon (TextButton)
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
iconButton.Parent = screenGui

local iconCorner = Instance.new("UICorner", iconButton)
iconCorner.CornerRadius = UDim.new(0, 12)

local iconStroke = Instance.new("UIStroke", iconButton)
iconStroke.Color = Color3.fromRGB(0, 255, 128)
iconStroke.Thickness = 2

-- Main Frame - Tự động điều chỉnh kích thước
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
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
titleLabel.Text = "⚡ DUNGSKY HUB ⚡"
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

-- Tạo Tabs
local mainTabButton, MainTab = createTab("Main")
local settingsTabButton, SettingsTab = createTab("Settings")
local modTabButton, ModTab = createTab("Mod")

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

-- Thêm nút vào MainTab
local spinBtn = createStandardButton(MainTab, "Bắt đầu quay", 10)
local autoClickButton = createStandardButton(MainTab, "Tự Động Đánh: OFF", 60)
local aimbotButton = createStandardButton(MainTab, "Aimbot: OFF", 160)

-- Thêm nút vào SettingsTab
local afkButton = createStandardButton(SettingsTab, "Bật AFK", 10)
local fixLagButton = createStandardButton(SettingsTab, "Fix Lag: OFF", 60)
local espButton = createStandardButton(SettingsTab, "ESP: OFF", 110)
local hideNamesButton = createStandardButton(SettingsTab, "Ẩn tên: OFF", 210)

-- Thêm nút vào ModTab
local noClipButton = createStandardButton(ModTab, "NoClip: OFF", 10)
local speedHackButton = createStandardButton(ModTab, "Tăng tốc: OFF", 60)
local infJumpButton = createStandardButton(ModTab, "Nhảy vô hạn: OFF", 110)
local flyButton = createStandardButton(ModTab, "Bay: OFF", 160)

-- Kích hoạt tab mặc định
MainTab.Visible = true
settingsTabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainTabButton.BackgroundColor3 = Color3.fromRGB(0, 100, 50)

-- Xử lý chuyển tab
local function switchTab(tabToShow, tabToHide, activeButton, inactiveButton)
    tabToShow.Visible = true
    tabToHide.Visible = false
    activeButton.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
    inactiveButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end

mainTabButton.MouseButton1Click:Connect(function()
    switchTab(MainTab, SettingsTab, mainTabButton, settingsTabButton)
end)

settingsTabButton.MouseButton1Click:Connect(function()
    switchTab(SettingsTab, MainTab, settingsTabButton, mainTabButton)
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
        if connection then connection:Disconnect() end
    end)
end

local function toggleESP(state)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            if state then
                createESP(plr)
            else
                local esp = plr.Character:FindFirstChild("ESP")
                if esp then esp:Destroy() end
            end
        end
    end
end

espButton.MouseButton1Click:Connect(function()
    showESP = not showESP
    espButton.Text = "ESP: " .. (showESP and "ON" or "OFF")
    toggleESP(showESP)
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if showESP then wait(1) createESP(plr) end
    end)
end)

-- ⚙️ AIMBOT
local camera = workspace.CurrentCamera
local isAimbotOn = false

local function getClosestPlayer()
    local closest, minDist = nil, math.huge
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (hrp.Position - target.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                closest = target
                minDist = dist
            end
        end
    end
    return closest
end

local aimConnection = nil

aimbotButton.MouseButton1Click:Connect(function()
    isAimbotOn = not isAimbotOn
    aimbotButton.Text = "Aimbot: " .. (isAimbotOn and "ON" or "OFF")

    if isAimbotOn then
        aimConnection = RunService.RenderStepped:Connect(function()
            local target = getClosestPlayer()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = target.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)
                camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
            end
        end)
    else
        if aimConnection then
            aimConnection:Disconnect()
            aimConnection = nil
        end
    end
end)

-- ⚙️ AUTO CLICK
local isAutoClicking = false
local autoClickConnection = nil

autoClickButton.MouseButton1Click:Connect(function()
    isAutoClicking = not isAutoClicking
    autoClickButton.Text = "Tự Động Đánh: " .. (isAutoClicking and "ON" or "OFF")

    if isAutoClicking then
        autoClickConnection = RunService.RenderStepped:Connect(function()
            local char = player.Character
            if char then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end
        end)
    else
        if autoClickConnection then
            autoClickConnection:Disconnect()
            autoClickConnection = nil
        end
    end
end)

-- ⚙️ ẨN TÊN NGƯỜI DÙNG (PHIÊN BẢN HOÀN CHỈNH)
local hideNames = false
local nameTags = {}

local function toggleNameVisibility(player, hide)
    if not player.Character then return end
    
    -- Tìm tất cả các BillboardGui hiển thị tên
    for _, child in ipairs(player.Character:GetDescendants()) do
        if child:IsA("BillboardGui") and (child.Name == "NameTag" or child.Name == "Nametag" or child:FindFirstChildOfClass("TextLabel")) then
            if hide then
                -- Lưu trạng thái gốc và ẩn đi
                nameTags[child] = child.Enabled
                child.Enabled = false
            else
                -- Khôi phục trạng thái gốc
                if nameTags[child] ~= nil then
                    child.Enabled = nameTags[child]
                else
                    child.Enabled = true
                end
            end
        end
    end
    
    -- Xử lý với Humanoid (nếu có)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if hide then
            nameTags[humanoid] = humanoid.DisplayName
            humanoid.DisplayName = ""
        else
            if nameTags[humanoid] then
                humanoid.DisplayName = nameTags[humanoid]
            end
        end
    end
end

local function toggleAllNames(hide)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            toggleNameVisibility(player, hide)
        end
    end
end

hideNamesButton.MouseButton1Click:Connect(function()
    hideNames = not hideNames
    hideNamesButton.Text = "Ẩn tên: " .. (hideNames and "ON" or "OFF")
    toggleAllNames(hideNames)
end)

-- Xử lý khi có người chơi mới tham gia
Players.PlayerAdded:Connect(function(player)
    if hideNames then
        player.CharacterAdded:Connect(function(character)
            if hideNames then
                toggleNameVisibility(player, true)
            end
        end)
    end
end)

-- Xử lý khi người chơi rời khỏi game
Players.PlayerRemoving:Connect(function(player)
    -- Dọn dẹp dữ liệu
    for k, v in pairs(nameTags) do
        if not k:IsDescendantOf(game) then
            nameTags[k] = nil
        end
    end
end)

-- ⚙️ NOCIP FUNCTION (Phiên bản nâng cao)
local isNoClip = false
local noClipConnection = nil
local originalCollisions = {}

noClipButton.MouseButton1Click:Connect(function()
    isNoClip = not isNoClip
    noClipButton.Text = "NoClip: " .. (isNoClip and "ON" or "OFF")
    
    local function setNoClipState(character, state)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                if state then
                    -- Lưu trạng thái gốc và áp dụng NoClip
                    originalCollisions[part] = {
                        CanCollide = part.CanCollide,
                        Massless = part.Massless
                    }
                    part.CanCollide = false
                    part.Massless = true
                else
                    -- Khôi phục trạng thái gốc
                    if originalCollisions[part] then
                        part.CanCollide = originalCollisions[part].CanCollide
                        part.Massless = originalCollisions[part].Massless
                        originalCollisions[part] = nil
                    else
                        -- Mặc định nếu không có thông tin gốc
                        part.CanCollide = true
                        part.Massless = false
                    end
                end
            end
        end
    end

    if isNoClip then
        -- Bật NoClip
        if player.Character then
            setNoClipState(player.Character, true)
        end
        
        -- Kết nối sự kiện CharacterAdded
        noClipConnection = player.CharacterAdded:Connect(function(char)
            wait(0.5) -- Đợi character load đầy đủ
            if isNoClip then
                setNoClipState(char, true)
            end
        end)
    else
        -- Tắt NoClip
        if noClipConnection then
            noClipConnection:Disconnect()
            noClipConnection = nil
        end
        
        if player.Character then
            setNoClipState(player.Character, false)
        end
    end
end)

-- ⚙️ TĂNG TỐC DI CHUYỂN
local isSpeedHack = false
local originalWalkSpeed = 16

speedHackButton.MouseButton1Click:Connect(function()
    isSpeedHack = not isSpeedHack
    speedHackButton.Text = "Tăng tốc: " .. (isSpeedHack and "ON" or "OFF")
    
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = isSpeedHack and 50 or originalWalkSpeed
    end
    
    -- Xử lý khi respawn
    player.CharacterAdded:Connect(function(char)
        humanoid = char:WaitForChild("Humanoid")
        humanoid.WalkSpeed = isSpeedHack and 50 or originalWalkSpeed
    end)
end)

-- ⚙️ NHẢY VÔ HẠN
local isInfJump = false
local jumpConnection = nil

infJumpButton.MouseButton1Click:Connect(function()
    isInfJump = not isInfJump
    infJumpButton.Text = "Nhảy vô hạn: " .. (isInfJump and "ON" or "OFF")
    
    if isInfJump then
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
end)

-- ⚙️ CHỨC NĂNG BAY
local isFlying = false
local flyConnection = nil
local flySpeed = 50

flyButton.MouseButton1Click:Connect(function()
    isFlying = not isFlying
    flyButton.Text = "Bay: " .. (isFlying and "ON" or "OFF")
    
    if isFlying then
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.PlatformStand = true
        
        flyConnection = RunService.Stepped:Connect(function()
            if character and character:FindFirstChild("HumanoidRootPart") then
                local root = character.HumanoidRootPart
                local cam = workspace.CurrentCamera.CFrame
                
                local flyVector = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    flyVector = flyVector + (cam.LookVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    flyVector = flyVector - (cam.LookVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    flyVector = flyVector - (cam.RightVector * flySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    flyVector = flyVector + (cam.RightVector * flySpeed)
                end
                
                root.Velocity = flyVector
                root.RotVelocity = Vector3.new()
            end
        end)
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.PlatformStand = false
        end
    end
end)
