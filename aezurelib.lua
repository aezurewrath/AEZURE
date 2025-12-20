local aelib = {}

local uis = game:GetService("UserInputService")
local tweens = game:GetService("TweenService")

local genv = getgenv() or _G

local function getChild(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetChildren()) do
			if v:GetAttribute("AEname") and v:GetAttribute("AEname") == tostring(name) then
				return v
			end
		end
	end
end

local function getDescendant(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetDescendants()) do
			if v:GetAttribute("AEname") and v:GetAttribute("AEname") == tostring(name) then
				return v
			end
		end
	end
end

local function findFirstChild(parent, name)
	if parent and name then
		for i, v in pairs(parent:GetChildren()) do
			if v:GetAttribue(name) then
				return v
			end
		end
	end
end

local function setName(x, name)
	if x then
		x:SetAttribute("AEname", tostring(name))
	end
end

local function getName(x)
	if x:GetAttribute("AEname") then
		return x:GetAttribute("AEname")
	end
end



local function rName()
	if not genv.AEtakeName then
		return string.rep(string.char(math.random(1,128)), math.random(1,25))
	else
		local x = nil
		for i, v in pairs(genv.AEparent:GetChildren()) do
			x = v
			break
		end
		if x then
			return x.Name
		else
			return string.rep(string.char(math.random(1,128)), math.random(1,25))
		end
	end
end


aelib.Theme = genv.AEtheme or {
	darkest = Color3.fromRGB(9,9,21),
	azure = Color3.fromRGB(138,249,255),
	white = Color3.fromRGB(255,255,255),
	black = Color3.fromRGB(0,0,0),
	light = Color3.fromRGB(29, 28, 42),
	red = Color3.fromRGB(255, 65, 68),
	lightest = Color3.fromRGB(75,79,154),
	bright = Color3.fromRGB(48,51,98),

	cmdbarOutlineTransparency = 0.6,
	cmdbarTransparency = 0,
	cmdbarOutlineColor = Color3.fromRGB(9,9,21),


}


local setTheme = aelib.Theme

