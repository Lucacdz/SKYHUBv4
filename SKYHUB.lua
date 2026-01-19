-- DungSkyHub Premium Edition
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cấu hình KeySystem Vĩnh Viễn
local VALID_KEYS = {"SKY1337", "PREMIUM2024"}
local KEY_FILE = "DungSkyHub_Premium_Key.txt"

-- Màu sắc theme cao cấp
local COLORS = {
    PRIMARY = Color3.fromRGB(0, 184, 255),      -- Xanh neon sáng
    SECONDARY = Color3.fromRGB(255, 65, 140),   -- Hồng neon
    DARK_BG = Color3.fromRGB(10, 10, 15),
    LIGHT_BG = Color3.fromRGB(25, 25, 35),
    ACCENT = Color3.fromRGB(138, 43, 226),      -- Tím neon
    SUCCESS = Color3.fromRGB(0, 255, 128),
    ERROR = Color3.fromRGB(255, 50, 100),
    TEXT = Color3.fromRGB(245, 245, 255)
}

-- ============== KEY SYSTEM ==============
local function checkKey(key)
    for _, validKey in pairs(VALID_KEYS) do
        if key == validKey then
            return true
        end
    end
    return false
end

local function saveKey(key)
    writefile(KEY_FILE, HttpService:JSONEncode({
        key = key,
        activated = os.time(),
        player = player.Name,
        userId = player.UserId
    }))
end

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

-- ============== UI UTILITIES ==============
local function createRoundedFrame(parent, size, position)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = COLORS.DARK_BG
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORS.PRIMARY
    stroke.Thickness = 2
    stroke.Transparency = 0.3
    stroke.Parent = frame
    
    -- Thêm hiệu ứng glow
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://8992230932"
    glow.ImageColor3 = COLORS.PRIMARY
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(50, 50, 50, 50)
    glow.ImageTransparency = 0.8
    glow.ZIndex = -1
    glow.Parent = frame
    
    return frame
end

local function createModernButton(parent, text, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 45)
    button.Position = position
    button.Text = text
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 14
    button.TextColor3 = COLORS.TEXT
    button.BackgroundColor3 = COLORS.LIGHT_BG
    button.AutoButtonColor = false
    button.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = button
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORS.PRIMARY
    stroke.Thickness = 1
    stroke.Parent = button
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.PRIMARY),
        ColorSequenceKeypoint.new(1, COLORS.SECONDARY)
    })
    gradient.Rotation = 90
    gradient.Enabled = false
    gradient.Parent = button
    
    local hoverGradient = Instance.new("UIGradient")
    hoverGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.PRIMARY),
        ColorSequenceKeypoint.new(0.5, COLORS.SECONDARY),
        ColorSequenceKeypoint.new(1, COLORS.ACCENT)
    })
    hoverGradient.Rotation = 90
    hoverGradient.Enabled = false
    hoverGradient.Parent = button
    
    -- Hiệu ứng hover
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, 205, 0, 48)
        }):Play()
        gradient.Enabled = true
        stroke.Thickness = 2
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 200, 0, 45)
        }):Play()
        gradient.Enabled = false
        stroke.Thickness = 1
    end)
    
    -- Hiệu ứng click
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundTransparency = 0.3,
            Size = UDim2.new(0, 195, 0, 43)
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, 205, 0, 48)
        }):Play()
    end)
    
    return button
end

-- ============== MAIN SCREEN GUI ==============
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DungSkyHubPremium"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Key System GUI
local keyFrame = createRoundedFrame(screenGui, UDim2.new(0, 400, 0, 300), UDim2.new(0.5, -200, 0.5, -150))

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 60)
title.Position = UDim2.new(0, 20, 0, 20)
title.BackgroundTransparency = 1
title.Text = "🔐 DUNG SKY HUB PREMIUM 🔐"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = COLORS.PRIMARY
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = COLORS.DARK_BG
title.Parent = keyFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -40, 0, 20)
subtitle.Position = UDim2.new(0, 20, 0, 80)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Premium Gaming Experience"
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 14
subtitle.TextColor3 = COLORS.SECONDARY
subtitle.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -40, 0, 50)
keyInput.Position = UDim2.new(0, 20, 0, 120)
keyInput.PlaceholderText = "Enter your premium key..."
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.TextColor3 = COLORS.TEXT
keyInput.BackgroundColor3 = COLORS.LIGHT_BG
keyInput.BorderSizePixel = 0
keyInput.Parent = keyFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = keyInput

