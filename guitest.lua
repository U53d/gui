--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 
]]--

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Constants
local correctKey = "SkyHubOnTop"  -- ถอดรหัสจาก v7("\129\197\216\118\226\237\159\71...", "...")
local titleText = "Key"         -- ถอดรหัสจาก v7("\8\200\51\133\222\54\212", "...")
local discordInvite = "สามารถซื้อKeyได้ที่ Discord! .gg/dc3Ug2x84C"
local fontName = "Gotham"      -- ถอดรหัสจาก v7("\18\165\76\18\179\45\71...", "...")
local scriptUrl = "https://raw.githubusercontent.com/SkyHax2/SkyHub/main/SkyHub.lua"  -- ถอดรหัสจาก v7("\88\2\54\2\237\10...", "...")
local mainScript = loadstring(game:HttpGet(scriptUrl, true))

-- Create GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textBox = Instance.new("TextBox")
local uiCorner1 = Instance.new("UICorner")
local uiCorner2 = Instance.new("UICorner")
local titleLabel = Instance.new("TextLabel")
local discordLabel = Instance.new("TextLabel")

-- Setup ScreenGui
screenGui.Name = "SkyHubKeySys"
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Setup Frame
frame.Name = "Main"
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)  -- RGB(17+32, 134-85, 191-142)
frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.37667945, 0, 0.385529906, 0)
frame.Size = UDim2.new(0, 324, 0, 133)
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 1

-- Setup TextBox
textBox.Name = "Input"
textBox.Parent = frame
textBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)  -- RGB(230-155, 22+53, 75)
textBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
textBox.BorderSizePixel = 0
textBox.Position = UDim2.new(0.191307724, 0, 0.651018858, 0)
textBox.Size = UDim2.new(0, 200, 0, 38)
textBox.Font = Enum.Font[fontName]
textBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)  -- RGB(208+47, 509-163-91, 2185-1869-61)
textBox.PlaceholderText = "Enter your key here"
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextSize = 14
textBox.TextStrokeTransparency = 0
textBox.TextWrapped = true
textBox.BackgroundTransparency = 1

-- Setup UICorners
uiCorner1.CornerRadius = UDim.new(0, 22)
uiCorner1.Parent = textBox
uiCorner2.CornerRadius = UDim.new(0, 22)
uiCorner2.Parent = frame

-- Setup Title Label
titleLabel.Name = "Title"
titleLabel.Parent = frame
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 0
titleLabel.Position = UDim2.new(0, 0, 0.05511811, 0)
titleLabel.Size = UDim2.new(0, 324, 0, 27)
titleLabel.Font = Enum.Font[fontName]
titleLabel.Text = titleText
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.TextSize = 14
titleLabel.TextStrokeTransparency = 0
titleLabel.TextWrapped = true
titleLabel.TextTransparency = 1

-- Setup Discord Label
discordLabel.Name = "Discord"
discordLabel.Parent = frame
discordLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
discordLabel.BackgroundTransparency = 1
discordLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
discordLabel.BorderSizePixel = 0
discordLabel.Position = UDim2.new(0, 0, 0.352554679, 0)
discordLabel.Size = UDim2.new(0, 324, 0, 27)
discordLabel.Font = Enum.Font[fontName]
discordLabel.Text = discordInvite
discordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
discordLabel.TextScaled = true
discordLabel.TextSize = 14
discordLabel.TextStrokeTransparency = 0
discordLabel.TextWrapped = true
discordLabel.TextTransparency = 1

-- Tween Animations
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local frameTween = TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0})
local titleTween = TweenService:Create(titleLabel, tweenInfo, {TextTransparency = 0})
local discordTween = TweenService:Create(discordLabel, tweenInfo, {TextTransparency = 0})
local textBoxTween = TweenService:Create(textBox, tweenInfo, {BackgroundTransparency = 0.75})

frameTween:Play()
titleTween:Play()
discordTween:Play()
textBoxTween:Play()

-- Key Check Function
local function checkKey()
    local fadeInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local feedbackTween

    if textBox.Text == correctKey then
        print("Correct Key!")  -- ถอดรหัสจาก v7("\36\225\183\220...", "...")
        feedbackTween = TweenService:Create(textBox, fadeInfo, {BackgroundColor3 = Color3.new(0, 1, 0)})
        feedbackTween:Play()
        feedbackTween.Completed:Connect(function()
            textBox.BorderColor3 = Color3.new(0, 0, 0)
        end)
        wait(1)
        mainScript()  -- Run the main script

        local exitInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local exitFrame = TweenService:Create(frame, exitInfo, {BackgroundTransparency = 1})
        local exitTitle = TweenService:Create(titleLabel, exitInfo, {TextTransparency = 1})
        local exitDiscord = TweenService:Create(discordLabel, exitInfo, {TextTransparency = 1})
        local exitTextBox = TweenService:Create(textBox, exitInfo, {BackgroundTransparency = 1})

        exitFrame:Play()
        exitTitle:Play()
        exitDiscord:Play()
        exitTextBox:Play()
        exitFrame.Completed:Connect(function()
            screenGui:Destroy()
        end)
    else
        print("Wrong Key!")  -- ถอดรหัสจาก v7("\15\28\141\200...", "...")
        feedbackTween = TweenService:Create(textBox, fadeInfo, {BackgroundColor3 = Color3.new(1, 0, 0)})
        feedbackTween:Play()
        feedbackTween.Completed:Connect(function()
            textBox.BorderColor3 = Color3.new(0, 0, 0)
        end)
        wait(1)
    end
end

-- Connect FocusLost Event
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkKey()
    end
end)