local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--[[ KEY SYSTEM ]]
local KeySystem = {
    Enabled = true,
    Key = "SKYHUB",
    Whitelisted = {}
}

-- Notification function
local function createNotification(title, message, color)
    local notifyGui = Instance.new("ScreenGui")
    notifyGui.Name = "Notification"
    notifyGui.Parent = playerGui
    notifyGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 150)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.Parent = notifyGui

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = color or Color3.fromRGB(0, 255, 128)
    stroke.Thickness = 2

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 40)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextColor3 = color or Color3.fromRGB(0, 255, 128)
    titleLabel.Parent = mainFrame

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 0, 60)
    messageLabel.Position = UDim2.new(0, 10, 0, 50)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextWrapped = true
    messageLabel.Parent = mainFrame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0.6, 0, 0, 30)
    closeBtn.Position = UDim2.new(0.2, 0, 0, 110)
    closeBtn.Text = "ĐÓNG"
    closeBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
    closeBtn.Parent = mainFrame

    closeBtn.MouseButton1Click:Connect(function()
        notifyGui:Destroy()
    end)

    delay(5, function()
        if notifyGui and notifyGui.Parent then
            notifyGui:Destroy()
        end
    end)
end

-- Create Key GUI
local function createKeySystemGUI()
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "KeySystemGUI"
    keyGui.Parent = playerGui
    keyGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    mainFrame.Parent = keyGui

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(0, 255, 128)
    stroke.Thickness = 2

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 40)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🔑 SKYHUB KEY SYSTEM"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(0, 255, 128)
    title.Parent = mainFrame

    -- Input Box
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(1, -40, 0, 40)
    inputBox.Position = UDim2.new(0, 20, 0, 70)
    inputBox.PlaceholderText = "Nhập key tại đây..."
    inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    inputBox.Parent = mainFrame

    -- Submit Button
    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(1, -40, 0, 40)
    submitBtn.Position = UDim2.new(0, 20, 0, 130)
    submitBtn.Text = "XÁC NHẬN"
    submitBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 50)
    submitBtn.Parent = mainFrame

    submitBtn.MouseButton1Click:Connect(function()
        if inputBox.Text == KeySystem.Key then
            KeySystem.Whitelisted[player.UserId] = true
            keyGui.Enabled = false
            createNotification("THÀNH CÔNG", "Chào mừng "..player.Name, Color3.fromRGB(0, 255, 128))
            screenGui.Enabled = true
        else
            createNotification("THẤT BẠI", "Key không chính xác", Color3.fromRGB(255, 50, 50))
        end
    end)
end

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkyHubMain"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.Enabled = false

-- Icon Button
local iconButton = Instance.new("TextButton")
iconButton.Name = "MenuIcon"
iconButton.Size = UDim2.new(0, 50, 0, 50)
iconButton.Position = UDim2.new(0, 20, 0, 20)
iconButton.Text = "⚡"
iconButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
iconButton.TextColor3 = Color3.fromRGB(0, 255, 128)
iconButton.Parent = screenGui

local iconCorner = Instance.new("UICorner", iconButton)
iconCorner.CornerRadius = UDim.new(0, 12)

local iconStroke = Instance.new("UIStroke", iconButton)
iconStroke.Color = Color3.fromRGB(0, 255, 128)
iconStroke.Thickness = 2

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.Visible = false
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0, 255, 128)
mainStroke.Thickness = 2

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 24
closeButton.TextColor3 = Color3.fromRGB(255, 80, 80)
closeButton.BackgroundTransparency = 1
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Dragging functionality
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

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 0, 40)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ SKY HUB ⚡"
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 22
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
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

-- Tab Pages
local pages = Instance.new("Frame")
pages.Name = "Pages"
pages.Size = UDim2.new(1, -20, 1, -110)
pages.Position = UDim2.new(0, 10, 0, 110)
pages.BackgroundTransparency = 1
pages.Parent = mainFrame

-- Tab Creation Function
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
    scrollFrame.Parent = pages
    
    local listLayout = Instance.new("UIListLayout", scrollFrame)
    listLayout.Padding = UDim.new(0, 10)
    
    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)
    end)

    return button, scrollFrame
end

-- Create Tabs
local mainTabButton, MainTab = createTab("Main")
local settingsTabButton, SettingsTab = createTab("Settings")
local modTabButton, ModTab = createTab("Mod")

-- Standard Button Function
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
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
    end)
    
    -- Click effects
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)
    
    return button
