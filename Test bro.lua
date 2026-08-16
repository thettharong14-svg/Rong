local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MyBoxGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local box = Instance.new("Frame")
box.Size = UDim2.new(0, 230, 0, 230)
box.Position = UDim2.new(0.5, -115, 0.5, -115)
box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
box.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = box

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "⚡ POWER GUI"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = box

local function makeButton(text, y)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 190, 0, 45)
	button.Position = UDim2.new(0, 20, 0, y)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.TextSize = 16
	button.Font = Enum.Font.GothamBold
	button.Text = text
	button.Parent = box

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 8)
	c.Parent = button

	return button
end

-- WalkSpeed
local speedButton = makeButton("WalkSpeed: OFF", 50)
local speedOn = false

speedButton.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	speedButton.Text = speedOn and "WalkSpeed: ON" or "WalkSpeed: OFF"

	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid.WalkSpeed = speedOn and 50 or 16
	end
end)

-- Infinite Jump
local jumpButton = makeButton("Infinite Jump: OFF", 105)
local infiniteJump = false

jumpButton.MouseButton1Click:Connect(function()
	infiniteJump = not infiniteJump
	jumpButton.Text = infiniteJump and "Infinite Jump: ON" or "Infinite Jump: OFF"
end)

UserInputService.JumpRequest:Connect(function()
	if infiniteJump then
		local character = player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- Phantom Safe
local phantomButton = makeButton("Phantom Safe: OFF", 160)
local phantomSafe = false

phantomButton.MouseButton1Click:Connect(function()
	phantomSafe = not phantomSafe
	phantomButton.Text = phantomSafe and "Phantom Safe: ON" or "Phantom Safe: OFF"

	-- Put your Phantom-safe game logic here.
	-- This toggle is ready for you to connect to your own mechanic.
end)
