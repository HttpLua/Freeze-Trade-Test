local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ⚙️ Clean up existing GUIs
if PlayerGui:FindFirstChild("GardenLoadingUI") then
	PlayerGui:FindFirstChild("GardenLoadingUI"):Destroy()
end
if PlayerGui:FindFirstChild("FreezeTradeUI") then
	PlayerGui:FindFirstChild("FreezeTradeUI"):Destroy()
end

-- 🌿 LOADING UI START
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "GardenLoadingUI"
loadingGui.Parent = PlayerGui
loadingGui.IgnoreGuiInset = true
loadingGui.ResetOnSpawn = false

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 300, 0, 140)
loadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
loadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui
Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 14)

-- Top Bar (styled like Freeze Trade)
local topBar = Instance.new("Frame", loadingFrame)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", topBar)
title.Text = "🌿 Grow a Garden Loading..."
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

-- Loading Bar
local barBackground = Instance.new("Frame", loadingFrame)
barBackground.Size = UDim2.new(0.9, 0, 0, 16)
barBackground.Position = UDim2.new(0.05, 0, 0.6, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 8)

local progressBar = Instance.new("Frame", barBackground)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 8)

local countdownLabel = Instance.new("TextLabel", loadingFrame)
countdownLabel.Size = UDim2.new(1, 0, 0, 20)
countdownLabel.Position = UDim2.new(0, 0, 0.8, 0)
countdownLabel.BackgroundTransparency = 1
countdownLabel.Text = "Loading... 20"
countdownLabel.Font = Enum.Font.Gotham
countdownLabel.TextSize = 14
countdownLabel.TextColor3 = Color3.fromRGB(60, 100, 60)

local tween = TweenService:Create(progressBar, TweenInfo.new(20, Enum.EasingStyle.Linear), {
	Size = UDim2.new(1, 0, 1, 0)
})
tween:Play()