end

-- Add buttons to tabs
local spinBtn = createStandardButton(MainTab, "Bắt đầu quay", 10)
local autoClickButton = createStandardButton(MainTab, "Tự Động Đánh: OFF", 60)
local aimbotButton = createStandardButton(MainTab, "Aimbot: OFF", 110)

local afkButton = createStandardButton(SettingsTab, "Bật AFK", 10)
local fixLagButton = createStandardButton(SettingsTab, "Fix Lag: OFF", 60)
local espButton = createStandardButton(SettingsTab, "ESP: OFF", 110)
local hideNamesButton = createStandardButton(SettingsTab, "Ẩn tên: OFF", 160)
local infoButton = createStandardButton(SettingsTab, "Thông Tin Server", 210)

local noClipButton = createStandardButton(ModTab, "NoClip: OFF", 10)
local infJumpButton = createStandardButton(ModTab, "Nhảy vô hạn: OFF", 60)
local hitboxButton = createStandardButton(ModTab, "Hitbox: OFF", 110)

-- Tab Switching
local function switchTab(tabToShow)
    MainTab.Visible = false
    SettingsTab.Visible = false
    ModTab.Visible = false
    
    tabToShow.Visible = true
    
    mainTabButton.BackgroundColor3 = tabToShow == MainTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
    settingsTabButton.BackgroundColor3 = tabToShow == SettingsTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
    modTabButton.BackgroundColor3 = tabToShow == ModTab and Color3.fromRGB(0, 100, 50) or Color3.fromRGB(20, 20, 20)
end

-- Connect tab buttons
mainTabButton.MouseButton1Click:Connect(function() switchTab(MainTab) end)
settingsTabButton.MouseButton1Click:Connect(function() switchTab(SettingsTab) end)
modTabButton.MouseButton1Click:Connect(function() switchTab(ModTab) end)

-- Default tab
MainTab.Visible = true
mainTabButton.BackgroundColor3 = Color3.fromRGB(0, 100, 50)

-- Toggle Menu
iconButton.MouseButton1Click:Connect(function()
    if KeySystem.Enabled and not KeySystem.Whitelisted[player.UserId] then
        if playerGui:FindFirstChild("KeySystemGUI") then
            playerGui.KeySystemGUI.Enabled = true
        else
            createKeySystemGUI()
        end
        return
    end
    
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        mainFrame.Size = UDim2.new(0, 300, 0, 0)
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 300, 0, 200)
        }):Play()
    end
end)

-- Initialize
if KeySystem.Enabled then
    createKeySystemGUI()
else
    screenGui.Enabled = true
end

-- Starter notification
delay(1, function()
    createNotification("SKYHUB", "Nhấn ⚡ để mở menu", Color3.fromRGB(0, 200, 255))
end)

--[[ FEATURE IMPLEMENTATIONS ]]

-- Spin Feature
local isSpinning = false
local bav = Instance.new("BodyAngularVelocity")
bav.AngularVelocity = Vector3.new(0, 150, 0)
bav.MaxTorque = Vector3.new(0, math.huge, 0)
bav.P = 1000
bav.Name = "Spinner"

local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    while not char:FindFirstChild("HumanoidRootPart") do
        char = player.Character or player.CharacterAdded:Wait()
    end
    return char
end

local character = getCharacter()
local hrp = character:WaitForChild("HumanoidRootPart")

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

-- Auto Click Feature
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

-- Aimbot Feature
local isAimbotOn = false
local camera = workspace.CurrentCamera
local aimConnection = nil

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

-- AFK Feature
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

-- Fix Lag Feature
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

-- ESP Feature
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

-- Hide Names Feature
local hideNames = false
local nameTags = {}

local function toggleNameVisibility(player, hide)
    if not player.Character then return end
    
    for _, child in ipairs(player.Character:GetDescendants()) do
        if child:IsA("BillboardGui") and (child.Name == "NameTag" or child.Name == "Nametag" or child:FindFirstChildOfClass("TextLabel")) then
            if hide then
                nameTags[child] = child.Enabled
                child.Enabled = false
            else
                if nameTags[child] ~= nil then
                    child.Enabled = nameTags[child]
                else
                    child.Enabled = true
                end
            end
        end
    end
    
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