local submitBtn = createModernButton(keyFrame, "ACTIVATE KEY", UDim2.new(0.5, -100, 0, 190))

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 30)
statusLabel.Position = UDim2.new(0, 20, 0, 250)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextSize = 12
statusLabel.TextColor3 = COLORS.TEXT
statusLabel.Text = "Enter your premium key to unlock all features"
statusLabel.Parent = keyFrame

-- ============== MAIN MENU GUI ==============
local menuFrame = createRoundedFrame(screenGui, UDim2.new(0, 350, 0, 500), UDim2.new(0, 20, 0.5, -250))
menuFrame.Visible = false

-- Menu Header
local menuHeader = Instance.new("Frame")
menuHeader.Size = UDim2.new(1, 0, 0, 70)
menuHeader.BackgroundColor3 = COLORS.DARK_BG
menuHeader.BorderSizePixel = 0
menuHeader.Parent = menuFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = menuHeader

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, -80, 0, 40)
hubTitle.Position = UDim2.new(0, 20, 0, 15)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "⚡ DUNG SKY HUB ⚡"
hubTitle.Font = Enum.Font.GothamBlack
hubTitle.TextSize = 18
hubTitle.TextColor3 = COLORS.PRIMARY
hubTitle.Parent = menuHeader

local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(1, -80, 0, 20)
versionLabel.Position = UDim2.new(0, 20, 0, 45)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "PREMIUM v2.0"
versionLabel.Font = Enum.Font.GothamMedium
versionLabel.TextSize = 12
versionLabel.TextColor3 = COLORS.SECONDARY
versionLabel.Parent = menuHeader

-- Menu Icon
local menuIcon = Instance.new("TextButton")
menuIcon.Size = UDim2.new(0, 60, 0, 60)
menuIcon.Position = UDim2.new(0, 20, 0.5, -30)
menuIcon.Text = "🎮"
menuIcon.Font = Enum.Font.GothamBlack
menuIcon.TextSize = 24
menuIcon.TextColor3 = COLORS.PRIMARY
menuIcon.BackgroundColor3 = COLORS.DARK_BG
menuIcon.AutoButtonColor = false
menuIcon.Visible = false
menuIcon.Parent = screenGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 20)
iconCorner.Parent = menuIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = COLORS.PRIMARY
iconStroke.Thickness = 3
iconStroke.Parent = menuIcon

-- Tabs
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -40, 0, 40)
tabsFrame.Position = UDim2.new(0, 20, 0, 80)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = menuFrame

local tabs = {}
local pages = {}

local tabContents = {
    ["COMBAT"] = {"Aimbot", "Hitbox", "Auto Attack", "Kill Aura"},
    ["MOVEMENT"] = {"Fly", "NoClip", "Infinite Jump", "Speed", "Noclip Speed"},
    ["VISUAL"] = {"ESP", "Chams", "Fullbright", "X-Ray"},
    ["UTILITY"] = {"Auto Farm", "Auto Sell", "Auto Buy", "Anti AFK"},
    ["SETTINGS"] = {"Keybind", "Theme", "Save Config", "Load Config"}
}

for i, tabName in ipairs({"COMBAT", "MOVEMENT", "VISUAL", "UTILITY", "SETTINGS"}) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 60, 1, 0)
    tabBtn.Position = UDim2.new(0, (i-1)*65, 0, 0)
    tabBtn.Text = tabName
    tabBtn.Font = Enum.Font.GothamMedium
    tabBtn.TextSize = 11
    tabBtn.TextColor3 = COLORS.TEXT
    tabBtn.BackgroundColor3 = COLORS.LIGHT_BG
    tabBtn.AutoButtonColor = false
    tabBtn.Parent = tabsFrame
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tabBtn
    
    local pageFrame = Instance.new("ScrollingFrame")
    pageFrame.Size = UDim2.new(1, -40, 1, -140)
    pageFrame.Position = UDim2.new(0, 20, 0, 130)
    pageFrame.BackgroundTransparency = 1
    pageFrame.ScrollBarThickness = 4
    pageFrame.Visible = i == 1
    pageFrame.Parent = menuFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = pageFrame
    
    pages[tabName] = pageFrame
    tabs[tabName] = tabBtn
    
    -- Thêm các nút vào page
    local yPos = 0
    for _, btnName in ipairs(tabContents[tabName]) do
        local btn = createModernButton(pageFrame, btnName, UDim2.new(0, 0, 0, yPos))
        yPos = yPos + 55
    end
