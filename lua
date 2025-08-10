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
loadingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui
Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 14)

local strokeLoading = Instance.new("UIStroke", loadingFrame)
strokeLoading.Color = Color3.fromRGB(255, 255, 255)
strokeLoading.Thickness = 1.5
strokeLoading.Transparency = 0.3

local topBar = Instance.new("Frame", loadingFrame)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
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

local barBackground = Instance.new("Frame", loadingFrame)
barBackground.Size = UDim2.new(0.9, 0, 0, 16)
barBackground.Position = UDim2.new(0.05, 0, 0.6, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
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
countdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

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

	local gui = Instance.new("ScreenGui", PlayerGui)
	gui.Name = "FreezeTradeUI"
	gui.ResetOnSpawn = false

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0, 210, 0, 230)
	main.Position = UDim2.new(0.5, -105, 0.5, -115)
	main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

	local stroke = Instance.new("UIStroke", main)
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 1.5
	stroke.Transparency = 0.3

	local topBar = Instance.new("Frame", main)
	topBar.Size = UDim2.new(1, 0, 0, 30)
	topBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)

	local title = Instance.new("TextLabel", topBar)
	title.Text = "🌿 Grow A Garden Freeze Trade"
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

	local sectionLabel = Instance.new("TextLabel", main)
	sectionLabel.Text = "Find Player to Freeze Trade"
	sectionLabel.Size = UDim2.new(1, -20, 0, 20)
	sectionLabel.Position = UDim2.new(0, 10, 0, 35)
	sectionLabel.BackgroundTransparency = 1
	sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	sectionLabel.Font = Enum.Font.GothamBold
	sectionLabel.TextSize = 12
	sectionLabel.TextXAlignment = Enum.TextXAlignment.Left

	local hintLabel = Instance.new("TextLabel", main)
	hintLabel.Text = "Enter username to start Freeze Trade"
	hintLabel.Size = UDim2.new(1, -20, 0, 16)
	hintLabel.Position = UDim2.new(0, 10, 0, 53)
	hintLabel.BackgroundTransparency = 1
	hintLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
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
	usernameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	usernameBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	Instance.new("UICorner", usernameBox).CornerRadius = UDim.new(0, 6)

	local searchBtn = Instance.new("TextButton", main)
	searchBtn.Text = "Search"
	searchBtn.Size = UDim2.new(0.3, 0, 0, 25)
	searchBtn.Position = UDim2.new(0.65, 0, 0, 75)
	searchBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	searchBtn.TextColor3 = Color3.new(1, 1, 1)
	searchBtn.Font = Enum.Font.GothamBold
	searchBtn.TextSize = 12
	Instance.new("UICorner", searchBtn).CornerRadius = UDim.new(0, 6)

	local userFrame = Instance.new("Frame", main)
	userFrame.Size = UDim2.new(0.9, 0, 0, 45)
	userFrame.Position = UDim2.new(0.05, 0, 0, 110)
	userFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Instance.new("UICorner", userFrame).CornerRadius = UDim.new(0, 8)
	userFrame.Visible = false

	local strokeUser = Instance.new("UIStroke", userFrame)
	strokeUser.Color = Color3.fromRGB(255, 255, 255)
	strokeUser.Thickness = 1.2
	strokeUser.Transparency = 0.3

	local avatarImage = Instance.new("ImageLabel", userFrame)
	avatarImage.Size = UDim2.new(0, 36, 0, 36)
	avatarImage.Position = UDim2.new(0, 5, 0.5, -18)
	avatarImage.BackgroundTransparency = 1

	local displayName = Instance.new("TextLabel", userFrame)
	displayName.Text = ""
	displayName.Size = UDim2.new(1, -45, 1, 0)
	displayName.Position = UDim2.new(0, 45, 0, 0)
	displayName.BackgroundTransparency = 1
	displayName.TextColor3 = Color3.fromRGB(255, 255, 255)
	displayName.Font = Enum.Font.GothamBold
	displayName.TextSize = 12
	displayName.TextXAlignment = Enum.TextXAlignment.Left

	local freezeBtn = Instance.new("TextButton", main)
	freezeBtn.Text = "Freeze Trade OFF ❌"
	freezeBtn.Size = UDim2.new(0.9, 0, 0, 32)
	freezeBtn.Position = UDim2.new(0.05, 0, 1, -40)
	freezeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	freezeBtn.TextColor3 = Color3.new(1, 1, 1)
	freezeBtn.Font = Enum.Font.GothamBold
	freezeBtn.TextSize = 14
	Instance.new("UICorner", freezeBtn).CornerRadius = UDim.new(0, 10)

	-- 📌 Added credit text above the button
	local creditLabel = Instance.new("TextLabel", main)
	creditLabel.Text = "made by MarkOnTop"
	creditLabel.Size = UDim2.new(1, 0, 0, 14)
	creditLabel.Position = UDim2.new(0, 0, 1, -58)
	creditLabel.BackgroundTransparency = 1
	creditLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	creditLabel.Font = Enum.Font.Gotham
	creditLabel.TextSize = 10
	creditLabel.TextXAlignment = Enum.TextXAlignment.Center

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

	local isCooldown = false
	local isFrozen = false

	local function playFreezeAnimation()
		local flashGui = Instance.new("ScreenGui")
		flashGui.IgnoreGuiInset = true
		flashGui.ResetOnSpawn = false
		flashGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		flashGui.Parent = PlayerGui

		local flashFrame = Instance.new("Frame")
		flashFrame.BackgroundColor3 = Color3.new(1, 1, 1)
		flashFrame.BackgroundTransparency = 1
		flashFrame.Size = UDim2.new(1, 0, 1, 0)
		flashFrame.Parent = flashGui

		local fadeIn = TweenService:Create(flashFrame, TweenInfo.new(0.15), {
			BackgroundTransparency = 0
		})

		local fadeOut = TweenService:Create(flashFrame, TweenInfo.new(0.3), {
			BackgroundTransparency = 1
		})

		fadeIn:Play()
		fadeIn.Completed:Wait()
		fadeOut:Play()
		fadeOut.Completed:Wait()
		flashGui:Destroy()

		local original = main.BackgroundColor3
		local freezeTween = TweenService:Create(main, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 100, 255)})
		local revertTween = TweenService:Create(main, TweenInfo.new(0.2), {BackgroundColor3 = original})
		freezeTween:Play()
		freezeTween.Completed:Wait()
		revertTween:Play()
	end

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
		playFreezeAnimation()
		isCooldown = false
	end)
end)