Players.PlayerAdded:Connect(function(player)
    if hideNames then
        player.CharacterAdded:Connect(function(character)
            if hideNames then
                toggleNameVisibility(player, true)
            end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    for k, v in pairs(nameTags) do
        if not k:IsDescendantOf(game) then
            nameTags[k] = nil
        end
    end
end)

-- NoClip Feature
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
                    originalCollisions[part] = {
                        CanCollide = part.CanCollide,
                        Massless = part.Massless
                    }
                    part.CanCollide = false
                    part.Massless = true
                else
                    if originalCollisions[part] then
                        part.CanCollide = originalCollisions[part].CanCollide
                        part.Massless = originalCollisions[part].Massless
                        originalCollisions[part] = nil
                    else
                        part.CanCollide = true
                        part.Massless = false
                    end
                end
            end
        end
    end

    if isNoClip then
        if player.Character then
            setNoClipState(player.Character, true)
        end
        
        noClipConnection = player.CharacterAdded:Connect(function(char)
            wait(0.5)
            if isNoClip then
                setNoClipState(char, true)
            end
        end)
    else
        if noClipConnection then
            noClipConnection:Disconnect()
            noClipConnection = nil
        end
        
        if player.Character then
            setNoClipState(player.Character, false)
        end
    end
end)

-- Infinite Jump Feature
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

-- Hitbox Feature
local hitboxEnabled = false

local function expandHitboxes()
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = target.Character.HumanoidRootPart
            hrp.Size = Vector3.new(20, 20, 20)
            hrp.Transparency = 0.7
            hrp.Material = Enum.Material.Neon
            hrp.Color = Color3.fromRGB(255, 0, 0)
            hrp.CanCollide = false
        end
    end
end

RunService.RenderStepped:Connect(function()
    if hitboxEnabled then
        pcall(expandHitboxes)
    end
end)

hitboxButton.MouseButton1Click:Connect(function()
    hitboxEnabled = not hitboxEnabled
    hitboxButton.Text = "Hitbox: " .. (hitboxEnabled and "ON" or "OFF")
end)

-- Server Info Feature
local infoGui = Instance.new("Frame")
infoGui.Size = UDim2.new(0, 260, 0, 130)
infoGui.Position = UDim2.new(0.5, -130, 0.5, -65)
infoGui.AnchorPoint = Vector2.new(0.5, 0.5)
infoGui.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
infoGui.Visible = false
infoGui.Parent = screenGui

local infoCorner = Instance.new("UICorner", infoGui)
infoCorner.CornerRadius = UDim.new(0, 10)

local infoStroke = Instance.new("UIStroke", infoGui)
infoStroke.Color = Color3.fromRGB(0, 255, 128)
infoStroke.Thickness = 2

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -20, 1, -20)
infoText.Position = UDim2.new(0, 10, 0, 10)
infoText.BackgroundTransparency = 1
infoText.TextColor3 = Color3.new(1, 1, 1)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 14
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextWrapped = true
infoText.Text = "Đang tải thông tin..."
infoText.Parent = infoGui

local infoCloseButton = Instance.new("TextButton")
infoCloseButton.Name = "CloseButton"
infoCloseButton.Size = UDim2.new(0, 30, 0, 30)
infoCloseButton.Position = UDim2.new(1, -35, 0, 5)
infoCloseButton.Text = "×"
infoCloseButton.Font = Enum.Font.GothamBold
infoCloseButton.TextSize = 24
infoCloseButton.TextColor3 = Color3.fromRGB(255, 80, 80)
infoCloseButton.BackgroundTransparency = 1
infoCloseButton.Parent = infoGui

infoCloseButton.MouseButton1Click:Connect(function()
    infoGui.Visible = false
end)

local startTime = tick()

task.spawn(function()
    while true do
        local playerCount = #Players:GetPlayers()
        local vipServer = game.VIPServerId ~= "" and game.VIPServerOwnerId ~= 0
        local elapsed = math.floor(tick() - startTime)
        local minutes = math.floor(elapsed / 60)
        local seconds = elapsed % 60
        local version = game.JobId or "Không rõ"

        infoText.Text = string.format([[
👥 Người chơi: %d
🕒 Server đã chạy: %d phút %02d giây
🛡️ Loại server: %s
🧩 Server JobId: %s
]], playerCount, minutes, seconds, vipServer and "VIP" or "Thường", version)

        wait(1)
    end
end)

infoButton.MouseButton1Click:Connect(function()
    infoGui.Visible = not infoGui.Visible
end)

-- Final initialization
createNotification("SKYHUB", "Script đã sẵn sàng!", Color3.fromRGB(0, 255, 128))