end

-- ============== FLY SYSTEM (NÂNG CAO) ==============
local flyEnabled = false
local flySpeed = 50
local flyConnection
local flyKeys = {
    [Enum.KeyCode.W] = false,
    [Enum.KeyCode.A] = false,
    [Enum.KeyCode.S] = false,
    [Enum.KeyCode.D] = false,
    [Enum.KeyCode.Space] = false,
    [Enum.KeyCode.LeftShift] = false
}

local function toggleFly()
    if not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart then return end
    
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        humanoid.PlatformStand = true
        
        -- Tạo các BodyMover
        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.P = 10000
        bg.D = 500
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.CFrame = rootPart.CFrame
        bg.Parent = rootPart
        
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = rootPart
        
        flyConnection = RunService.RenderStepped:Connect(function(dt)
            if not flyEnabled or not player.Character then
                flyConnection:Disconnect()
                return
            end
            
            local velocity = Vector3.new(0, 0, 0)
            
            if flyKeys[Enum.KeyCode.W] then
                velocity = velocity + Workspace.CurrentCamera.CFrame.LookVector
            end
            if flyKeys[Enum.KeyCode.S] then
                velocity = velocity - Workspace.CurrentCamera.CFrame.LookVector
            end
            if flyKeys[Enum.KeyCode.A] then
                velocity = velocity - Workspace.CurrentCamera.CFrame.RightVector
            end
            if flyKeys[Enum.KeyCode.D] then
                velocity = velocity + Workspace.CurrentCamera.CFrame.RightVector
            end
            if flyKeys[Enum.KeyCode.Space] then
                velocity = velocity + Vector3.new(0, 1, 0)
            end
            if flyKeys[Enum.KeyCode.LeftShift] then
                velocity = velocity - Vector3.new(0, 1, 0)
            end
            
            if velocity.Magnitude > 0 then
                velocity = velocity.Unit * flySpeed
            end
            
            bv.Velocity = velocity
            bg.CFrame = Workspace.CurrentCamera.CFrame
        end)
        
        -- Kết nối input
        local inputBegan = UserInputService.InputBegan:Connect(function(input)
            if flyKeys[input.KeyCode] ~= nil then
                flyKeys[input.KeyCode] = true
            end
        end)
        
        local inputEnded = UserInputService.InputEnded:Connect(function(input)
            if flyKeys[input.KeyCode] ~= nil then
                flyKeys[input.KeyCode] = false
            end
        end)
        
        -- Thông báo
        game.StarterGui:SetCore("SendNotification", {
            Title = "FLY ENABLED",
            Text = "Press W/A/S/D/Space/Shift to fly",
            Duration = 3,
            Icon = "rbxassetid://6724771532"
        })
        
    else
        if flyConnection then
            flyConnection:Disconnect()
        end
        
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid then
                humanoid.PlatformStand = false
            end
            
            if rootPart then
                local bg = rootPart:FindFirstChild("FlyGyro")
                local bv = rootPart:FindFirstChild("FlyVelocity")
                
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
            end
        end
    end
    
    return flyEnabled
end

-- ============== NO CLIP SYSTEM (NÂNG CAO) ==============
local noclipEnabled = false
local noclipConnection

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        noclipConnection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "NO CLIP ENABLED",
            Text = "You can now walk through walls",
            Duration = 3,
            Icon = "rbxassetid://6724771532"
        })
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        
        if player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
    
    return noclipEnabled
end

-- ============== INFINITE JUMP (NÂNG CAO) ==============
local infiniteJumpEnabled = false
local jumpConnection

local function toggleInfiniteJump()
    infiniteJumpEnabled = not infiniteJumpEnabled
    
    if infiniteJumpEnabled then
        local character = player.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and 
               humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "INFINITE JUMP ENABLED",
            Text = "Hold Space to jump infinitely",
            Duration = 3,
            Icon = "rbxassetid://6724771532"
        })
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
    
    return infiniteJumpEnabled
end