-- ⏳ Countdown logic
task.spawn(function()
	for i = 20, 1, -1 do
		countdownLabel.Text = "Loading... " .. i
		wait(1)
	end
	loadingGui:Destroy()

	-- ✅ After loading, show Freeze Trade UI
	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "FreezeTradeUI"
	gui.ResetOnSpawn = false

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 210, 0, 230)
	main.Position = UDim2.new(0.5, -105, 0.5, -115)
	main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

	local topBar = Instance.new("Frame", main)
	topBar.Size = UDim2.new(1, 0, 0, 30)
	topBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
	Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)

	local title = Instance.new("TextLabel", topBar)
	title.Text = "Grow A Garden Freeze Trade"
	title.Size = UDim2.new(1, -40, 1, 0)
	title.Position = UDim2.new(0, 10, 0, 0)
	title.BackgroundTransparency = 1
	title.TextColor3 = Color3.new(1, 1, 1)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 12
	title.TextXAlignment = Enum.TextXAlignment.Left

	local closeBtn = Instance.new("TextButton", topBar)
	closeBtn.Text = "X"
	closeBtn.Size = UDim2.new(0, 30, 1, 0)
	closeBtn.Position = UDim2.new(1, -30, 0, 0)
	closeBtn.BackgroundTransparency = 1
	closeBtn.TextColor3 = Color3.new(1, 1, 1)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 14
	closeBtn.MouseButton1Click:Connect(function()
		main.Visible = false
	end)

	-- 🟩 Title text (black) and hint (black, small)
	local sectionLabel = Instance.new("TextLabel", main)
	sectionLabel.Text = "Find Player to Freeze Trade"
	sectionLabel.Size = UDim2.new(1, -20, 0, 20)
	sectionLabel.Position = UDim2.new(0, 10, 0, 35)
	sectionLabel.BackgroundTransparency = 1
	sectionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	sectionLabel.Font = Enum.Font.GothamBold
	sectionLabel.TextSize = 12
	sectionLabel.TextXAlignment = Enum.TextXAlignment.Left

	local hintLabel = Instance.new("TextLabel", main)
	hintLabel.Text = "Enter username to start Freeze Trade"
	hintLabel.Size = UDim2.new(1, -20, 0, 16)
	hintLabel.Position = UDim2.new(0, 10, 0, 53)
	hintLabel.BackgroundTransparency = 1
	hintLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	hintLabel.Font = Enum.Font.Gotham
	hintLabel.TextSize = 10
	hintLabel.TextXAlignment = Enum.TextXAlignment.Left

	local usernameBox = Instance.new("TextBox", main)
	usernameBox.Text = "Enter Username"
	usernameBox.ClearTextOnFocus = true
	usernameBox.Size = UDim2.new(0.6, 0, 0, 25)
	usernameBox.Position = UDim2.new(0.05, 0, 0, 75)
	usernameBox.Font = Enum.Font.Gotham
	usernameBox.TextSize = 12
	usernameBox.TextColor3 = Color3.new(0, 0, 0)
	usernameBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	Instance.new("UICorner", usernameBox).CornerRadius = UDim.new(0, 6)

	local searchBtn = Instance.new("TextButton", main)
	searchBtn.Text = "Search"
	searchBtn.Size = UDim2.new(0.3, 0, 0, 25)
	searchBtn.Position = UDim2.new(0.65, 0, 0, 75)
	searchBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
	searchBtn.TextColor3 = Color3.new(1, 1, 1)
	searchBtn.Font = Enum.Font.GothamBold
	searchBtn.TextSize = 12
	Instance.new("UICorner", searchBtn).CornerRadius = UDim.new(0, 6)

	local userFrame = Instance.new("Frame", main)
	userFrame.Size = UDim2.new(0.9, 0, 0, 45)
	userFrame.Position = UDim2.new(0.05, 0, 0, 110)
	userFrame.BackgroundColor3 = Color3.fromRGB(255, 230, 240)
	Instance.new("UICorner", userFrame).CornerRadius = UDim.new(0, 8)
	userFrame.Visible = false

	local avatarImage = Instance.new("ImageLabel", userFrame)
	avatarImage.Size = UDim2.new(0, 36, 0, 36)
	avatarImage.Position = UDim2.new(0, 5, 0.5, -18)
	avatarImage.BackgroundTransparency = 1

	local displayName = Instance.new("TextLabel", userFrame)
	displayName.Text = ""
	displayName.Size = UDim2.new(1, -45, 1, 0)
	displayName.Position = UDim2.new(0, 45, 0, 0)
	displayName.BackgroundTransparency = 1
	displayName.TextColor3 = Color3.fromRGB(100, 0, 50)
	displayName.Font = Enum.Font.GothamBold
	displayName.TextSize = 12
	displayName.TextXAlignment = Enum.TextXAlignment.Left

	local freezeBtn = Instance.new("TextButton", main)
	freezeBtn.Text = "Freeze Trade OFF ❌"
	freezeBtn.Size = UDim2.new(0.9, 0, 0, 32)
	freezeBtn.Position = UDim2.new(0.05, 0, 1, -40)
	freezeBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
	freezeBtn.TextColor3 = Color3.new(1, 1, 1)
	freezeBtn.Font = Enum.Font.GothamBold
	freezeBtn.TextSize = 14
	Instance.new("UICorner", freezeBtn).CornerRadius = UDim.new(0, 10)

	-- 🔍 Search Logic + Avatar
	local foundPlayer = nil
	searchBtn.MouseButton1Click:Connect(function()
		local nameQuery = usernameBox.Text:lower()
		foundPlayer = nil
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr.Name:lower():sub(1, #nameQuery) == nameQuery then
				foundPlayer = plr
				break
			end
		end
		if foundPlayer then
			avatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..foundPlayer.UserId.."&width=420&height=420&format=png"
			displayName.Text = foundPlayer.Name
			userFrame.Visible = true
		else
			displayName.Text = "Not Found"
			userFrame.Visible = true
		end
	end)

	-- ❄️ Freeze Logic
	local isCooldown = false
	local isFrozen = false

	freezeBtn.MouseButton1Click:Connect(function()
		if isCooldown then return end
		if not foundPlayer then
			freezeBtn.Text = "❌ No Player"
			task.delay(1.5, function()
				if not isCooldown then
					freezeBtn.Text = isFrozen and "Freeze Trade ON ✅" or "Freeze Trade OFF ❌"
				end
			end)
			return
		end

		print("❄️ FREEZE sent to:", foundPlayer.Name)
		isCooldown = true

		for i = 10, 1, -1 do
			freezeBtn.Text = "✅ Freeze Trade in:(" .. i .. ")"
			task.wait(1)
		end

		isFrozen = not isFrozen
		freezeBtn.Text = isFrozen and "Freeze Trade ON ✅" or "Freeze Trade OFF ❌"
		isCooldown = false
	end)
end)
