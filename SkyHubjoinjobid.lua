-- Script Join Game bằng Job ID
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JoinJobIDGui"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 999
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 1000
TitleBar.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "🎮 JOIN GAME BY JOB ID ( SKY HUB )"
Title.Size = UDim2.new(1, -30, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 1001
Title.Parent = TitleBar

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.ZIndex = 1001
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Input Label
local InputLabel = Instance.new("TextLabel")
InputLabel.Text = "Nhập Job ID:"
InputLabel.Size = UDim2.new(1, -20, 0, 20)
InputLabel.Position = UDim2.new(0, 10, 0, 40)
InputLabel.BackgroundTransparency = 1
InputLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
InputLabel.Font = Enum.Font.Gotham
InputLabel.TextSize = 12
InputLabel.ZIndex = 1000
InputLabel.Parent = MainFrame

-- Job ID Input
local JobIdBox = Instance.new("TextBox")
JobIdBox.Size = UDim2.new(0.9, 0, 0, 35)
JobIdBox.Position = UDim2.new(0.05, 0, 0, 65)
JobIdBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
JobIdBox.BorderSizePixel = 0
JobIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
JobIdBox.Font = Enum.Font.Gotham
JobIdBox.PlaceholderText = "VD: abcdefghij12345678"
JobIdBox.Text = ""
JobIdBox.TextSize = 14
JobIdBox.ZIndex = 1000
JobIdBox.Parent = MainFrame

-- Join Button
local JoinButton = Instance.new("TextButton")
JoinButton.Text = "🚀 JOIN SERVER"
JoinButton.Size = UDim2.new(0.8, 0, 0, 35)
JoinButton.Position = UDim2.new(0.1, 0, 0, 110)
JoinButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
JoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinButton.Font = Enum.Font.GothamBold
JoinButton.TextSize = 12
JoinButton.ZIndex = 1000
JoinButton.Parent = MainFrame

-- Status text
local StatusText = Instance.new("TextLabel")
StatusText.Text = "🟢 Sẵn sàng join server"
StatusText.Size = UDim2.new(1, -20, 0, 20)
StatusText.Position = UDim2.new(0, 10, 0, 155)
StatusText.BackgroundTransparency = 1
StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 11
StatusText.ZIndex = 1000
StatusText.Parent = MainFrame

-- Chức năng di chuyển GUI
local dragging = false
local dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Hàm join game bằng Job ID
JoinButton.MouseButton1Click:Connect(function()
    local jobId = JobIdBox.Text:gsub("%s+", "") -- Xóa khoảng trắng
    
    if jobId == "" then
        StatusText.Text = "❌ Vui lòng nhập Job ID"
        StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
        return
    end
    
    -- Kiểm tra xem Job ID có hợp lệ không
    if not jobId:match("^%w+$") or #jobId < 10 then
        StatusText.Text = "❌ Job ID không hợp lệ"
        StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
        return
    end
    
    JoinButton.Text = "⏳ Đang kết nối..."
    StatusText.Text = "🔄 Đang thử join server..."
    
    -- Thử join server
    local success, error = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, Players.LocalPlayer)
    end)
    
    if not success then
        JoinButton.Text = "🚀 JOIN SERVER"
        StatusText.Text = "❌ Lỗi: " .. tostring(error)
        StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
    else
        StatusText.Text = "✅ Đang chuyển đến server..."
        StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
    end
end)

-- Hàm copy Job ID hiện tại
local CopyButton = Instance.new("TextButton")
CopyButton.Text = "📋 COPY JOB ID"
CopyButton.Size = UDim2.new(0.4, 0, 0, 25)
CopyButton.Position = UDim2.new(0.55, 0, 0, 110)
CopyButton.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.Gotham
CopyButton.TextSize = 10
CopyButton.ZIndex = 1000
CopyButton.Parent = MainFrame

CopyButton.MouseButton1Click:Connect(function()
    local jobId = game.JobId
    if jobId and jobId ~= "" then
        setclipboard(jobId)
        StatusText.Text = "✅ Đã copy Job ID: " .. jobId
        StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
    else
        StatusText.Text = "❌ Không thể lấy Job ID"
        StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

print("🎮 Join by Job ID GUI đã sẵn sàng!")
print("📋 Sử dụng để join server bằng Job ID")