-- ============== KẾT NỐI NÚT ==============
local flyBtn = pages["MOVEMENT"]:FindFirstChild("Fly")
local noclipBtn = pages["MOVEMENT"]:FindFirstChild("NoClip")
local infiniteJumpBtn = pages["MOVEMENT"]:FindFirstChild("Infinite Jump")

if flyBtn then
    flyBtn.MouseButton1Click:Connect(function()
        local success = pcall(toggleFly)
        if success then
            flyBtn.Text = flyEnabled and "Fly: ON" or "Fly: OFF"
        end
    end)
end

if noclipBtn then
    noclipBtn.MouseButton1Click:Connect(function()
        local success = pcall(toggleNoclip)
        if success then
            noclipBtn.Text = noclipEnabled and "NoClip: ON" or "NoClip: OFF"
        end
    end)
end

if infiniteJumpBtn then
    infiniteJumpBtn.MouseButton1Click:Connect(function()
        local success = pcall(toggleInfiniteJump)
        if success then
            infiniteJumpBtn.Text = infiniteJumpEnabled and "Inf Jump: ON" or "Inf Jump: OFF"
        end
    end)
end

-- ============== KEY SYSTEM EVENTS ==============
submitBtn.MouseButton1Click:Connect(function()
    local key = string.upper(string.gsub(keyInput.Text, "%s+", ""))
    
    if checkKey(key) then
        saveKey(key)
        statusLabel.Text = "✅ KEY ACTIVATED! Loading premium features..."
        statusLabel.TextColor3 = COLORS.SUCCESS
        
        wait(1)
        keyFrame.Visible = false
        menuFrame.Visible = true
        menuIcon.Visible = true
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "DUNG SKY HUB",
            Text = "Welcome to Premium Edition!",
            Duration = 5,
            Icon = "rbxassetid://6724771532"
        })
    else
        statusLabel.Text = "❌ INVALID KEY! Please try again"
        statusLabel.TextColor3 = COLORS.ERROR
    end
end)

-- Auto login với key đã lưu
if hasValidKey() then
    keyFrame.Visible = false
    menuFrame.Visible = true
    menuIcon.Visible = true
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "DUNG SKY HUB",
        Text = "Welcome back, "..player.Name.."!",
        Duration = 5,
        Icon = "rbxassetid://6724771532"
    })
end

-- ============== MENU TOGGLE ==============
menuIcon.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
    
    if menuFrame.Visible then
        menuFrame.Size = UDim2.new(0, 350, 0, 0)
        TweenService:Create(menuFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 350, 0, 500)
        }):Play()
    end
end)

-- ============== TAB SWITCHING ==============
for tabName, tabBtn in pairs(tabs) do
    tabBtn.MouseButton1Click:Connect(function()
        -- Reset tất cả tab
        for name, page in pairs(pages) do
            page.Visible = false
            TweenService:Create(tabs[name], TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.LIGHT_BG,
                TextColor3 = COLORS.TEXT
            }):Play()
        end
        
        -- Kích hoạt tab được chọn
        pages[tabName].Visible = true
        TweenService:Create(tabBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = COLORS.PRIMARY,
            TextColor3 = Color3.new(1, 1, 1)
        }):Play()
    end)
end

-- ============== DRAGGABLE MENU ==============
local dragging = false
local dragStart, startPos

menuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = menuFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        menuFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ============== CHARACTER PROTECTION ==============
player.CharacterAdded:Connect(function(character)
    wait(1) -- Đợi character load
    
    -- Tự động bật lại noclip nếu đang bật
    if noclipEnabled then
        task.wait(0.5)
        toggleNoclip()
    end
    
    -- Tự động bật lại fly nếu đang bật
    if flyEnabled then
        task.wait(0.5)
        toggleFly()
    end
end)

-- ============== AUTO-CLOSE NO CLIP KHI CHẾT ==============
player.CharacterRemoving:Connect(function()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
end)

-- ============== SPEED CONTROL ==============
local speedBtn = pages["MOVEMENT"]:FindFirstChild("Speed")
if speedBtn then
    local speedEnabled = false
    local speedValue = 16
    
    speedBtn.MouseButton1Click:Connect(function()
        speedEnabled = not speedEnabled
        
        if speedEnabled and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speedValue
            end
            speedBtn.Text = "Speed: "..speedValue
        else
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
            speedBtn.Text = "Speed: OFF"
        end
    end)
end

print("Dung Sky Hub Premium loaded successfully!")