function aelib.ListLabelNoButtons(parent, text)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Label"] = Instance.new("TextLabel");
		["_UICorner"] = Instance.new("UICorner");
		["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].BackgroundColor3 = setTheme.lightest
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0.025, 0, 0, 0)
	Elements["Main"].Size = UDim2.new(0.96, 0, 0.1, 0)
	Elements["Main"].Parent = parent

	Elements["_Label"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Label"].Text = text or ""
	Elements["_Label"].TextColor3 = setTheme.white
	Elements["_Label"].TextScaled = true
	Elements["_Label"].TextSize = 14
	Elements["_Label"].TextWrapped = true
	Elements["_Label"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["_Label"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_Label"].BackgroundTransparency = 1
	Elements["_Label"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Label"].BorderSizePixel = 0
	Elements["_Label"].Position = UDim2.new(0.02, 0, 0.5, 0)
	Elements["_Label"].Size = UDim2.new(0.96, 0, 1, 0)
	Elements["_Label"].Parent = Elements["Main"]

	Elements["_UICorner"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_UISizeConstraint"].MinSize = Vector2.new(0, 27)
	Elements["_UISizeConstraint"].Parent = Elements["Main"]

	return Elements
end

function aelib.ListLabelOneButton(parent, text, buttonText, buttonCallback1, buttonCallback2)
	if not parent then warn("Missing data: parent") return end
	buttonCallback1 = buttonCallback1 or function() end
	buttonCallback2 = buttonCallback2 or function() end


	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Label"] = Instance.new("TextLabel");
		["_UICorner"] = Instance.new("UICorner");
		["_Button"] = Instance.new("TextButton");
		["_UICorner1"] = Instance.new("UICorner");
		["_Background"] = Instance.new("Frame");
		["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].BackgroundColor3 = setTheme.lightest
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0.025, 0, 0, 0)
	Elements["Main"].Size = UDim2.new(0.96, 0, 0.1, 0)
	Elements["Main"].Parent = parent

	Elements["_Label"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Label"].Text = text or ""
	Elements["_Label"].TextColor3 = setTheme.white
	Elements["_Label"].TextScaled = true
	Elements["_Label"].TextSize = 14
	Elements["_Label"].TextWrapped = true
	Elements["_Label"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["_Label"].BackgroundTransparency = 1
	Elements["_Label"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Label"].BorderSizePixel = 0
	Elements["_Label"].Position = UDim2.new(0.02, 0, 0, 0)
	Elements["_Label"].Size = UDim2.new(0.68, 0, 1, 0)
	Elements["_Label"].Parent = Elements["Main"]

	Elements["_UICorner"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_Button"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Button"].Text = buttonText or ""
	Elements["_Button"].TextColor3 = setTheme.white
	Elements["_Button"].TextScaled = true
	Elements["_Button"].TextSize = 14
	Elements["_Button"].TextWrapped = true
	Elements["_Button"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_Button"].BackgroundColor3 = setTheme.bright
	Elements["_Button"].BorderSizePixel = 0
	Elements["_Button"].Position = UDim2.new(0.7, 0, 0.5, 0)
	Elements["_Button"].Size = UDim2.new(0.3, 0, 1, 0)
	Elements["_Button"].Parent = Elements["Main"]

	Elements["_UICorner1"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner1"].Parent = Elements["_Button"]

	Elements["_Background"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_Background"].BackgroundColor3 = setTheme.bright
	Elements["_Background"].BorderSizePixel = 0
	Elements["_Background"].Position = UDim2.new(0.7, 0, 0.5, 0)
	Elements["_Background"].Size = UDim2.new(0.21, 0, 1, 0)
	Elements["_Background"].ZIndex = 0
	Elements["_Background"].Parent = Elements["Main"]

	Elements["_UISizeConstraint"].MinSize = Vector2.new(0, 27)
	Elements["_UISizeConstraint"].Parent = Elements["Main"]

	local connections = {}

	connections.Click1 = Elements._Button.MouseButton1Up:Connect(buttonCallback1)
	connections.Click2 = Elements._Button.MouseButton2Up:Connect(buttonCallback2)

	connections.Hover = Elements._Button:GetPropertyChangedSignal("GuiState"):Connect(function()
		if Elements._Button.GuiState == Enum.GuiState.Hover then
			Elements._Button.BackgroundColor3 = setTheme.bright
		elseif Elements._Button.GuiState == Enum.GuiState.Press then
			Elements._Button.BackgroundColor3 = setTheme.lightest
		else
			Elements._Button.BackgroundColor3 = setTheme.bright
		end
	end)

	return Elements, connections


end

function aelib.EmptyLabel(parent, text)
	if parent then warn("Missing data: parent") return end
	local Elements = {
		["Main"] = Instance.new("TextLabel");
		["_UICorner"] = Instance.new("UICorner");
		["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["Main"].Text = "TEXT"
	Elements["Main"].TextColor3 = setTheme.azure
	Elements["Main"].TextScaled = true
	Elements["Main"].TextSize = 14
	Elements["Main"].TextWrapped = true
	Elements["Main"].BackgroundColor3 = setTheme.light
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0, 0, 0.006, 0)
	Elements["Main"].Size = UDim2.new(1, 0, 0.225, 0)
	Elements["Main"].Parent = parent

	Elements["_UICorner"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_UISizeConstraint"].MaxSize = Vector2.new(math.huge, 35)
	Elements["_UISizeConstraint"].MinSize = Vector2.new(0, 25)
	Elements["_UISizeConstraint"].Parent = Elements["Main"]

	return Elements
end

function aelib.EmptyButton(parent, text, callback1, callback2)
	if not parent then warn("Missing data: parent") return end
	callback1 = callback1 or function() end
	callback2 = callback2 or function() end

	local Elements = {
		["Main"] = Instance.new("TextButton");
		["_UICorner"] = Instance.new("UICorner");
		["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["Main"].Text = text or ""
	Elements["Main"].TextColor3 = setTheme.azure
	Elements["Main"].TextScaled = true
	Elements["Main"].TextSize = 14
	Elements["Main"].TextWrapped = true
	Elements["Main"].BackgroundColor3 = setTheme.light
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0, 0, 0.006, 0)
	Elements["Main"].Size = UDim2.new(1, 0, 0.225, 0)
	Elements["Main"].Parent = parent

	Elements["_UICorner"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_UISizeConstraint"].MaxSize = Vector2.new(math.huge, 35)
	Elements["_UISizeConstraint"].MinSize = Vector2.new(0, 25)
	Elements["_UISizeConstraint"].Parent = Elements["Main"]

	local connections = {}

	connections.Click1 = Elements.Main.MouseButton1Up:Connect(callback1)
	connections.Click2 = Elements.Main.MouseButton2Up:Connect(callback2)
	connections.Hover = Elements.Main:GetPropertyChangedSignal("GuiState"):Connect(function()
		if Elements.Main.GuiState == Enum.GuiState.Hover then
			Elements.Main.BackgroundColor3 = setTheme.bright
		elseif Elements.Main.GuiState == Enum.GuiState.Press then
			Elements.Main.BackgroundColor3 = setTheme.lightest
		else
			Elements.Main.BackgroundColor3 = setTheme.light

		end
	end)


	return Elements, connections
end

function aelib.EmptyField(parent, text)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("TextBox");
		["_UICorner"] = Instance.new("UICorner");
		["_UISizeConstraint"] = Instance.new("UISizeConstraint");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["Main"].PlaceholderText = text or ""
	Elements["Main"].PlaceholderColor3 = setTheme.azure
	Elements["Main"].TextColor3 = setTheme.white
	Elements["Main"].TextScaled = true
	Elements["Main"].TextSize = 14
	Elements["Main"].TextWrapped = true
	Elements["Main"].BackgroundColor3 = setTheme.light
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0, 0, 0.006, 0)
	Elements["Main"].Size = UDim2.new(1, 0, 0.225, 0)
	Elements["Main"].Parent = parent

	Elements["_UICorner"].CornerRadius = UDim.new(0.2, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_UISizeConstraint"].MaxSize = Vector2.new(math.huge, 35)
	Elements["_UISizeConstraint"].MinSize = Vector2.new(0, 25)
	Elements["_UISizeConstraint"].Parent = Elements["Main"]


	return Elements
end


function aelib.ListWindow(parent, title, openPosition, closePosition)
	if not parent then warn("Missing data: parent") return end
	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Outline"] = Instance.new("Frame");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Title"] = Instance.new("TextLabel");
		["_Close"] = Instance.new("TextButton");
		["_ListFrame"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_List"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UICorner1"] = Instance.new("UICorner");
	}

	openPosition = openPosition or UDim2.new(0.5,0,.6,0)
	closePosition = closePosition or UDim2.new(.5, 0, 1.35, 0)

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["Main"].BackgroundColor3 = setTheme.darkest
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = closePosition
	Elements["Main"].Size = UDim2.new(0.139584959, 0, 0.018127488, 0)
	Elements["Main"].Parent = parent
	Elements["Main"].Active = true
	Elements["Main"].Draggable = true

	Elements["_Outline"].BackgroundColor3 = setTheme.darkest
	Elements["_Outline"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Outline"].BorderSizePixel = 0
	Elements["_Outline"].Size = UDim2.new(0.99999994, 0, 13.9872103, 0)
	Elements["_Outline"].Parent = Elements["Main"]

	Elements["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Elements["_UIStroke"].Color = setTheme.darkest
	Elements["_UIStroke"].Thickness = 7
	Elements["_UIStroke"].Parent = Elements["_Outline"]

	Elements["_Title"].Font = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Title"].Text = title or ""
	Elements["_Title"].TextColor3 = setTheme.azure
	Elements["_Title"].TextScaled = true
	Elements["_Title"].TextSize = 14
	Elements["_Title"].TextWrapped = true
	Elements["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["_Title"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Elements["_Title"].BackgroundTransparency = 1
	Elements["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Title"].BorderSizePixel = 0
	Elements["_Title"].Position = UDim2.new(0.00999999978, 0, 0.300000012, 0)
	Elements["_Title"].Size = UDim2.new(0.382889152, 0, 1.00000012, 0)
	Elements["_Title"].Parent = Elements["Main"]

	Elements["_Close"].Font = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Close"].Text = "X"
	Elements["_Close"].TextColor3 = setTheme.red
	Elements["_Close"].TextSize = 14
	Elements["_Close"].TextWrapped = true
	Elements["_Close"].BackgroundColor3 = setTheme.darkest
	Elements["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Close"].BorderSizePixel = 0
	Elements["_Close"].Position = UDim2.new(0.913336039, 0, -0.199999109, 0)
	Elements["_Close"].Size = UDim2.new(0.0851566046, 0, 0.895026445, 0)
	Elements["_Close"].Parent = Elements["Main"]

	Elements["_ListFrame"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["_ListFrame"].BackgroundColor3 = setTheme.light
	Elements["_ListFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_ListFrame"].BorderSizePixel = 0
	Elements["_ListFrame"].ClipsDescendants = true
	Elements["_ListFrame"].Position = UDim2.new(0.5, 0, 1, 0)
	Elements["_ListFrame"].Size = UDim2.new(1, 0, 12.9870005, 0)
	Elements["_ListFrame"].Parent = Elements["Main"]

	Elements["_UICorner"].CornerRadius = UDim.new(0.0299999993, 0)
	Elements["_UICorner"].Parent = Elements["_ListFrame"]

	Elements["_List"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Elements["_List"].BottomImage = ""
	Elements["_List"].CanvasSize = UDim2.new(0, 0, 1, 0)
	Elements["_List"].MidImage = ""
	Elements["_List"].ScrollBarThickness = 0
	Elements["_List"].ScrollingDirection = Enum.ScrollingDirection.Y
	Elements["_List"].TopImage = ""
	Elements["_List"].VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
	Elements["_List"].Active = true
	Elements["_List"].BackgroundColor3 = setTheme.lightest
	Elements["_List"].BackgroundTransparency = 1
	Elements["_List"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_List"].BorderSizePixel = 0
	Elements["_List"].ClipsDescendants = false
	Elements["_List"].Position = UDim2.new(0.00600000005, 0, 0.00999999978, 0)
	Elements["_List"].Size = UDim2.new(0.984000027, 0, 0.980000019, 0)
	Elements["_List"].Parent = Elements["_ListFrame"]

	Elements["_UIListLayout"].HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	Elements["_UIListLayout"].Padding = UDim.new(0.00999999978, 0)
	Elements["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Elements["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Elements["_UIListLayout"].Parent = Elements["_List"]

	Elements["_UICorner1"].CornerRadius = UDim.new(0.0299999993, 0)
	Elements["_UICorner1"].Parent = Elements["_List"]

	local connections = {}
	local functions = {}

	function functions.Close()
		local tween = tweens:Create(Elements["Main"], TweenInfo.new(.35, Enum.EasingStyle.Quad), {Position = closePosition})
		tween:Play()
		tween.Completed:Wait()
		Elements["Main"].Visible = false
	end

	function functions.Open()
		Elements["Main"].Visible = true
		local tween = tweens:Create(Elements["Main"], TweenInfo.new(.35, Enum.EasingStyle.Quad), {Position = closePosition})
		tween:Play()
	end

	connections.CloseButton = Elements["_Close"].MouseButton1Up:Connect(function()
		functions.Close()
	end)

	connections.HoverClose = Elements._Close:GetPropertyChangedSignal("GuiState"):Connect(function()
		if Elements._Close.GuiState == Enum.GuiState.Hover then
			Elements._Close.BackgroundColor3 = setTheme.bright
		elseif Elements._Close.GuiState == Enum.GuiState.Press then
			Elements._Close.BackgroundColor3 = setTheme.lightest
		else
			Elements._Close.BackgroundColor3 = setTheme.darkest
		end
	end)


	return Elements, connections, functions


end

function aelib.ListWindowContentAbove(parent, title, openPosition, closePosition)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Outline"] = Instance.new("Frame");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Title"] = Instance.new("TextLabel");
		["_Close"] = Instance.new("TextButton");
		["_ListFrame"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_List"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UICorner1"] = Instance.new("UICorner");
		["_ContentFrame"] = Instance.new("Frame");
	}

	openPosition = openPosition or UDim2.new(0.5,0,.6,0)
	closePosition = closePosition or UDim2.new(.5, 0, 1.35, 0)

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["Main"].BackgroundColor3 = setTheme.darkest
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = closePosition
	Elements["Main"].Size = UDim2.new(0.139584959, 0, 0.018127488, 0)
	Elements["Main"].Parent = parent

	Elements["_Outline"].BackgroundColor3 = setTheme.darkest
	Elements["_Outline"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Outline"].BorderSizePixel = 0
	Elements["_Outline"].Size = UDim2.new(0.99999994, 0, 13.9872103, 0)
	Elements["_Outline"].Parent = Elements["Main"]

	Elements["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Elements["_UIStroke"].Color = setTheme.darkest
	Elements["_UIStroke"].Thickness = 7
	Elements["_UIStroke"].Parent = Elements["_Outline"]

	Elements["_Title"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Title"].Text = "TITLE"
	Elements["_Title"].TextColor3 = setTheme.azure
	Elements["_Title"].TextScaled = true
	Elements["_Title"].TextSize = 14
	Elements["_Title"].TextWrapped = true
	Elements["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["_Title"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Elements["_Title"].BackgroundTransparency = 1
	Elements["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Title"].BorderSizePixel = 0
	Elements["_Title"].Position = UDim2.new(0.00999999978, 0, 0.300000012, 0)
	Elements["_Title"].Size = UDim2.new(0.382889152, 0, 1.00000012, 0)
	Elements["_Title"].Parent = Elements["Main"]

	Elements["_Close"].FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Close"].Text = "X"
	Elements["_Close"].TextColor3 = setTheme.red
	Elements["_Close"].TextSize = 14
	Elements["_Close"].TextWrapped = true
	Elements["_Close"].BackgroundColor3 = setTheme.darkest
	Elements["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Close"].BorderSizePixel = 0
	Elements["_Close"].Position = UDim2.new(0.913336039, 0, -0.199999109, 0)
	Elements["_Close"].Size = UDim2.new(0.0851566046, 0, 0.895026445, 0)
	Elements["_Close"].Parent = Elements["Main"]

	Elements["_ListFrame"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["_ListFrame"].BackgroundColor3 = setTheme.light
	Elements["_ListFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_ListFrame"].BorderSizePixel = 0
	Elements["_ListFrame"].ClipsDescendants = true
	Elements["_ListFrame"].Position = UDim2.new(0.5, 0, 6.12436104, 0)
	Elements["_ListFrame"].Size = UDim2.new(1, 0, 7.86263657, 0)
	Elements["_ListFrame"].Parent = Elements["Main"]

	Elements["_UICorner"].CornerRadius = UDim.new(0.0299999993, 0)
	Elements["_UICorner"].Parent = Elements["_ListFrame"]

	Elements["_List"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Elements["_List"].BottomImage = ""
	Elements["_List"].CanvasSize = UDim2.new(0, 0, 1, 0)
	Elements["_List"].MidImage = ""
	Elements["_List"].ScrollBarThickness = 0
	Elements["_List"].ScrollingDirection = Enum.ScrollingDirection.Y
	Elements["_List"].TopImage = ""
	Elements["_List"].VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
	Elements["_List"].Active = true
	Elements["_List"].BackgroundColor3 = setTheme.lightest
	Elements["_List"].BackgroundTransparency = 1
	Elements["_List"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_List"].BorderSizePixel = 0
	Elements["_List"].ClipsDescendants = false
	Elements["_List"].Position = UDim2.new(0.00600000005, 0, 0.00999999978, 0)
	Elements["_List"].Size = UDim2.new(0.984000027, 0, 0.980000019, 0)
	Elements["_List"].Parent = Elements["_ListFrame"]

	Elements["_UIListLayout"].HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	Elements["_UIListLayout"].Padding = UDim.new(0.00999999978, 0)
	Elements["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Elements["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Elements["_UIListLayout"].Parent = Elements["_List"]

	Elements["_UICorner1"].CornerRadius = UDim.new(0.0299999993, 0)
	Elements["_UICorner1"].Parent = Elements["_List"]

	Elements["_ContentFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Elements["_ContentFrame"].BackgroundTransparency = 1
	Elements["_ContentFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_ContentFrame"].BorderSizePixel = 0
	Elements["_ContentFrame"].Position = UDim2.new(0, 0, 0.967000008, 0)
	Elements["_ContentFrame"].Size = UDim2.new(0.99999994, 0, 5.15698147, 0)
	Elements["_ContentFrame"].Parent = Elements["Main"]

	local connections = {}
	local functions = {}

	function functions.Close()
		local tween = tweens:Create(Elements["Main"], TweenInfo.new(.35, Enum.EasingStyle.Quad), {Position = closePosition})
		tween:Play()
		tween.Completed:Wait()
		Elements["Main"].Visible = false
	end

	function functions.Open()
		Elements["Main"].Visible = true
		local tween = tweens:Create(Elements["Main"], TweenInfo.new(.35, Enum.EasingStyle.Quad), {Position = closePosition})
		tween:Play()
	end

	connections.CloseButton = Elements["_Close"].MouseButton1Up:Connect(function()
		functions.Close()
	end)

	connections.HoverClose = Elements._Close:GetPropertyChangedSignal("GuiState"):Connect(function()
		if Elements._Close.GuiState == Enum.GuiState.Hover then
			Elements._Close.BackgroundColor3 = setTheme.bright
		elseif Elements._Close.GuiState == Enum.GuiState.Press then
			Elements._Close.BackgroundColor3 = setTheme.lightest
		else
			Elements._Close.BackgroundColor3 = setTheme.darkest
		end
	end)


	return Elements, connections, functions


end

function aelib.CommandLine(parent)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Background"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["CommandBar"] = Instance.new("TextBox");
		["_arrow"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["CommandIndicator"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["Predictions"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_UICorner2"] = Instance.new("UICorner");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].AnchorPoint = Vector2.new(0.5, 0.5)
	Elements["Main"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Elements["Main"].BackgroundTransparency = 1
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0.5, 0, 0.939999998, 0)
	Elements["Main"].Size = UDim2.new(0.575567722, 0, 0.12005201, 0)
	Elements["Main"].Parent = parent

	Elements["_Background"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["_Background"].BackgroundColor3 = setTheme.darkest
	Elements["_Background"].BackgroundTransparency = setTheme.cmdbarTransparency
	Elements["_Background"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Background"].BorderSizePixel = 0
	Elements["_Background"].ClipsDescendants = true
	Elements["_Background"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Elements["_Background"].Size = UDim2.new(1, 0, 0.25999999, 0)
	Elements["_Background"].Parent = Elements["Main"]

	Elements["_UICorner"].CornerRadius = UDim.new(0.300000012, 0)
	Elements["_UICorner"].Parent = Elements["_Background"]

	Elements["CommandBar"].CursorPosition = -1
	Elements["CommandBar"].Font = Enum.Font.Unknown
	Elements["CommandBar"].PlaceholderColor3 = setTheme.azure
	Elements["CommandBar"].PlaceholderText = "ÆZURE"
	Elements["CommandBar"].Text = ""
	Elements["CommandBar"].TextColor3 = setTheme.white
	Elements["CommandBar"].TextScaled = true
	Elements["CommandBar"].TextSize = 14
	Elements["CommandBar"].TextWrapped = true
	Elements["CommandBar"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["CommandBar"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["CommandBar"].BackgroundColor3 = Color3.fromRGB(15.000000055879354, 16.000000946223736, 30.00000011175871)
	Elements["CommandBar"].BackgroundTransparency = 1
	Elements["CommandBar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["CommandBar"].BorderSizePixel = 0
	Elements["CommandBar"].Position = UDim2.new(0.0250000004, 0, 0.5, 0)
	Elements["CommandBar"].Size = UDim2.new(0.968401849, 0, 0.639999986, 0)
	Elements["CommandBar"].ZIndex = 2
	Elements["CommandBar"].Parent = Elements["_Background"]

	Elements["_arrow"].Font = Enum.Font.Unknown
	Elements["_arrow"].Text = ">"
	Elements["_arrow"].TextColor3 = setTheme.azure
	Elements["_arrow"].TextScaled = true
	Elements["_arrow"].TextSize = 14
	Elements["_arrow"].TextWrapped = true
	Elements["_arrow"].AnchorPoint = Vector2.new(0, 0.5)
	Elements["_arrow"].BackgroundColor3 = Color3.fromRGB(9.000000413507223, 9.000000413507223, 21.000000648200512)
	Elements["_arrow"].BackgroundTransparency = 1
	Elements["_arrow"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_arrow"].BorderSizePixel = 0
	Elements["_arrow"].Position = UDim2.new(0.00499999989, 0, 0.449999988, 0)
	Elements["_arrow"].Size = UDim2.new(0.0194739532, 0, 0.787952483, 0)
	Elements["_arrow"].Parent = Elements["_Background"]

	Elements["_UIStroke"].Color = setTheme.cmdbarOutlineColor
	Elements["_UIStroke"].Thickness = 3
	Elements["_UIStroke"].Transparency = setTheme.cmdbarOutlineTransparency
	Elements["_UIStroke"].Parent = Elements["_Background"]

	Elements["CommandIndicator"].AnchorPoint = Vector2.new(0.5, 0.5)
	Elements["CommandIndicator"].BackgroundColor3 = setTheme.white
	Elements["CommandIndicator"].BackgroundTransparency = 0.30000001192092896
	Elements["CommandIndicator"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["CommandIndicator"].BorderSizePixel = 0
	Elements["CommandIndicator"].Position = UDim2.new(0.49999997, 0, 0.139867842, 0)
	Elements["CommandIndicator"].Size = UDim2.new(0.200000033, 0, 0.071697183, 0)
	Elements["CommandIndicator"].Parent = Elements["Main"]

	Elements["_UICorner1"].CornerRadius = UDim.new(1, 0)
	Elements["_UICorner1"].Parent = Elements["CommandIndicator"]

	Elements["Predictions"].BottomImage = ""
	Elements["Predictions"].CanvasSize = UDim2.new(0, 0, 0.5, 0)
	Elements["Predictions"].MidImage = ""
	Elements["Predictions"].ScrollBarThickness = 0
	Elements["Predictions"].ScrollingDirection = Enum.ScrollingDirection.Y
	Elements["Predictions"].TopImage = ""
	Elements["Predictions"].AnchorPoint = Vector2.new(0.5, 0)
	Elements["Predictions"].BackgroundColor3 = setTheme.Darkest
	Elements["Predictions"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Predictions"].BorderSizePixel = 0
	Elements["Predictions"].Position = UDim2.new(0.101000004, 0, -0.0900000036, 0)
	Elements["Predictions"].Selectable = false
	Elements["Predictions"].Size = UDim2.new(0.155314595, 0, 0.522919118, 0)
	Elements["Predictions"].Parent = Elements["Main"]

	Elements["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Elements["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Elements["_UIListLayout"].VerticalAlignment = Enum.VerticalAlignment.Bottom
	Elements["_UIListLayout"].Parent = Elements["Predictions"]

	Elements["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Elements["_UIStroke1"].Color = setTheme.darkest
	Elements["_UIStroke1"].Thickness = 4
	Elements["_UIStroke1"].Parent = Elements["Predictions"]

	Elements["_UICorner2"].CornerRadius = UDim.new(0.0500000007, 0)
	Elements["_UICorner2"].Parent = Elements["Predictions"]

	return Elements

end

function aelib.AddPrediction(parent, text)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("TextLabel");
	}

	Elements["Main"].Name = rName()
	setName(Elements["Main"], text)

	Elements["Main"].FontFace = Font.fromEnum(Enum.Font.Nunito)
	Elements["Main"].TextColor3 = setTheme.white
	Elements["Main"].TextScaled = true
	Elements["Main"].TextSize = 14
	Elements["Main"].TextWrapped = true
	Elements["Main"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["Main"].BackgroundColor3 = setTheme.darkest
	Elements["Main"].BorderColor3 = setTheme.lightest
	Elements["Main"].Position = UDim2.new(0.0398302823, 0, 0.694058359, 0)
	Elements["Main"].Size = UDim2.new(1, 0, 0, 23)
	Elements["Main"].Parent = parent

	return Elements["Main"]

end

function aelib.PortableTextField(parent, title, contentText)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_Field"] = Instance.new("TextBox");
		["_Title"] = Instance.new("TextLabel");
	}

	for i, v in pairs(Elements) do
		v.Name = rName()
		setName(v, string.split(i, "_")[1])
	end

	Elements["Main"].AnchorPoint = Vector2.new(0.5, 0.5)
	Elements["Main"].BackgroundColor3 = setTheme.darkest
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Elements["Main"].Size = UDim2.new(0.114730157, 0, 0.0342372544, 0)
	Elements["Main"].Parent = parent

	Elements["_UICorner"].CornerRadius = UDim.new(0.150000006, 0)
	Elements["_UICorner"].Parent = Elements["Main"]

	Elements["_Field"].CursorPosition = -1
	Elements["_Field"].Font = Enum.Font.Nunito
	Elements["_Field"].PlaceholderColor3 = setTheme.azure
	Elements["_Field"].PlaceholderText = contentText or ""
	Elements["_Field"].Text = ""
	Elements["_Field"].TextColor3 = setTheme.white
	Elements["_Field"].TextScaled = true
	Elements["_Field"].TextSize = 14
	Elements["_Field"].TextWrapped = true
	Elements["_Field"].TextXAlignment = Enum.TextXAlignment.Left
	Elements["_Field"].BackgroundColor3 = setTheme.light
	Elements["_Field"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Field"].BorderSizePixel = 0
	Elements["_Field"].Position = UDim2.new(0.317241371, 0, 0.170731708, 0)
	Elements["_Field"].Size = UDim2.new(0.651724219, 0, 0.658536613, 0)
	Elements["_Field"].Parent = Elements["Main"]

	Elements["_Title"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Title"].Text = title or ""
	Elements["_Title"].TextColor3 = setTheme.azure
	Elements["_Title"].TextScaled = true
	Elements["_Title"].TextSize = 14
	Elements["_Title"].TextWrapped = true
	Elements["_Title"].Active = true
	Elements["_Title"].BackgroundColor3 = setTheme.light
	Elements["_Title"].BackgroundTransparency = 1
	Elements["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Title"].BorderSizePixel = 0
	Elements["_Title"].Position = UDim2.new(0.0241379309, 0, 0.170731708, 0)
	Elements["_Title"].Selectable = true
	Elements["_Title"].Size = UDim2.new(0.293103456, 0, 0.658536613, 0)
	Elements["_Title"].Parent = Elements["Main"]


	local functions = {}

	function functions.init()
		Elements._Field:CaptureFocus()


		local lostfocus = false
		local msg = nil
		Elements._Field.FocusLost:Once(function(enter)
			if enter then
				msg = Elements._Field.Text
			end
			lostfocus = true
		end)

		repeat task.wait() until lostfocus

		return msg
	end

	return Elements, functions

end

function aelib.TitleWindowDescription(parent, title, description)
	if not parent then warn("Missing data: parent") return end

	local Elements = {
		["Main"] = Instance.new("Frame");
		["_Title"] = Instance.new("TextLabel");
		["_Info"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["_UIGradient"] = Instance.new("UIGradient");
	}

	Elements["Main"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Elements["Main"].BackgroundTransparency = 1
	Elements["Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["Main"].BorderSizePixel = 0
	Elements["Main"].Position = UDim2.new(0.182777017, 0, 0.490392953, 0)
	Elements["Main"].Size = UDim2.new(0.0872479603, 0, 0.0734951794, 0)
	Elements["Main"].Parent = parent

	Elements["_Title"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Title"].Text = title or ""
	Elements["_Title"].TextColor3 = setTheme.azure
	Elements["_Title"].TextScaled = true
	Elements["_Title"].TextSize = 14
	Elements["_Title"].TextWrapped = true
	Elements["_Title"].BackgroundColor3 = setTheme.darkest
	Elements["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Elements["_Title"].BorderSizePixel = 0
	Elements["_Title"].Size = UDim2.new(1, 0, 0.280649275, 0)
	Elements["_Title"].Parent = Elements["Main"]

	Elements["_Info"].FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Elements["_Info"].Text = description or ""
	Elements["_Info"].TextColor3 = setTheme.white
	Elements["_Info"].TextSize = 15
	Elements["_Info"].TextWrapped = true
	Elements["_Info"].TextYAlignment = Enum.TextYAlignment.Top
	Elements["_Info"].AnchorPoint = Vector2.new(0.5, 0.5)
	Elements["_Info"].BackgroundColor3 = setTheme.lightest
	Elements["_Info"].BackgroundTransparency = 0.4000000059604645
	Elements["_Info"].BorderColor3 = setTheme.lightest
	Elements["_Info"].BorderSizePixel = 0
	Elements["_Info"].Position = UDim2.new(0.5, 0, 0.640324116, 0)
	Elements["_Info"].Size = UDim2.new(1, 0, 0.719350159, 0)
	Elements["_Info"].ZIndex = 0
	Elements["_Info"].Parent = Elements["Main"]

	Elements["_UIStroke"].Color = Color3.fromRGB(255, 255, 255)
	Elements["_UIStroke"].Thickness = 5
	Elements["_UIStroke"].Parent = Elements["Main"]

	Elements["_UIGradient"].Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, setTheme.darkest),
		ColorSequenceKeypoint.new(0.2987910211086273, setTheme.darkest),
		ColorSequenceKeypoint.new(0.3056994676589966, setTheme.lightest),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(setTheme.lightest))
	}
	Elements["_UIGradient"].Rotation = 90
	Elements["_UIGradient"].Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.304239422082901, 0),
		NumberSequenceKeypoint.new(0.3070000112056732, 0.4000000059604645),
		NumberSequenceKeypoint.new(1, 0.4000000059604645)
	}
	Elements["_UIGradient"].Parent = Elements["_UIStroke"]

	return Elements

end


return aelib
