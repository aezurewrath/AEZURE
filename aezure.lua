--[[                                                                                  
                                                                                                    
                                                                                                ÆÆÆÆ
                                                                                           ÆÆÆÆÆÆÆÆÆ
                                                                                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ
                                                                                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ 
                                                                                 ÆÆÆÆÆÆÆÆÆ    ÆÆÆÆÆ 
                                                                                 ÆÆÆÆ        ÆÆÆÆÆÆ 
                                                                                             ÆÆÆÆÆ  
                                                ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ   ÆÆÆÆÆ  
                                               ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆ  
                                             ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆ   
                                            ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆ   
                                           ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ          
                                          ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ          
                                         ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                      ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                                ÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                               ÆÆÆÆÆÆÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                              ÆÆÆÆÆÆÆÆÆÆÆÆ   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                             ÆÆÆÆÆÆÆÆÆÆÆ     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                            ÆÆÆÆÆÆÆÆÆÆÆ       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                           ÆÆÆÆÆÆÆÆÆÆÆ        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ               
                          ÆÆÆÆÆÆÆÆÆÆÆ         ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                         ÆÆÆÆÆÆÆÆÆÆÆ          ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                      ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                  ÆÆÆÆÆÆÆÆÆÆÆÆ                ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                 ÆÆÆÆÆÆÆÆÆÆÆÆ                 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                        
                ÆÆÆÆÆÆÆÆÆÆÆÆ                  ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
     ÆÆÆÆÆ     ÆÆÆÆÆÆÆÆÆÆÆÆ                   ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
     ÆÆÆÆÆ    ÆÆÆÆÆÆÆÆÆÆÆÆ                    ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
    ÆÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                     ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
    ÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                       ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
   ÆÆÆÆÆ  ÆÆÆÆÆÆÆÆÆÆÆÆÆ                        ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ           
  ÆÆÆÆÆÆ                                                                                            
  ÆÆÆÆÆ     ÆÆÆÆÆÆÆÆ                                                                                
 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                
 ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                
ÆÆÆÆÆÆÆÆÆÆÆÆ                                                                                        
                                                                                                   
                                                                                                    
]]





















local players = game:GetService("Players")
local plr = players.LocalPlayer
local core = game:GetService("CoreGui").RobloxGui
local uis = game:GetService("UserInputService")
local repstore = game:GetService("ReplicatedStorage")
local httpservice = game:GetService("HttpService")
local tweens = game:GetService("TweenService")
local runsrv = game:GetService("RunService")
local chat = game:GetService("Chat")
local ss = game:GetService("SoundService")
local stui = game:GetService("StarterGui")
local tcs = game:GetService("TextChatService")
local isLegacyChat = tcs.ChatVersion == Enum.ChatVersion.LegacyChatService
local clogCount = 1
local prefix = Enum.KeyCode.Equals
local ping = nil
local shouldbe = Vector3.new(0,0,0)
local binding = false
local activeSlabel = nil
local uvrslV = {}
local sttngsL = {}

local canwrite = false
local canread = false


local genv = getgenv() or _G

if not genv.AEtakeName then
	genv.AEtakeName = false
end

if not genv.AEparent then
	genv.AEparent = core
end

print(genv.AEparent)
print(genv.AEtakeName)


function notify(title,text,duration)

	stui:SetCore("SendNotification", {
		Title = title or "", 
		Text = text or "",
		Duration = duration or 5
	})
end



local writefile = type(writefile) == "function" and function(file, data, safe)
	if safe == true then return pcall(writefile, file, data) end
	writefile(file, data)
end

local readfile = type(readfile) == "function" and function(file, safe)
	if safe == true then return pcall(readfile, file) end
	return readfile(file)
end


if writefile then
	canwrite = true
else
	notify("⚠️IMPORTANT⚠️", "Your executor can't write files. Your settings and keybinds will not save.", 10)
end

if readfile then
	canread = true
end


function saveData(data)
	if canwrite then
		writefile("data.ae", httpservice:JSONEncode(data), true)
		return true
	end 
end



function loadData()
	if canread then
		return httpservice:JSONDecode(readfile("data.ae", true))
	end
end


local dataloaded, data_ = readfile("data.ae", true)
local data = nil
if dataloaded then
	data = httpservice:JSONDecode(data_)
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


local function getPlayer(str)
	local foundPlayer = nil
	for i, v in pairs(players:GetPlayers()) do
		local a = string.sub(string.lower(v.Name),1,string.len(string.lower(str)))
		if string.match(string.lower(a), string.lower(str)) then
			foundPlayer = v
			break
		end
	end
	return foundPlayer
end

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

local function getLinesForBoundingBox(size)
	local x = size.X / 2
	local y = size.Y / 2
	local z = size.Z / 2
	return {
		Vector3.new(x, y, z),
		Vector3.new(x, -y, z),
		Vector3.new(x, y, z),
		Vector3.new(-x, y, z),
		Vector3.new(x, y, z),
		Vector3.new(x, y, -z),
		Vector3.new(-x,y,-z),
		Vector3.new(x, y, -z),
		Vector3.new(-x,y,-z),
		Vector3.new(-x,y,z),
		Vector3.new(-x,y,-z),
		Vector3.new(-x,-y,-z),
		Vector3.new(x, -y, -z),
		Vector3.new(x, -y, z),
		Vector3.new(x, -y, -z),
		Vector3.new(-x, -y, -z),
		Vector3.new(x, -y, -z),
		Vector3.new(x, y, -z),
		Vector3.new(-x, -y, z),
		Vector3.new(-x, -y, -z),
		Vector3.new(-x, -y, z),
		Vector3.new(-x, y, z),
		Vector3.new(-x, -y, z),
		Vector3.new(x, -y, z),
	}
end

local colors = {
	darkest = Color3.fromRGB(9,9,21),
	azure = Color3.fromRGB(138,249,255),
	white = Color3.fromRGB(255,255,255),
	black = Color3.fromRGB(0,0,0),
	light = Color3.fromRGB(29, 28, 42),
	red = Color3.fromRGB(255, 65, 68),
	lightest = Color3.fromRGB(75,79,154),
	bright = Color3.fromRGB(48,51,98),

}

-- UDim2.new(0,0,0.79,0)


local function createWindow(uicontainer, title, openPos, closePos)
	local main = Instance.new("Frame", uicontainer)
	main.Name = rName()
	main.BackgroundColor3 = colors.darkest
	main.Size = UDim2.new(0.14,0,0.018,0)
	main.Position = closePos
	main.Draggable = true
	main.Active = true
	main.BorderSizePixel = 0

	local scrollbar = Instance.new("ScrollingFrame", main)
	scrollbar.Name = rName()
	scrollbar.BackgroundColor3 = colors.light
	scrollbar.Position = UDim2.new(0,0,1,0)
	scrollbar.Size = UDim2.new(1,0,10.661,0)
	scrollbar.CanvasSize = UDim2.new(0,0,15,0)
	scrollbar.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollbar.BottomImage = ""
	scrollbar.TopImage = ""
	scrollbar.MidImage = "rbxassetid://12831321954"
	scrollbar.ScrollBarImageTransparency = 0	
	scrollbar.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollbar.BorderSizePixel = 0
	scrollbar.ScrollBarThickness = 4
	scrollbar.BorderSizePixel = 0
	scrollbar.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

	local list = Instance.new("UIListLayout", scrollbar)
	list.Wraps = false
	list.HorizontalAlignment = Enum.HorizontalAlignment.Center
	list.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly
	list.VerticalAlignment = Enum.VerticalAlignment.Top
	list.Padding = UDim.new(0.035,0)
	list.Name = rName()

	local OFrame = Instance.new("Frame", main)
	OFrame.Name = rName()
	OFrame.BackgroundTransparency = 1
	OFrame.Size = UDim2.new(1,0,11.661,0)
	OFrame.Position = UDim2.new(0,0,0,0)
	OFrame.BorderSizePixel = 0

	local outline = Instance.new("UIStroke", OFrame)
	outline.Name = rName()
	outline.LineJoinMode = Enum.LineJoinMode.Bevel
	outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	outline.Color = colors.darkest
	outline.Thickness = 7

	local close = Instance.new("TextButton", main)
	close.Name = rName()
	close.Text = ""
	close.BackgroundColor3 = colors.red
	close.Size = UDim2.new(0.058,0,0.912,0)
	close.Position = UDim2.new(0.975,0,-0.396,0)
	close.BorderSizePixel = 0

	local outline2 = Instance.new("UIStroke", close)
	outline2.LineJoinMode = Enum.LineJoinMode.Bevel
	outline2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	outline2.Color = colors.red
	outline2.Thickness = 3

	local titleLabel = Instance.new("TextLabel", main)
	titleLabel.Position = UDim2.new(0.308,0,-0.032,0)
	titleLabel.Size = UDim2.new(0.383,0,1,0)
	titleLabel.Name = rName()
	titleLabel.TextColor3 = colors.azure
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = title
	titleLabel.TextScaled = true
	titleLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	titleLabel.FontFace.Bold = true
	titleLabel.BorderSizePixel = 0

	local opent = tweens:Create(main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = openPos})
	local closet = tweens:Create(main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = closePos})
	local originalopen = opent

	local _return = {}
	_return.main = main
	_return.scrollbar = scrollbar
	_return.list = list
	_return.oframe = OFrame
	_return.outline = outline
	_return.close = close
	_return.outline2 = outline2
	_return.title = titleLabel
	_return.opent = opent
	_return.closet = closet
	_return.originalopen = originalopen

	return _return


end



local function templateLabel(parent, text, buttonText, buttonCallback, buttonCallback2)
	if not parent and text and buttonText then return end
	local template = Instance.new("Frame", parent)
	template.Size = UDim2.new(0.95,0,0.105,0)
	template.BackgroundColor3 = colors.lightest

	local outline = Instance.new("UIStroke", template)
	outline.LineJoinMode = Enum.LineJoinMode.Bevel
	outline.Color = colors.lightest
	outline.Thickness = 3

	local button = Instance.new("TextButton", template)
	button.Position = UDim2.new(0.7,0,0,0)
	button.Size = UDim2.new(0.3,0,1,0)
	button.BackgroundColor3 = colors.bright
	button.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	button.Text = buttonText
	button.TextXAlignment = Enum.TextXAlignment.Center
	button.BorderSizePixel = 0
	button.TextYAlignment = Enum.TextYAlignment.Center
	button.TextScaled = true
	button.TextColor3 = colors.white

	local label = Instance.new("TextLabel", template)
	label.Size = UDim2.new(0.702,0,1,0)
	label.BackgroundTransparency = 1
	label.TextScaled = true
	label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	label.Text = text
	label.TextColor3 = colors.white
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center

	if buttonCallback then
		button.MouseButton1Up:Connect(function()
			buttonCallback()
		end)
	end

	if buttonCallback2 then
		button.MouseButton2Up:Connect(function()
			buttonCallback2()
		end)
	end

	local _return = {}
	_return.main = template
	_return.button = button
	_return.label = label
	_return.cback1 = buttonCallback
	_return.cback2 = buttonCallback2
	_return.outline = outline

	return _return


end


local function blankLabel(parent, text)
	if not parent and text then return end

	local template = Instance.new("Frame", parent)
	template.Size = UDim2.new(0.95,0,0.105,0)
	template.BackgroundColor3 = colors.lightest
	template.Name = text

	local outline = Instance.new("UIStroke", template)
	outline.LineJoinMode = Enum.LineJoinMode.Bevel
	outline.Color = colors.lightest
	outline.Thickness = 3

	local label = Instance.new("TextLabel", template)
	label.Size = UDim2.new(0.702,0,1,0)
	label.BackgroundTransparency = 1
	label.TextScaled = true
	label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	label.Text = text
	label.TextColor3 = colors.white
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center

	local _return = {}
	_return.main = template
	_return.outline = outline
	_return.label = label
	return _return

end

local function textField(parent, context)

	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(.14,0,.056,0)
	frame.Position = UDim2.new(0.438,0,1.02,0)
	frame.BackgroundColor3 = colors.darkest
	frame.Name = rName()

	local outline = Instance.new("UIStroke", frame)
	outline.Name = rName()
	outline.LineJoinMode = Enum.LineJoinMode.Bevel
	outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	outline.Color = colors.darkest
	outline.Thickness = 7

	local field = Instance.new("TextBox", frame)
	field.Name = rName()
	field.BackgroundColor3 = colors.light
	field.Size = UDim2.new(1,0,.558,0)
	field.PlaceholderText = context
	field.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	field.TextColor3 = colors.white
	field.BorderSizePixel = 0
	field.TextScaled = true

	local cancel = Instance.new("TextButton", frame)
	cancel.Name = rName()
	cancel.BackgroundColor3 = colors.red
	cancel.TextColor3 = colors.white
	cancel.Size = UDim2.new(.4,0,.3,0)
	cancel.Position = UDim2.new(.05,0,.68,0)
	cancel.TextScaled = true
	cancel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	cancel.Text = "Cancel"

	local cancelOutline = Instance.new("UIStroke", cancel)
	cancelOutline.Name = rName()
	cancelOutline.LineJoinMode = Enum.LineJoinMode.Bevel
	cancelOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	cancelOutline.Color = colors.red
	cancelOutline.Thickness = 3

	local confirm = Instance.new("TextButton", frame)
	confirm.Name = rName()
	confirm.BackgroundColor3 = colors.azure
	confirm.TextColor3 = colors.black
	confirm.Size = UDim2.new(.4,0,.3,0)
	confirm.AnchorPoint = Vector2.new(.5,0)
	confirm.Position = UDim2.new(.75,0,.68,0)
	confirm.TextScaled = true
	confirm.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	confirm.Text = "Confirm"

	local confirmOutline = Instance.new("UIStroke", confirm)
	confirmOutline.Name = rName()
	confirmOutline.LineJoinMode = Enum.LineJoinMode.Bevel
	confirmOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	confirmOutline.Color = colors.azure
	confirmOutline.Thickness = 3

	local opentween = tweens:Create(frame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(.438,0,.557,0)})
	local closetween = tweens:Create(frame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.438,0,1.02,0)})

	opentween:Play()
	field:CaptureFocus()

	local rtReturn
	local brk = false

	confirm.MouseButton1Up:Connect(function()
		rtReturn = field.Text
		closetween:Play()
		task.wait(.3)
		frame:Destroy()
	end)

	field.FocusLost:Connect(function(entered)
		if entered then
			rtReturn = field.Text
			closetween:Play()
			task.wait(.3)
			frame:Destroy()
		end
	end)

	cancel.MouseButton1Up:Connect(function()
		brk = true
		closetween:Play()
		task.wait(.3)
		frame:Destroy()
	end)

	repeat wait() until rtReturn or brk

	if rtReturn then rtReturn = string.lower(rtReturn) end


	return rtReturn

end


--[[
function kc(x)

	local _a = {
		["="] = Enum.KeyCode.Equals,
		["-"] = Enum.KeyCode.Minus,
		["["] = Enum.KeyCode.LeftBracket,
		["]"] = Enum.KeyCode.RightBracket,
		[";"] = Enum.KeyCode.Semicolon,
		["'"] = Enum.KeyCode.Quote,
		[","] = Enum.KeyCode.Comma,
		["."] = Enum.KeyCode.Period,
		["/"] = Enum.KeyCode.Slash,
		["\\"] = Enum.KeyCode.BackSlash,
		["`"] = Enum.KeyCode.Backquote
	}
	return _a[x]
end
]]


local function disconnectTable(x)
	for i, v in pairs(x) do
		v:Disconnect()
	end
end

local function kc(x)
	local kp = {
		["Enum.KeyCode.A"] = Enum.KeyCode.A,
		["Enum.KeyCode.B"] = Enum.KeyCode.B,
		["Enum.KeyCode.C"] = Enum.KeyCode.C,
		["Enum.KeyCode.D"] = Enum.KeyCode.D,
		["Enum.KeyCode.E"] = Enum.KeyCode.E,
		["Enum.KeyCode.F"] = Enum.KeyCode.F,
		["Enum.KeyCode.G"] = Enum.KeyCode.G,
		["Enum.KeyCode.H"] = Enum.KeyCode.H,
		["Enum.KeyCode.I"] = Enum.KeyCode.I,
		["Enum.KeyCode.J"] = Enum.KeyCode.J,
		["Enum.KeyCode.K"] = Enum.KeyCode.K,
		["Enum.KeyCode.L"] = Enum.KeyCode.L,
		["Enum.KeyCode.M"] = Enum.KeyCode.M,
		["Enum.KeyCode.N"] = Enum.KeyCode.N,
		["Enum.KeyCode.O"] = Enum.KeyCode.O,
		["Enum.KeyCode.P"] = Enum.KeyCode.P,
		["Enum.KeyCode.Q"] = Enum.KeyCode.Q,
		["Enum.KeyCode.R"] = Enum.KeyCode.R,
		["Enum.KeyCode.S"] = Enum.KeyCode.S,
		["Enum.KeyCode.T"] = Enum.KeyCode.T,
		["Enum.KeyCode.U"] = Enum.KeyCode.U,
		["Enum.KeyCode.V"] = Enum.KeyCode.V,
		["Enum.KeyCode.W"] = Enum.KeyCode.W,
		["Enum.KeyCode.X"] = Enum.KeyCode.X,
		["Enum.KeyCode.Y"] = Enum.KeyCode.Y,
		["Enum.KeyCode.Z"] = Enum.KeyCode.Z,
		["Enum.KeyCode.Zero"] = Enum.KeyCode.Zero,
		["Enum.KeyCode.One"] = Enum.KeyCode.One,
		["Enum.KeyCode.Two"] = Enum.KeyCode.Two,
		["Enum.KeyCode.Three"] = Enum.KeyCode.Three,
		["Enum.KeyCode.Four"] = Enum.KeyCode.Four,
		["Enum.KeyCode.Five"] = Enum.KeyCode.Five,
		["Enum.KeyCode.Six"] = Enum.KeyCode.Six,
		["Enum.KeyCode.Seven"] = Enum.KeyCode.Seven,
		["Enum.KeyCode.Eight"] = Enum.KeyCode.Eight,
		["Enum.KeyCode.Nine"] = Enum.KeyCode.Nine,
		["Enum.KeyCode.LeftShift"] = Enum.KeyCode.LeftShift,
		["Enum.KeyCode.RightShift"] = Enum.KeyCode.RightShift,
		["Enum.KeyCode.LeftControl"] = Enum.KeyCode.LeftControl,
		["Enum.KeyCode.RightControl"] = Enum.KeyCode.RightControl,
		["Enum.KeyCode.LeftAlt"] = Enum.KeyCode.LeftAlt,
		["Enum.KeyCode.RightAlt"] = Enum.KeyCode.RightAlt,
		["Enum.KeyCode.Equals"] = Enum.KeyCode.Equals,
		["Enum.KeyCode.Backquote"] = Enum.KeyCode.Backquote,
		["Enum.KeyCode.Slash"] = Enum.KeyCode.Slash,
		["Enum.KeyCode.LeftBracket"] = Enum.KeyCode.LeftBracket,
		["Enum.KeyCode.RightBracket"] = Enum.KeyCode.RightBracket,
		["Enum.KeyCode.Minus"] = Enum.KeyCode.Minus,
		["Enum.KeyCode.Semicolon"] = Enum.KeyCode.Semicolon,
		["Enum.KeyCode.Quote"] = Enum.KeyCode.Quote,
		["Enum.KeyCode.Period"] = Enum.KeyCode.Period,
		["Enum.KeyCode.Comma"] = Enum.KeyCode.Comma,
		["Enum.KeyCode.F1"] = Enum.KeyCode.F1,
		["Enum.KeyCode.F2"] = Enum.KeyCode.F2,
		["Enum.KeyCode.F3"] = Enum.KeyCode.F3,
		["Enum.KeyCode.F4"] = Enum.KeyCode.F4,
		["Enum.KeyCode.F5"] = Enum.KeyCode.F5,
		["Enum.KeyCode.F6"] = Enum.KeyCode.F6,
		["Enum.KeyCode.F7"] = Enum.KeyCode.F7,
		["Enum.KeyCode.F8"] = Enum.KeyCode.F8,
		["Enum.KeyCode.F9"] = Enum.KeyCode.F9,
		["Enum.KeyCode.F10"] = Enum.KeyCode.F10,
		["Enum.KeyCode.F11"] = Enum.KeyCode.F11,
		["Enum.KeyCode.F12"] = Enum.KeyCode.F12
	}


	return kp[x]

end

local alreadyrunning = false
for i, v in pairs(core:GetChildren()) do
	if v:HasTag("abcdefg") then
		alreadyrunning = true
		break
	end
end

scrName = rName()

local function checkTrue(x)
	local truevalues = {"true", "yes", "t", "y"}
	if table.find(truevalues, string.lower(x)) then
		return true
	else
		return false
	end
end

local function getPlayerNames()
	local x = {}
	for i, v in pairs(players:GetPlayers()) do
		table.insert(x, v.Name)
	end
	return x
end

local function checkCommandTarget(x)
	warn("check Command Target", x)
	if x then
		x = string.lower(x)
		warn("check Command Target 'x' is present")
		if string.match(x, "all") then
			warn("check Command Target  all")
			return getPlayerNames()
		elseif string.match(x, "others") then
			warn("check Command Target  others")
			local t = getPlayerNames()
			table.remove(t, table.find(t, plr.Name))
			return t
		elseif string.match(x, "random") then
			warn("check Command Target  random")
			local random = math.random(1, #getPlayerNames())
			local allbutself = getPlayerNames()
			table.remove(allbutself, table.find(allbutself, plr.Name))
			for i, v in pairs(allbutself) do
				if i == random then
					return {v}
				end
			end
		end
	end
end

if not core:FindFirstChild(scrName) and not alreadyrunning then

	chat.Chatted:Connect(function(p, m, c)
		if string.split(m, " ")[1] and string.split(m, " ")[2] then
			local temp = string.split(m, " ")
			local player = getPlayer(temp[2])
			if not player then return end
			if string.match(temp[1], "unview") then
				if player == plr then
					notify(p.Name.." unviewed you", "You are no longer being viewed by a moderator.", 5)
				end
			elseif string.match(temp[1], "view") or string.match(temp[1], "kill") or string.match(temp[1], "bring") or string.match(temp[1], "to") or string.match(temp[1], "load") or string.match(temp[1], "refresh") then
				if player == plr then
					notify(p.Name.." mentioned you!", m, 10)
				end
			end
		end
	end)






	local scr = Instance.new("ScreenGui", genv.AEparent)
	scr.Name = rName()
	scr.ResetOnSpawn = false
	scr:AddTag("abcdefg")

	ping = Instance.new("Sound", scr)
	ping.Volume = 0.4
	ping.Looped = false
	ping.SoundId = "rbxassetid://7433801607"


	--[[-----------------------------------COMMAND LINE-----------------------------------]]--


	local commandsmain = Instance.new("Frame", scr)
	commandsmain.Name = rName()
	commandsmain.BackgroundTransparency = 1
	commandsmain.Position = UDim2.new(0.212, 0, 0.929, 0)
	commandsmain.Size = UDim2.new(0.576, 0, 0.044, 0)
	commandsmain.BorderSizePixel = 0

	local cmdLopen = tweens:Create(commandsmain, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.212, 0, 0.929, 0)})
	local cmdLclose = tweens:Create(commandsmain, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.212,0,0.98,0)})

	local function openCmdLine()
		cmdLopen:Play()
	end
	local function closeCmdLine()
		cmdLclose:Play()
	end

	local commandsmainoutlineframe = Instance.new("Frame", commandsmain)
	commandsmainoutlineframe.Name = rName()
	commandsmainoutlineframe.BackgroundColor3 = colors.darkest
	commandsmainoutlineframe.Size = UDim2.new(1,0,0.519,0)
	commandsmainoutlineframe.Position = UDim2.new(0,0,0.466,0)
	commandsmainoutlineframe.BorderSizePixel = 0

	local outline1 = Instance.new("UIStroke", commandsmainoutlineframe)
	outline1.Name = rName()
	outline1.Thickness = 4
	outline1.LineJoinMode = Enum.LineJoinMode.Bevel
	outline1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	outline1.Color = colors.darkest

	local cmdBar = Instance.new("TextBox", commandsmain)
	cmdBar.Name = rName()
	cmdBar.Size = UDim2.new(0.973,0,0.401,0)
	cmdBar.Position = UDim2.new(0.027,0,0.572,0)
	cmdBar.BackgroundColor3 = colors.darkest
	cmdBar.PlaceholderColor3 = colors.azure
	cmdBar.TextColor3 = colors.white
	cmdBar.TextScaled = true
	cmdBar.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	cmdBar.Text = ""
	cmdBar.PlaceholderText = "ÆZURE"
	cmdBar.TextXAlignment = Enum.TextXAlignment.Left
	cmdBar.BorderSizePixel = 0

	local arrowdecor = Instance.new("TextLabel", commandsmain)
	arrowdecor.Name = rName()
	arrowdecor.BackgroundColor3 = colors.darkest
	arrowdecor.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	arrowdecor.FontFace.Style = Enum.FontStyle.Normal

	arrowdecor.TextColor3 = colors.azure
	arrowdecor.Text = ">"
	arrowdecor.Size = UDim2.new(0.027,0,0.519,0)
	arrowdecor.Position = UDim2.new(0,0,0.466,0)
	arrowdecor.TextScaled = true
	arrowdecor.BorderSizePixel = 0


	--[[-----------------------------------COMMAND LINE-----------------------------------]]--

	--[[-----------------------------------COMMAND LIST-----------------------------------]]--

	local commandList = createWindow(scr, "COMMANDS", UDim2.new(0,0,0.79,0), UDim2.new(0,0,1.05,0))
	local function openCmdList()
		commandList.opent:Play()
	end
	local function closeCmdList()
		commandList.opent = tweens:Create(commandList.main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = commandList.main.Position})
		commandList.closet:Play()
	end
	local function restoreCmdList()
		commandList.originalopen:Play()
	end
	commandList.close.MouseButton1Up:Connect(function()
		closeCmdList()
	end)
	commandList.close.MouseButton2Up:Connect(function()
		restoreCmdList()
	end)

	local mousefollow = Instance.new("TextLabel", scr)
	mousefollow.Name = rName()
	mousefollow.Size = UDim2.new(0.1,0,0.016,0)
	mousefollow.TextColor3 = colors.azure
	mousefollow.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mousefollow.BackgroundColor3 = colors.darkest
	mousefollow.TextScaled = true
	mousefollow.Visible = false

	local mfollowoutline = Instance.new("UIStroke", mousefollow)
	mfollowoutline.Name = rName()
	mfollowoutline.LineJoinMode = Enum.LineJoinMode.Bevel
	mfollowoutline.Thickness = 4
	mfollowoutline.Color = colors.darkest
	mfollowoutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local mousefollowtext = Instance.new("TextLabel", mousefollow)
	mousefollowtext.Name = rName()
	mousefollowtext.TextColor3 = colors.white
	mousefollowtext.TextSize = 15
	mousefollowtext.TextYAlignment = Enum.TextYAlignment.Top
	mousefollowtext.BackgroundColor3 = colors.bright
	mousefollowtext.BorderSizePixel = 0
	mousefollowtext.TextWrapped = true
	mousefollowtext.Size = UDim2.new(1,0,3.962,0)
	mousefollowtext.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	mousefollowtext.Position = UDim2.new(0,0,1.18,0)

	function updatemousefollower(title, text, active)
		if not title and text then return end

		if active then
			task.wait(.05)
			mousefollow.Visible = true
		else
			mousefollow.Visible = false
		end

		mousefollow.Text = title
		mousefollowtext.Text = text

	end

	plr:GetMouse().Move:Connect(function()
		local mousepos = uis:GetMouseLocation()

		mousefollow.Position = UDim2.new(0, mousepos.X, 0, mousepos.Y - 165)
		if commandList.scrollbar.GuiState ~= Enum.GuiState.Hover and commandList.scrollbar.GuiState ~= Enum.GuiState.Press then
			updatemousefollower(" ", " ", false)
		end
	end)

	--[[-----------------------------------COMMAND LIST-----------------------------------]]--


	--[[-----------------------------------SAVEDATA-----------------------------------]]--
	local _settings = {
		Prefix = Enum.KeyCode.Semicolon,
		["Mention Notifier"] = false,
		["Highlight ESP"] = false,

	}

	local settingtypes = {
		Prefix = "keybind",
		["Mention Notifier"] = "boolean",
		["Highlight ESP"] = "boolean",

	}

	local keybinds = {}
	local keybindsStates = {}


	local function gettype(x)
		return settingtypes[x]
	end

	local function destringify(x)
		if type(x) == "string" then
			if string.find(string.lower(x), "enum") then
				return kc(x)
			end
		end
	end


	if dataloaded then

		for i, v in pairs(data.settings) do
			if _settings[i] then
				_settings[i] = v
			end
		end

		for i, v in pairs(_settings) do
			local x = destringify(v)
			if x then
				_settings[i] = x
			end
		end

		for i, v in pairs(data.keybinds) do
			local x = {}
			x.keybind = destringify(v.keybind)
			x.command = v.command
			x.command2 = v.command2
			x.toggle = v.toggle

			table.insert(keybinds, x)
			table.insert(keybindsStates, false)
		end



	end

	local function returnsavedata()
		local tmp = {}
		local tmp1 = {}
		local tmp2 = {}

		for i, v in pairs(_settings) do
			local append = v
			if type(v) == "userdata" then
				append = tostring(v)
			end
			tmp1[i] = append
		end

		for i, v in pairs(keybinds) do
			local tmp3 = {}
			for z, item in pairs(v) do
				local append = item
				if type(item) == "userdata" then
					append = tostring(item)
				end
				tmp3[z] = append
			end
			table.insert(tmp2, tmp3)
		end

		tmp.settings = tmp1
		tmp.keybinds = tmp2

		return tmp
	end

	--[[-----------------------------------SAVEDATA-----------------------------------]]--

	--[[-----------------------------------SETTINGS-----------------------------------]]--





	local settingsmenu = createWindow(scr, "SETTINGS", UDim2.new(0.438,0,0.674,0), UDim2.new(0.438,0,1.02,0))
	local function openSettings()
		settingsmenu.opent:Play()
	end
	local function closeSettings()
		settingsmenu.opent = tweens:Create(settingsmenu.main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = settingsmenu.main.Position})
		settingsmenu.closet:Play()
	end
	local function restoreSettings()
		settingsmenu.originalopen:Play()
	end
	settingsmenu.close.MouseButton1Up:Connect(function()
		closeSettings()
	end)
	settingsmenu.close.MouseButton2Up:Connect(function()
		restoreSettings()
	end)

	print("yes")

	for i, v in pairs(_settings) do
		print("Loop".. i)
		local _type = gettype(i)
		local btext = nil
		local cback = nil
		local cback2 = nil

		if _type then
			print("yeess")
			if _type == "keybind" then

				btext = tostring(v)

				cback = function()
					binding = true
					activeSlabel = tostring(i)
				end

			elseif _type == "boolean" then

				if v == true then
					btext = "active"
				elseif v == false then
					btext = "inactive"
				end

				uvrslV[i] = v

				cback = function()

					if _settings[i] == true then
						if sttngsL[i] then
							sttngsL[i].button.Text = "inactive"
							_settings[i] = false
						end
					elseif _settings[i] == false then
						if sttngsL[i] then
							sttngsL[i].button.Text = "active"
							_settings[i] = true
						end
					end

					local newData = returnsavedata() 
					saveData(newData)

				end

			end

		end



		local created = templateLabel(settingsmenu.scrollbar, tostring(i), btext, cback, cback2)
		sttngsL[tostring(i)] = created
	end

	--[[-----------------------------------SETTINGS-----------------------------------]]--

	--[[-----------------------------------KEYBINDS-----------------------------------]]--

	local keybindmenu = createWindow(scr, "KEYBINDS", UDim2.new(0.438,0,0.674,0), UDim2.new(0.438,0,1.02,0))

	local setmain = Instance.new("Frame", keybindmenu.main)
	setmain.Name = rName()
	setmain.Size = UDim2.new(0.498,0,4.75,0)
	setmain.Position = UDim2.new(1.063,0,6.911,0)
	setmain.BackgroundColor3 = colors.darkest

	local setmainoutline = Instance.new("UIStroke", setmain)
	setmainoutline.Color = colors.darkest
	setmainoutline.Name = rName()
	setmainoutline.Thickness = 7
	setmainoutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	setmainoutline.LineJoinMode = Enum.LineJoinMode.Bevel

	local cmdInput1 = Instance.new("TextBox", setmain)
	cmdInput1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	cmdInput1.Name = rName()
	cmdInput1.Size = UDim2.new(1,0,0.158,0)
	cmdInput1.BackgroundColor3 = colors.light
	cmdInput1.TextColor3 = colors.white
	cmdInput1.TextScaled = true
	cmdInput1.PlaceholderText = "COMMAND 1"
	cmdInput1.PlaceholderColor3 = colors.azure
	cmdInput1.Text = ""
	local cmdInput1outline = Instance.new("UIStroke", cmdInput1)
	cmdInput1outline.Name = rName()
	cmdInput1outline.Color = colors.light
	cmdInput1outline.LineJoinMode = Enum.LineJoinMode.Bevel
	cmdInput1outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	cmdInput1outline.Thickness = 3

	local cmdInput2 = Instance.new("TextBox", setmain)
	cmdInput2.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	cmdInput2.Name = rName()
	cmdInput2.Position = UDim2.new(0,0,0.246,0)
	cmdInput2.Size = UDim2.new(1,0,0.158,0)
	cmdInput2.BackgroundColor3 = colors.light
	cmdInput2.TextColor3 = colors.white
	cmdInput2.TextScaled = true
	cmdInput2.PlaceholderText = "COMMAND 2"
	cmdInput2.PlaceholderColor3 = colors.azure
	cmdInput2.Text = ""
	local cmdInput2outline = Instance.new("UIStroke", cmdInput2)
	cmdInput2outline.Name = rName()
	cmdInput2outline.Color = colors.light
	cmdInput2outline.LineJoinMode = Enum.LineJoinMode.Bevel
	cmdInput2outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	cmdInput2outline.Thickness = 3

	local addbindbutton = Instance.new("TextButton", setmain)
	addbindbutton.Name = rName()
	addbindbutton.Position = UDim2.new(0.53,0,0.834,0)
	addbindbutton.Size = UDim2.new(0.47,0,0.158,0)
	addbindbutton.BackgroundColor3 = colors.light
	addbindbutton.TextColor3 = colors.azure
	addbindbutton.TextScaled = true
	addbindbutton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	addbindbutton.Text = "ADD BIND"
	local addbindbuttonoutline = Instance.new("UIStroke", addbindbutton)
	addbindbuttonoutline.Name = rName()
	addbindbuttonoutline.Thickness = 3
	addbindbuttonoutline.Color = colors.light
	addbindbuttonoutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	addbindbuttonoutline.LineJoinMode = Enum.LineJoinMode.Bevel

	local setbindbutton = Instance.new("TextButton", setmain)
	setbindbutton.Name = rName()
	setbindbutton.Position = UDim2.new(0,0,0.834,0)
	setbindbutton.Size = UDim2.new(0.47,0,0.159,0)
	setbindbutton.Text = "SET BIND"
	setbindbutton.BackgroundColor3 = colors.light
	setbindbutton.TextColor3 = colors.azure
	setbindbutton.TextScaled = true
	setbindbutton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	local setbindbuttonoutline = Instance.new("UIStroke", setbindbutton)
	setbindbuttonoutline.Name = rName()
	setbindbuttonoutline.Color = colors.light
	setbindbuttonoutline.LineJoinMode = Enum.LineJoinMode.Bevel
	setbindbuttonoutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	setbindbuttonoutline.Thickness = 3




	local setbindtogglebutton = Instance.new("TextButton", setmain)
	setbindtogglebutton.Name = rName()
	setbindtogglebutton.Position = UDim2.new(0,0,0.589,0)
	setbindtogglebutton.Size = UDim2.new(1,0,0.158,0)
	setbindtogglebutton.Text = "TOGGLE [INACTIVE]"
	setbindtogglebutton.TextColor3 = colors.azure
	setbindtogglebutton.BackgroundColor3 = colors.light
	setbindtogglebutton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	setbindtogglebutton.TextScaled = true
	local setbindtogglebuttonoutline = Instance.new("UIStroke", setbindtogglebutton)
	setbindtogglebuttonoutline.Name = rName()
	setbindtogglebuttonoutline.Color = colors.light
	setbindtogglebuttonoutline.LineJoinMode = Enum.LineJoinMode.Bevel
	setbindtogglebuttonoutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	setbindtogglebuttonoutline.Thickness = 3


	for i, v in pairs(keybinds) do
		local x
		x = templateLabel(keybindmenu.scrollbar, "> ".. tostring(v.command).. " [".. tostring(v.keybind).. "]", "UNBIND", function()
			x.main:Destroy()
			local z = table.find(keybinds, v)
			if z then
				table.remove(keybinds, z)
				table.remove(keybindsStates, z)
			end
			saveData(returnsavedata())
		end)
	end


	local kbinding = false
	local kbindselect = nil
	local kbindtoggle = false

	setbindbutton.MouseButton1Up:Connect(function()
		kbinding = true
	end)


	setbindtogglebutton.MouseButton1Up:Connect(function()
		print("bindtogglebutton pressed")
		if not kbindtoggle then
			kbindtoggle = true
			print("keybind toggle true")
			setbindtogglebutton.Text = "TOGGLE [ACTIVE]"
		else
			kbindtoggle = false
			print("keybind toggle false")
			setbindtogglebutton.Text = "TOGGLE [INACTIVE]"
		end
	end)


	addbindbutton.MouseButton1Up:Connect(function()
		if not kbinding and kbindselect then
			local tmp = {}
			if kbindtoggle and cmdInput1.Text ~= "" and cmdInput2.Text ~= "" then
				tmp.keybind = kbindselect
				tmp.command = cmdInput1.Text
				tmp.command2 = cmdInput2.Text
				tmp.toggle = true
				table.insert(keybindsStates, false)
			elseif not kbindtoggle and cmdInput1.Text ~= "" then
				tmp.keybind = kbindselect
				tmp.command = cmdInput1.Text
				tmp.command2 = "."
				tmp.toggle = false
				table.insert(keybindsStates, false)
			end

			table.insert(keybinds, tmp)

			local createdLabel = nil
			createdLabel = templateLabel(keybindmenu.scrollbar, "> ".. tostring(cmdInput1.Text) .." [".. tostring(kbindselect) .."]", "UNBIND", function()
				createdLabel.main:Destroy()
				local x = table.find(keybinds, tmp)
				if x then
					table.remove(keybinds, x)
					table.remove(keybindsStates, x)
				end
				saveData(returnsavedata())
			end)

			setbindbutton.Text = "SET BIND"
			kbindselect = nil

			saveData(returnsavedata())

		end
	end)



	local function openKeybinds()
		keybindmenu.opent:Play()
	end
	local function closeKeybinds()
		keybindmenu.opent = tweens:Create(keybindmenu.main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = keybindmenu.main.Position})
		keybindmenu.closet:Play()
	end
	local function restoreKeybinds()
		keybindmenu.originalopen:Play()
	end
	keybindmenu.close.MouseButton1Up:Connect(function()
		closeKeybinds()
	end)
	keybindmenu.close.MouseButton2Up:Connect(function()
		restoreKeybinds()
	end)

	--[[-----------------------------------KEYBINDS-----------------------------------]]--


	cmdBar.Focused:Connect(function()
		barfocus = true
		openCmdLine()
		cmdBar.PlaceholderText = ""
	end)

	commandsmain:GetPropertyChangedSignal("GuiState"):Connect(function()
		if commandsmain.GuiState == Enum.GuiState.Hover then
			openCmdLine()
		elseif commandsmain.GuiState == Enum.GuiState.Idle and not barfocus then
			closeCmdLine()
		elseif commandsmain.GuiState == Enum.GuiState.Press and not barfocus then
			cmdBar:CaptureFocus()
		end
	end)

	local cmds = {}



	local function addCommand(name: string, aliases, description, args, cback)
		if not description then
			description = "None"
		end

		local temp = {}
		for i, v in pairs(args) do
			table.insert(temp, string.lower(v))
		end

		temp = args


		table.insert(aliases, string.lower(name))
		local tmp = {}
		table.insert(tmp, "description")
		table.insert(tmp, "aliases")
		table.insert(tmp, "args")
		table.insert(tmp, "callback")
		tmp["description"] = description
		tmp["aliases"] = aliases
		tmp["args"] = args
		tmp["callback"] = cback

		cmds[name] = tmp

	end


	local function decompile(str)
		return string.split(string.lower(str), " ")
	end

	local function runCmd(cmd)
		local decompiled = decompile(cmd)
		print(decompiled)
		local command = decompiled[1]
		local givenArgs = decompiled
		table.remove(givenArgs, 1)
		local toRun = nil
		local toRunP = nil



		for i, v in pairs(cmds) do
			for x, c in pairs(v["aliases"]) do
				if c == command then
					if type(i) == "string" then
						toRun = i
						toRunP = v
						break
					end
				end
			end
			if toRun then
				break
			end
		end




		if toRun then
			local plrAsArg = table.find(toRunP.args, "player")
			if plrAsArg then
				if string.lower(tostring(givenArgs[plrAsArg])) == "all" then
					for i, v in pairs(getPlayerNames()) do
						print(v)
						local newArgs = givenArgs
						table.remove(givenArgs, plrAsArg)
						table.insert(newArgs, plrAsArg, v)
						toRunP.callback(newArgs)
						wait(.05)
					end
				elseif string.lower(tostring(givenArgs[plrAsArg])) == "others" then
					for i, v in pairs(getPlayerNames()) do
						if v ~= plr.Name then
							print(v)
							local newArgs = givenArgs
							table.remove(givenArgs, plrAsArg)
							table.insert(newArgs, plrAsArg, v)
							toRunP.callback(newArgs)
						end
						wait(.05)
					end
				elseif string.lower(tostring(givenArgs[plrAsArg])) == "random" then
					local random = math.random(1, #getPlayerNames())
					local allbutself = getPlayerNames()
					table.remove(allbutself, table.find(allbutself, plr.Name))
					for i, v in pairs(allbutself) do
						if i == random then
							print(v)
							local newArgs = givenArgs
							table.remove(givenArgs, plrAsArg)
							table.insert(newArgs, plrAsArg, v)
							toRunP.callback(newArgs)
						end
					end
				else
					toRunP.callback(givenArgs)
				end
			else
				toRunP.callback(givenArgs)
			end

		end

	end

	cmdBar.FocusLost:Connect(function(e, x)
		barfocus = false
		local tmp = cmdBar.Text
		cmdBar.PlaceholderText = "ÆZURE"
		cmdBar.Text = ""
		closeCmdLine()
		if e then
			runCmd(tmp)
		end
	end)


	local wpressed = false
	local bricK = uis.InputBegan:Connect(function(inp, e)
		if not e then
			if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.S then
				wpressed = true
			end
		end
	end)

	local briCk = uis.InputEnded:Connect(function(inp, e)
		if not e then
			if inp.KeyCode == Enum.KeyCode.W or inp.KeyCode == Enum.KeyCode.S then
				wpressed = false
			end
		end
	end)

	local platform = nil
	local platformC = nil
	addCommand("hipheight", {"hh", "hip"}, "Set your character's hipheight to [value] ", {"value"}, function(a)
		if a[1] then
			local value = tonumber(a[1])
			if value and plr.Character then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
				if h then
					h.HipHeight = value
				end
			end
		end
	end)

	addCommand("debugtest1", {}, nil, {}, function(a)
		warn("v--debug test 1 results--v")
		print(type(players:GetChildren()))
		print(table.concat(players:GetChildren(), ", "))
		warn("^--debug test 1 results--^")
	end)

	addCommand("debugtest2", {}, nil, {}, function(a)
		warn("v--debug test 2 results--v")
		print(table.concat({"Ohio", "Sigma", "Man"}, ",", 1))
		warn("^--debug test 2 results--^")
	end)



	addCommand("debugtest3", {}, nil, {}, function(a)
		warn("v--debug test 3 results--v")
		print(table.concat(getPlayerNames(), ",", 1))
		warn("^--debug test 3 results--^")
	end)

	addCommand("debugtest4", {}, nil, {}, function(a)
		local x = getPlayerNames()
		warn("v--debug test 4 results--v")
		print(table.concat(x, ",", 1))
		for i, v in pairs(players:GetPlayers()) do
			warn("------------------------------------------")
			local player = getPlayer(v.Name)
			if player then
				print("player instance for ".. v.Name.. " found")
				if player.Character then
					print("character for ".. v.Name.. " found")
					if player.Character.PrimaryPart then
						print("found primary part for character of ".. v.Name)
					end
				end
			end
		end
		warn("^--debug test 4 results--^")
	end)

	addCommand("printnames", {}, "print all names", {"player"}, function(a)
		if a and a[1] then
			local plaaayerr = getPlayer(a[1])
			if plaaayerr then
				print(plaaayerr.Name)
			end
		end
	end)

	addCommand("walkspeed", {"ws", "wspeed"}, "Set your character's walkspeed to [value] ", {"value"}, function(a)
		if a[1] then
			local value = tonumber(a[1])
			if value then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

				if h then
					h.WalkSpeed = value
				end
			end
		end
	end)


	--[[
	addCommand("chatlogs", {"clogs"}, "Open the chatlogs", {}, function(a)
		openCLog:Play()
	end)
]]

	addCommand("infiniteyield", {"iy", "infy", "infyield"}, "open infinite yield", {}, function(a)
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	local cwalk = nil
	local cwalkRun = false
	local cwalkdisableondeath = false
	local cwalkrunning = false
	local seatbindcwalk = nil

	addCommand("settings", {}, "open settings menu", {}, function(a)
		openSettings()
	end)

	addCommand("keybinds", {"binds"}, "open keybinding menu", {}, function(a)
		openKeybinds()
	end)

	addCommand("commands", {"cmds"}, nil, {}, function(a)
		openCmdList()
	end)

	addCommand("cframewalk", {"cwalk", "cwalkspeed", "cws"}, "CFrame your character's walking with speed [speed]. If [seated?] is true, then you will not stop cwalking when you sit down.", {"speed", "disableondeath?", "running?", "seated?",}, function(a)
		local ableto = true
		local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

		seatbindcwalk = h.Seated:Connect(function(active)
			if active and not cwalkrunning then
				ableto = false
			elseif not active and not cwalkrunning then
				ableto = true
			end
		end)

		cwalkRun = false
		cwalkrunning = false

		if cwalk then
			cwalk:Disconnect()
			cwalk = nil
		end
		
		if a[2] and checkTrue(a[2]) then
			cwalkdisableondeath = true
		end
		
		if a[3] and checkTrue(a[3]) then
			cwalkRun = true
		end
		
		if a[4] and checkTrue(a[4]) then
			cwalkrunning = true
		end
		

		if a[1] then
			local value = tonumber(a[1])
			if value and plr.Character and value ~= 0 then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

				task.delay(2, function()
					local cwalkdied = nil
					cwalkdied = h.Died:Connect(function()
						if not cwalk and cwalkdied then cwalkdied:Disconnect() return end
						if not cwalkdisableondeath then return end
						cwalk:Disconnect()
						cwalk = nil
						seatbindcwalk:Disconnect()
						cwalkdied:Disconnect()
					end)
					
					
					local cwalkcharacteradd = nil
					cwalkcharacteradd = plr.CharacterAdded:Connect(function()
						if not cwalk and cwalkcharacteradd then cwalkcharacteradd:Disconnect() return end
						runCmd("cwalk off")
						task.wait(1)
						if cwalkdisableondeath then return end
						runCmd("cwalk ".. value.. " "..tostring(cwalkdisableondeath).. " ".. tostring(cwalkRun).. " ".. tostring(cwalkrunning))
 					end)

				end)

				cwalk = runsrv.Stepped:Connect(function()
					local h2  = plr.Character:FindFirstChildWhichIsA("Humanoid")
					
					if cwalkRun then

						if h2 and h2:GetState() == Enum.HumanoidStateType.Running and plr.Character and ableto then
							local amplification = Vector3.new(value, value, value) * h2.MoveDirection
							shouldbe = shouldbe + amplification
							plr.Character:PivotTo(plr.Character.PrimaryPart.CFrame + amplification)
						end
					else
						if h2 and h2.MoveDirection ~= Vector3.new(0,0,0) and plr.Character and ableto then
							local amplification = Vector3.new(value, value, value) * h2.MoveDirection
							shouldbe = shouldbe + amplification
							plr.Character:PivotTo(plr.Character.PrimaryPart.CFrame + amplification)
						end
					end
					task.wait(.1)
				end)
			elseif string.lower(a[1]) == "off" or string.lower(a[1]) == "none" then
				if cwalk then
					cwalk:Disconnect()
				end
			else
				if cwalk then
					cwalk:Disconnect()
				end
			end
		else
			if cwalk then
				cwalk:Disconnect()
			end
		end
	end)


	local walkfling = nil
	local flingintensity = 1
	
	
	addCommand("walkfling", {"wfling", "wf"}, "Apply a force to your character to fling people that touch you.", {"strength"}, function(a)
		if walkfling then 
			runCmd("unwf")
		end
		flingintensity = 1
		
		if a and a[1] and tonumber(a[1]) then
			flingintensity = tonumber(a[1])
		end

		local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			local aa
			aa = humanoid.Died:Connect(function()
				runCmd("unwf")
				aa:Disconnect()
			end)
		end

		walkfling = runsrv.Heartbeat:Connect(function()
			local char = plr.Character
			local root = char.PrimaryPart
			local hum = char:FindFirstChildWhichIsA("Humanoid")
			local vel, movel = nil, 0.1

			vel = root.Velocity
			root.Velocity = vel * (10000 * flingintensity) + Vector3.new(0,10000,0)

			runsrv.RenderStepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel
			end

			runsrv.Stepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		end)

	end)

	addCommand("unwalkfling", {"unwfling", "unwf"}, nil, {}, function(a)
		if walkfling then 
			local savedpos = plr.Character.PrimaryPart.Position
			walkfling:Disconnect()
			walkfling = nil
			runCmd("freeze")
			runCmd("gotov3 ".. savedpos.X .." ".. savedpos.Y .." ".. savedpos.Z .." ")
			task.wait(.1)
			runCmd("unfreeze")
		end
	end)
	
	addCommand("velocity", {}, "Set your velocity to a certain value", {"velocity"}, function(a)
		if a and a[1] and a[2] and a[3] and tonumber(a[1]) and tonumber(a[2]) and tonumber(a[3]) then
			local char = plr.Character
			if char then
				for i, v in pairs(char:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Velocity = Vector3.new(tonumber(a[1]), tonumber(a[2]), tonumber(a[3]))
					end
				end
			end
		end
	end)
	
	local stopfling = false

	addCommand("fling", {}, "Teleport to a player and attempt to fling them. May not work if they are moving.", {"player", "strength"}, function(a)
		local savedpos = plr.Character.PrimaryPart.Position
		
		local v = 1
		if a and a[2] and tonumber(a[2]) then
			v = tonumber(a[2])
		end
		
		
		
		
		if a and a[1] and getPlayer(a[1]) and not stopfling then
			runCmd("walkfling ".. v)
			runCmd("loopto ".. a[1])
			
			
			repeat
				task.wait()
			until stopfling or getPlayer(a[1]).Character.PrimaryPart.Velocity.Magnitude >= 100 or plr.Character:FindFirstChildWhichIsA("Humanoid").Health <= 0 or getPlayer(a[1]).Character:FindFirstChildWhichIsA("Humanoid").Health <= 0
			
			runCmd("unwalkfling")
			runCmd("unloopto")
			runCmd("freeze")
			runCmd("velocity 0 0 0")
			runCmd("gotov3 ".. savedpos.X .." ".. savedpos.Y .." ".. savedpos.Z .." ")
			runCmd("unfreeze")
		end
	end)
	
	addCommand("stopfling", {}, "Stop the current fling", {}, function(a)
		stopfling = true
		task.delay(3, function()
			stopfling = false
		end)
	end)
	
	addCommand("toolfling", {"tfling"}, "Shove a tool into your character to act as your collision part. This allows you to fling people in games that have tools with collisions but have character collisions disabled.", {"player", "strength"}, function(a)
		if a and a[1] then
			local v = 1
			if a[2] and tonumber(a[2]) then
				v = tonumber(a[2])
			end
			
			local char = plr.Character
			if char then
				local tool = char:FindFirstChildWhichIsA("Tool")
				if tool and tool.RequiresHandle and tool:FindFirstChild("Handle") then
					local savedgrippos = tool.GripPos
					
					runCmd("grippos 2 1 1")
					runCmd("fling ".. a[1].. " ".. v)
					runCmd("grippos ".. savedgrippos.X.. " ".. savedgrippos.Y.. " ".. savedgrippos.Z)
					
				end
			end
			
			
			
		end
	end)


	addCommand("drivefling", {"dfling", "df"}, nil, {}, function(a)
		if walkfling then 
			runCmd("unwf")
		end

		local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			local aa
			aa = humanoid.Died:Connect(function()
				runCmd("unwf")
				aa:Disconnect()
			end)
		end

		humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
			if not humanoid.Sit and walkfling then
				runCmd("unwf")
			end
		end)

		if humanoid.Sit then
			walkfling = runsrv.Heartbeat:Connect(function()
				local char = plr.Character
				local root = char.PrimaryPart
				humanoid = char:FindFirstChildWhichIsA("Humanoid")
				local vel, movel = nil, 0.1

				vel = root.Velocity
				root.Velocity = vel * 10000 + Vector3.new(0,10000,0)

				runsrv.RenderStepped:Wait()
				if char and char.Parent and root and root.Parent then
					root.Velocity = vel
				end

				runsrv.Stepped:Wait()
				if char and char.Parent and root and root.Parent then
					root.Velocity = vel + Vector3.new(0, movel, 0)
					movel = movel * -1
				end
			end)
		end
	end)


	addCommand("uncframewalk", {"uncwalk"}, "Stop Cframe Walk", {}, function(a)
		if cwalk then
			cwalk:Disconnect()
			cwalk = nil
		end
		if seatbindcwalk then
			seatbindcwalk:Disconnect()
		end
	end)

	addCommand("goto", {"to"}, "Teleport to [player]. If [anchored?] is true, then your character will be anchored before teleporting and unanchored after.", {"player", "anchored?"}, function(a)
		if a[1] then
			local player = getPlayer(a[1])
			if player and plr.Character and player.Character and player.Character.PrimaryPart and plr.Character.PrimaryPart then
				if a[2] then
					if checkTrue(a[2]) then
						plr.Character.PrimaryPart.Anchored = true
					end
				end
				shouldbe = player.Character.PrimaryPart.Position
				plr.Character:PivotTo(CFrame.new(player.Character.PrimaryPart.Position))
				task.wait(.15)
				plr.Character.PrimaryPart.Anchored = false
			end	
		end
	end)

	addCommand("unanchor", {"unfreeze", "thaw"}, nil, {}, function(a)
		if plr.Character and plr.Character.PrimaryPart then
			plr.Character.PrimaryPart.Anchored = false
		end
	end)

	addCommand("anchor", {"freeze"}, nil, {}, function(a)
		if plr.Character and plr.Character.PrimaryPart then
			plr.Character.PrimaryPart.Anchored = true
		end
	end)

	local loopgoto = nil

	addCommand("loopgoto", {"loopto"}, "Loop teleport to [player]. If [anchored?] is true, then your character will be anchored before teleporting and unanchored after.", {"player", "anchored?"}, function(a)
		if loopgoto then
			loopgoto:Disconnect()
		end

		if a[1] then
			loopgoto = runsrv.Stepped:Connect(function()
				local player = getPlayer(a[1])
				local x = false
				if a[2] then
					if checkTrue(a[2]) then
						x = true
					end
				end
				if player then
					runCmd("goto ".. player.Name.. " ".. tostring(x))
				end
			end)
		else
			if loopgoto then
				loopgoto:Disconnect()
			end
		end
	end)

	addCommand("unloopgoto", {"unloopto", "stoploopto", "stoploopgoto"}, nil, {}, function(a)
		if loopgoto then
			loopgoto:Disconnect()
		end
	end)


	local noclip = nil
	addCommand("noclip", {}, "Walk through walls", {}, function(a)
		if noclip then
			noclip:Disconnect()
		end

		noclip = runsrv.Stepped:Connect(function()
			if plr.Character then
				for i, v in pairs(plr.Character:GetDescendants()) do
					if v:IsA("BasePart") and v.CanCollide and v ~= platform then
						v.CanCollide = false
					end
				end
			end
		end)

	end)

	addCommand("clip", {}, "Stop walking through walls", {}, function(a)
		if noclip then
			noclip:Disconnect()
		end
	end)


	local vhparts = {}
	addCommand("vehiclenoclip", {"vnoclip"}, "Make your car noclip", {}, function(a)
		for i, v in pairs(vhparts) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		vhparts = {}
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")

			if h then
				if h.SeatPart then
					local sp = h.SeatPart
					local vmodel = sp.Parent
					repeat
						if not vmodel:IsA("Model") then
							vmodel = vmodel.Parent
						end
					until vmodel.ClassName == "Model"
					task.wait(.1)
					cmds["noclip"].callback({})
					for i, v in pairs(vmodel:GetDescendants()) do
						if v:IsA("BasePart") then
							if v.CanCollide then
								v.CanCollide = false
								table.insert(vhparts, v)
							end
						end
					end
				end
			end

		end

	end)

	addCommand("vehicleclip", {"vclip", "unvehiclenoclip", "unvnoclip"}, "Stop your car from phasing through things", {}, function(a)
		for i, v in pairs(vhparts) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end

		vhparts = {}

	end)

	addCommand("view", {"spectate", "spy"}, "Move your camera to where someone is", {"player"},function(a)
		local cam = workspace.CurrentCamera
		if a[1] then			
			local player = getPlayer(a[1]) 
			if player then
				if player.Character then
					cam.CameraSubject = player.Character
				end
			end
		else
			if plr.Character then
				local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
				if h then
					cam.CameraSubject = h
				end
			end
		end
	end)

	addCommand("unview", {"stopview", "unspectate"}, "View yourself again", {}, function(a)
		local cam = workspace.CurrentCamera
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				cam.CameraSubject = h
			end
		end
	end)

	addCommand("dex", {"explorer", "dexexplorer"}, nil, {}, function(a)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end)


	local platformFloat = 0.087
	local pSize = Vector3.new(4,.25,4)
	addCommand("platform", {}, "Put an invisible platform at your feet", {"size", "visible?"}, function(a)
		platformFloat = 0.087

		if platformC then
			platformC:Disconnect()
		end

		pSize = Vector3.new(4,.25,4)
		if a[1] then
			if tonumber(a[1]) then
				pSize = Vector3.new(a[1], .25, a[1])
			end
		end

		local vis = 1
		if a[2] then
			if string.lower(a[2]) == "yes" or string.lower(a[2]) == "true" or string.lower(a[2]) == "t" or string.lower(a[2]) == "y" then
				vis = 0
			end
		end


		platformC = runsrv.Stepped:Connect(function()
			if plr.Character then
				local hrp = plr.Character.PrimaryPart
				local pos = nil



				if hrp then

					if not platform then
						platform = Instance.new("Part", plr.Character)
						platform.Name = rName()
						platform.Transparency = vis
						platform.Size = pSize
						platform.Anchored = true
					else
						if plr.Character:FindFirstChild("UpperTorso") then
							pos = hrp.Position - Vector3.new(0,plr.Character.LeftFoot.Size.Y + plr.Character.LeftLowerLeg.Size.Y + plr.Character.LeftUpperLeg.Size.Y + hrp.Size.Y/4 - platformFloat,0)   
						elseif plr.Character:FindFirstChild("Torso") then
							pos = hrp.Position - Vector3.new(0, plr.Character.LeftLeg.Size.Y - hrp.Size.Y/4 - platformFloat,0)
						end

						if pos then
							platform.Position = pos
							platform.Size = pSize
							platform.Transparency = vis
						end
					end
				end
			end
		end)

	end)

	addCommand("unplatform", {"deplatform"}, "Stop putting an invisible platform at your feet", {}, function(a)
		if platformC then
			platformC:Disconnect()
			platformC = nil
		end

		if platform then
			platform:Destroy()
			platform = nil
		end

	end)

	addCommand("jumppower", {"jp", "jpower"}, "Set your humanoid's jump power to [power]", {"power"}, function(a)
		local setTo = 50
		if a[1] then
			if tonumber(a[1]) then
				setTo = tonumber(a[1])
			end
		end
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				h.UseJumpPower = true
				h.JumpPower = setTo
			end
		end
	end)

	addCommand("jumpheight", {"jh", "jheight"}, nil, {"height"}, function(a)
		local setTo = 7.2
		if a[1] then
			if tonumber(a[1]) then
				setTo = tonumber(a[1])
			end
		end
		if plr.Character then
			local h = plr.Character:FindFirstChildWhichIsA("Humanoid")
			if h then
				h.UseJumpPower = false
				h.JumpHeight = setTo
			end
		end
	end)


	addCommand("platformfloat", {"pf"}, nil, {"value"}, function(a)
		if a[1] then
			if not tonumber(a[1]) then
				if string.lower(a[1]) == "default" or string.lower(a[1]) == "def" then
					platformFloat = 0.087
				elseif string.lower(a[1]) == "lower" then
					platformFloat = 0.07
				elseif string.lower(a[1]) == "nofall" then
					platformFloat = -1
				end
			else
				local val = tonumber(a[1])
				platformFloat = val/10
			end
		end
	end)


	local flyspeed = 1
	addCommand("fly", {}, nil, {"speed"}, function(a)
		flyspeed = 1

		if a[1] then
			if tonumber(a[1]) then
				flyspeed = tonumber(a[1])
			end
		end

	end)

	addCommand("gotov3", {"gotopos"}, "Teleport to a Vector3 value. Defaults to 0,0,0", {"x", "y", "z"}, function(a)
		local x = 0
		local y = 0
		local z = 0

		if a[1] then
			if tonumber(a[1]) then
				x = a[1]
			end
		end


		if a[2] then
			if tonumber(a[2]) then
				y = a[2]
			end
		end

		if a[3] then
			if tonumber(a[3]) then
				z = a[3]
			end
		end

		if plr.Character then
			plr.Character:MoveTo(Vector3.new(x,y,z))
		end

	end)

	local esps = {}
	local espcon = nil

	local espcontainer = Instance.new("ForceField", scr)
	espcontainer.Name = rName()
	setName(espcontainer, "EspContainer")
	
	addCommand("locate", {"find"}, "Apply ESP to a player", {"player"}, function(a)
		if a and a[1] then
			local player: Player = getPlayer(a[1])
			if player then
				
				if not esps[player] then
					local plrFolder = Instance.new("ForceField", espcontainer)
					plrFolder.Name = rName()
					setName(plrFolder, player.Name)
					esps[player] = {
						PlayerRemovedEvent = player.Destroying:Once(function()
							if esps[player] then
								disconnectTable(esps[player])
								table.remove(esps, table.find(esps, player))
								
							end
							local folder = getChild(scr, esps[player.Name])
							if folder then folder:Destroy() end
						end),
						ContainerRemoved = plrFolder.Destroying:Once(function()
							if esps[player] then
								disconnectTable(esps[player])
								table.remove(esps, table.find(esps, player))
 
							end
							local folder = getChild(scr, esps[player.Name])
							if folder then folder:Destroy() end
						end)
						
					}
					
					local character = player.Character
					repeat
						wait()
						character = player.Character
					until character
					
					local hum = character:FindFirstChildWhichIsA("Humanoid")
					
					for i, v in pairs(character:GetChildren()) do

						if v:IsA("BasePart") then
							if v.Name ~= "Head" then
								local espAdorn = Instance.new("BoxHandleAdornment", plrFolder)
								espAdorn.Name = rName()
								setName(espAdorn, v.Name)
								espAdorn.Adornee = v
								espAdorn.Size = v.Size
								espAdorn.AdornCullingMode = Enum.AdornCullingMode.Never
								espAdorn.AlwaysOnTop = true
								espAdorn.Color3 = player.TeamColor.Color
								espAdorn.ZIndex = 5
								espAdorn.Transparency = .5
							else
								local espAdorn = Instance.new("BoxHandleAdornment", plrFolder)
								espAdorn.Name = rName()
								setName(espAdorn, v.Name)
								espAdorn.Adornee = v
								if hum and hum.RigType == Enum.HumanoidRigType.R6 then
									espAdorn.Size = Vector3.new(v.Size.Z, v.Size.Y, v.Size.Z)
								else
									espAdorn.Size = v.Size
								end
								espAdorn.AdornCullingMode = Enum.AdornCullingMode.Never
								espAdorn.AlwaysOnTop = true
								espAdorn.Color3 = player.TeamColor.Color
								espAdorn.ZIndex = 5
								espAdorn.Transparency = .5
								local billboard = Instance.new("BillboardGui", plrFolder)
								billboard.Name = rName()
								setName(billboard, "GUI")
								billboard.Size = UDim2.new(2,0,2,0)
								billboard.Adornee = v
								billboard.LightInfluence = 0
								billboard.AlwaysOnTop = true
								local label1 = Instance.new("TextLabel", billboard)
								label1.Name = rName()
								setName(label1, "Text")
								label1.Text = player.Name
								label1.BackgroundTransparency = 1
								label1.Size = UDim2.new(1,0,0.5,0)
								label1.TextColor3 = player.TeamColor.Color
								label1.TextStrokeTransparency = 0
							end
						end
					end
				end
				
				if not espcon then
					espcon = runsrv.Heartbeat:Connect(function()
						local i = 0
						for i, v in pairs(esps) do
							i += 1
							local folder = getChild(scr, i.Name)
							if folder and i.Character then
								for z, c in pairs(folder:GetChildren()) do
									local name = getName(c)
									if name and i.Character:FindFirstChild(name) and string.match(string.lower(c.ClassName), "adornment") then
										c.Adornee = i.Character:FindFirstChild(name)
										c.Color3 = i.TeamColor.Color
									end
								end
							end
						end
						if i == 0 then
							espcon:Disconnect()
							espcon = nil
						end
					end)
				end
			end
		end
	end)
	
	addCommand("unlocate", {}, "Unlocate a player or everyone if [player] is unspecified.", {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1]) 
			if player then
				if esps[player] then
					disconnectTable(esps[player])
					table.remove(esps, table.find(esps, player))
				end
				local folder = getChild(espcontainer, player)
				if folder then folder:Destroy() end
			else
				for i, v in pairs(esps) do
					disconnectTable(v)
					esps[i] = nil
				end
			end
		end
	end)

	addCommand("headsize", {"hs", "hsize"}, "Set [player]'s headsize.", {"player", "size"}, function(a)
		if a[1] and a[2] and tonumber(a[2]) then
			if a[1] == "all" then
				for i, v in pairs(players:GetPlayers()) do
					if v.Character and v.Character:FindFirstChild("Head") and v ~= plr then
						v.Character:FindFirstChild("Head").Size = Vector3.new(tonumber(a[2]), tonumber(a[2]), tonumber(a[2]))
						v.Character:FindFirstChild("Head").CanCollide = false
					end
				end
			else
				local player = getPlayer(a[1])
				if player and player.Character and player.Character:FindFirstChild("Head") then
					player.Character:FindFirstChild("Head").Size = Vector3.new(tonumber(a[2]), tonumber(a[2]), tonumber(a[2]))
					player.Character:FindFirstChild("Head").CanCollide = false
				end
			end
		end
	end)

	addCommand("notouch", {"stoptouch", "disabletouch"}, "Disable the CanTouch property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanTouch == true then
					v.CanTouch = false
				end
			end
		end

	end)

	addCommand("touch", {}, "Enable the CanTouch property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanTouch == false then
					v.CanTouch = true
				end
			end
		end

	end)

	addCommand("query", {}, "Enable the CanQuery property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanQuery == false then
					v.CanQuery = true
				end
			end
		end

	end)

	addCommand("noquery", {"stopquery", "disableqeury"}, "Disable the CanQuery property of your character.", {}, function(a)
		if plr.Character then
			for i, v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanQuery == true then
					v.CanQuery = false
				end
			end
		end

	end)


	local poinths = nil
	addCommand("pointheadsize", {"phs", "poinths"}, "set the headsize of whoever your mouse is on to [size]", {"size"}, function(a)
		if poinths then
			poinths:Disconnect()
			poinths = nil
		end

		for i, v in pairs(players:GetPlayers()) do
			if v.Character:FindFirstChild("Head") then
				v.Character:WaitForChild("Head").Size = Vector3.new(1,1,1)
			end
		end

		if a and a[1] and tonumber(a[1]) then
			local size = tonumber(a[1])
			poinths = runsrv.Heartbeat:Connect(function()
				local new = plr:GetMouse().Target

				for i, v in pairs(players:GetPlayers()) do
					if v.Character:FindFirstChild("Head") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Name ~= new.Parent.Name then
						v.Character:WaitForChild("Head").Size = Vector3.new(1,1,1)
					end
				end

				if new.Parent:FindFirstChildWhichIsA("Humanoid") and new.Parent:FindFirstChild("Head") then
					local head = new.Parent:WaitForChild("Head")
					head.Size = Vector3.new(size,size,size)
				elseif new.Parent:IsA("Accessory") then
					if new.Parent.Parent:FindFirstChildWhichIsA("Humanoid") and new.Parent.Parent:FindFirstChild("Head") then
						local head = new.Parent.Parent:WaitForChild("Head")
						head.Size = Vector3.new(size,size,size)
					end
				end
			end)
		end
	end)

	local wub = nil
	addCommand("walkunbound", {"wub"}, "CFrame your walkspeed", {"speed"}, function(a)
		if a and a[1] and tonumber(a[1]) then
			local char = plr.Character
			local hum = char:FindFirstChildWhichIsA("Humanoid")
			local root = char.PrimaryPart
			if char and hum and root then
				shouldbe = root.Position
				runCmd("cwalk ".. tonumber(a[1]))
				if not wub then
					wub = runsrv.Stepped:Connect(function()
						char:MoveTo(shouldbe)
					end)
				end
			end
		end
	end)

	addCommand("unwalkunbound", {"unwub", "nowub"}, nil, {}, function(a)
		if wub then 
			wub:Disconnect()
			runCmd("cwalk off")
			wub = nil
		end
	end)

	loopAAA = nil
	local ampl = 1
	addCommand("velocitywalk", {"velwalk", "vwalk"}, "Give yourself velocity in the direction you're walking, emulating setting your walkspeed.", {"velocity"}, function(a)
		if a and a[1] and tonumber(a[1]) then
			ampl = tonumber(a[1])
		end

		if plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid") then
			local hum = plr.Character:FindFirstChildWhichIsA("Humanoid")
			local root = plr.Character.PrimaryPart
			if not loopAAA then
				loopAAA = runsrv.Heartbeat:Connect(function()
					if wpressed then
						root.Velocity = root.Velocity + Vector3.new(ampl, ampl, ampl) * hum.MoveDirection * Vector3.new(1,0,1)
					end
				end)
			end

		end
	end)

	addCommand("unvelocitywalk", {"unvelwalk", "unvwalk"}, nil, {}, function(a)
		if loopAAA then
			loopAAA:Disconnect()
			loopAAA = nil
		end
	end)



	local explosionSettings = {
		["ExplosiveHit"] = true,
		["ExPressure"] = math.huge, 
		["ExpRadius"] = math.huge, 
		["DestroyJointRadiusPercent"] = math.huge, 
		["ExplosionDamage"] = math.huge 
	}

	local explosionLagSettings = {
		["ExplosiveHit"] = true,
		["ExPressure"] = 0, 
		["ExpRadius"] = 0, 
		["DestroyJointRadiusPercent"] = 0, 
		["ExplosionDamage"] = 0 
	}

	local gameType = nil
	local vulnerabilities = {}

	vulnerabilities = {
		explosion = {vuln = nil, test = function(remote)
			if remote:IsA("RemoteEvent") and remote.Name == "Hit" then
				if string.lower(remote.Parent.Parent.Name) == "acs_engine" then
					vulnerabilities.explosion.vuln = remote
					notify("Scan Results", "Explosion vuln found! Remote name: ".. remote.Name)
				end
			end
		end},
		damage = {vuln = nil, test = function(remote)
			if remote:IsA("RemoteEvent") and remote.Name == "Damage" then
				if string.lower(remote.Parent.Parent.Name) == "acs_engine" then
					vulnerabilities.damage.vuln = remote
					notify("Scan Results", "Damage vuln found! Remote name: ".. remote.Name)
				end
			end
		end},
		delete = {vuln = nil, test = function(remote)
			if remote:IsA("RemoteEvent") then
				remote:FireServer(plr:WaitForChild("StarterGear"))
				task.wait(plr:GetNetworkPing() + .02)
				if not plr:FindFirstChild("StarterGear") then
					vulnerabilities.delete.vuln = remote
				end

			end
		end},
		condo = {vulns = {}, test = function(remote)
			if remote:IsA("RemoteEvent") then

				-- } veilnoir cons

				if remote.Name == "Connect" and remote.Parent:FindFirstChild("tar") then
					vulnerabilities.condo.vulns.pets_veilnoir = remote
				end

				--} veilnoir cons
			end

			if remote:IsA("RemoteFunction") then
				if remote.Name == "Requestion" and remote.Parent.Name == "Remotes" and remote.Parent.Parent.Name == "cAssets" then
					vulnerabilities.condo.vulns.bang_trl = remote
				end
			end

		end},
		sound = {vulns = {}, test = function(remote)

			-- } ac6

			if remote.Name == "AC6_FE_Sounds" then
				vulnerabilities.sound.vulns[remote] = "AC6"
			end

		end,}
	}

	local function explode(pos, params)
		if vulnerabilities.explosion.vuln then
			vulnerabilities.explosion.vuln:FireServer(pos, nil, Vector3.new(0,0,0), nil, params)
		else
			notify("⚠️ ERROR ⚠️", "Could not create explosion as the required vulnerability was not found.", 5)
		end
	end

	local function damage(target, damage)
		if vulnerabilities.damage.vuln then
			vulnerabilities.damage.vuln:FireServer(target, damage, 0, 0)
		else
			notify("⚠️ ERROR ⚠️", "Could not damage target as the required vulnerability was not found.", 5)
		end
	end

	local function deleteV(target)
		if vulnerabilities.delete.vuln then
			vulnerabilities.delete.vuln:FireServer(target)
		end
	end

	local function playSound(id, parent, volume, pitch, looped, one)
		if not id then return end
		if vulnerabilities.sound.vulns == {} then return end

		parent = parent or workspace
		volume = volume or 1
		pitch = pitch or 1
		looped = looped or false
		id = "rbxassetid://".. id

		for i, v in vulnerabilities.sound.vulns do
			local soundname = math.random(1,9999999999)
			local s, result = pcall(function()
				v:FireServer("newSound", tostring(soundname), parent, id, pitch, volume, looped)
				v:FireServer("playSound", tostring(soundname))
			end)
			if s then
				if one then
					break
				end
			end
		end


	end

	local function condoV(_type, target)
		if not _type and vulnerabilities.condo.vulns == {} then return end

		if _type == "Collar" then
			if vulnerabilities.condo.vulns.pets_veilnoir then
				vulnerabilities.condo.vulns.pets_veilnoir:FireServer(target, "cl")
			end

		elseif _type == "Collab" then
			if vulnerabilities.condo.vulns.pets_veilnoir then
				vulnerabilities.condo.vulns.pets_veilnoir:FireServer(target, "co")
			end
		elseif _type == "Morph" then
			if vulnerabilities.condo.vulns.pets_veilnoir then
				vulnerabilities.condo.vulns.pets_veilnoir:FireServer(target, "mo")
			end
		elseif _type == "Bang" then
			if vulnerabilities.condo.vulns.bang_trl then
				vulnerabilities.condo.vulns.bang_trl:InvokeServer("accepted", target)
			end
		end

	end

	addCommand("scan", {"findremote"}, "Search for vulnerabilities in games. If [path] is specified, it will scan only in the path. Provide [type] to search for a specific type. Use command 'types' to view all vuln types. ", {"type", "path"}, function(a)
		local path = game
		if a and a[2] then
			local s, e = pcall(function()
				path = loadstring("return ".. tostring(a[2]))
			end)
		end
		local vType = nil
		if a and a[1] and vulnerabilities[string.lower(a[1])] then
			vType = a[1]
		end

		if vType and vulnerabilities[vType] then
			for i, v in pairs(path:GetDescendants()) do
				local result = vulnerabilities[vType].test(v)
			end
		else
			for vuln, types in pairs(vulnerabilities) do
				for i, v in pairs(path:GetDescendants()) do
					local result = types.test(v)
				end
			end
		end
	end)

	addCommand("testfield", {}, nil, {}, function()
		local result = textField(scr, "!!!")
		if result then
			warn(result)
		else
			warn("nothing")
		end
	end)
	
	addCommand("gripposition", {"grippos"}, "Set the grip position of all equipped tools to the provided values", {"x","y","z"}, function(a)
		if a and a[1] and a[2] and a[3] and tonumber(a[1]) and tonumber(a[2]) and tonumber(a[3]) then
			local char = plr.Character
			if char then
				for i, v  in pairs(char:GetDescendants()) do
					if v:IsA("Tool") then
						v.Parent = plr.Backpack
						v.GripPos = Vector3.new(tonumber(a[1]), tonumber(a[2]), tonumber(a[3]))
						v.Parent = char
					end
				end
			end
		end
	end)

	addCommand("fieldteleport", {}, "debug", {}, function()
		local result = textField(scr, "player to tp to")
		if result then
			local resultcheck = checkCommandTarget(result)
			print("check Command Target out", resultcheck)
			if not resultcheck then
				print("check Command Target out  not resultcheck")
				local player = getPlayer(result)
				if player then runCmd("to ".. player.Name) print(player.Name) end
			else
				print("check Command Target out  resultcheck")
				for i, v in pairs(resultcheck) do
					runCmd("goto ".. v)
				end
			end

		end

	end)


	local condoVulnMenu = createWindow(scr, "CONDOS", UDim2.new(0.438,0,0.674,0), UDim2.new(0.438,0,1.02,0))
	condoVulnMenu.openFunc = function()
		condoVulnMenu.opent:Play()
	end
	condoVulnMenu.closeFunc = function()
		condoVulnMenu.opent = tweens:Create(condoVulnMenu.main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = condoVulnMenu.main.Position})
		condoVulnMenu.closet:Play()
	end
	condoVulnMenu.restoreFunc = function()
		condoVulnMenu.originalopen:Play()
	end
	condoVulnMenu.close.MouseButton1Up:Connect(function()
		condoVulnMenu.closeFunc()
	end)
	condoVulnMenu.close.MouseButton2Up:Connect(function()
		condoVulnMenu.restoreFunc()
	end)
	local condoVulnCommands = {
		Collar = templateLabel(condoVulnMenu.scrollbar, "Collar", "USE", function()
			local fieldResult = textField(scr, "TARGET")
			if fieldResult then
				local x = checkCommandTarget(fieldResult)
				if not x then
					local player = getPlayer(fieldResult)
					if player then condoV("Collar", player) end
				else
					for i, v in pairs(x) do
						local player = getPlayer(v)
						if player then condoV("Collar", player) end
					end
				end
			end
		end),
		Collab = templateLabel(condoVulnMenu.scrollbar, "Collab", "USE", function()
			local fieldResult = textField(scr, "TARGET")
			if fieldResult then
				local x = checkCommandTarget(fieldResult)
				if not x then
					local player = getPlayer(fieldResult)
					if player then condoV("Collab", player) end
				else
					for i, v in pairs(x) do
						local player = getPlayer(v)
						if player then condoV("Collab", player) end
					end
				end
			end
		end),
		Morph = templateLabel(condoVulnMenu.scrollbar, "Morph", "USE", function()
			local fieldResult = textField(scr, "TARGET")
			if fieldResult then
				local x = checkCommandTarget(fieldResult)
				if not x then
					local player = getPlayer(fieldResult)
					if player then condoV("Morph", player) end
				else
					for i, v in pairs(x) do
						local player = getPlayer(v)
						if player then condoV("Morph", player) end
					end
				end
			end
		end),
		ForceBang = templateLabel(condoVulnMenu.scrollbar, "ForceBang", "USE", function()
			local fieldResult = textField(scr, "TARGET")
			if fieldResult then
				local x = checkCommandTarget(fieldResult)
				if not x then
					local player = getPlayer(fieldResult)
					if player then condoV("Bang", player) end
				else
					for i, v in pairs(x) do
						local player = getPlayer(v)
						if player then condoV("Bang", player) end
					end
				end
			end
		end)
	}

	local soundVulnMenu = createWindow(scr, "SOUND PLAYER", UDim2.new(0.438,0,0.674,0), UDim2.new(0.438,0,1.02,0))
	soundVulnMenu.openFunc = function()
		soundVulnMenu.opent:Play()
	end
	soundVulnMenu.closeFunc = function()
		soundVulnMenu.opent = tweens:Create(soundVulnMenu.main, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = condoVulnMenu.main.Position})
		soundVulnMenu.closet:Play()
	end
	soundVulnMenu.restoreFunc = function()
		soundVulnMenu.originalopen:Play()
	end
	soundVulnMenu.close.MouseButton1Up:Connect(function()
		soundVulnMenu.closeFunc()
	end)
	soundVulnMenu.close.MouseButton2Up:Connect(function()
		soundVulnMenu.restoreFunc()
	end)

	local soundToPlay = 0
	local soundVolume = 1
	local soundPitch = 1
	local soundLooped = false

	local soundVulnCommands = {
		PlaySound = templateLabel(soundVulnMenu.scrollbar, "Play Sound", "PLAY", function()
			playSound(soundToPlay, workspace, soundVolume, soundPitch, soundLooped, true)
		end),
		SetId = templateLabel(soundVulnMenu.scrollbar, "Set Sound ID", "SET", function()
			local fieldResult = textField(scr, "SOUND ID")
			if fieldResult then
				if tonumber(fieldResult) then
					soundToPlay = tonumber(fieldResult)
				end
			end
		end),
		SetVolume = templateLabel(soundVulnMenu.scrollbar, "Set Sound Volume", "SET", function()
			local fieldResult = textField(scr, "VOLUME")
			if fieldResult  then
				if string.match(fieldResult, "huge") then
					soundVolume = math.huge
				elseif tonumber(fieldResult) then
					soundVolume = tonumber(fieldResult)
				end
			end
		end),
		SetPitch = templateLabel(soundVulnMenu.scrollbar, "Set Sound Pitch", "SET", function()
			local fieldResult = textField(scr, "PLAYBACK SPEED")
			if fieldResult  then
				if string.match(fieldResult, "huge") then
					soundPitch = math.huge
				elseif tonumber(fieldResult) then
					soundPitch = tonumber(fieldResult)
				end
			end
		end),
		SetLooped = templateLabel(soundVulnMenu.scrollbar, "Set Sound Looped", "SET", function() 
			local fieldResult = textField(scr, "LOOPED?")
			if fieldResult then
				if checkTrue(fieldResult) then
					soundLooped = true
				else
					soundLooped = false
				end
			end
		end),

	}

	addCommand("vulnmenu", {}, "Open [vuln]'s gui if present.", {"vuln"}, function(a)
		if a and a[1] and vulnerabilities[a[1]] then
			if string.lower(a[1]) == "condo" then
				condoVulnMenu.openFunc()
			elseif string.lower(a[1]) == "sound" then
				soundVulnMenu.openFunc()
			end
		end
	end)

	local clickexplodecon = nil
	addCommand("clickexplode", {}, "Create an explosion where you click. If [distance] is provided, explosions cannot happen within [distance] from your character.", {"distance"}, function(a)
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()

		if clickexplodecon then
			clickexplodecon:Disconnect()
			clickexplodecon = nil
		end

		if a[1] and tonumber(a[1]) then
			clickexplodecon = mouse.Button1Down:Connect(function()
				local pos = mouse.Hit.p
				if (player.Character.PrimaryPart.Position - pos).Magnitude > tonumber(a[1]) then
					explode(pos, explosionSettings)
				end
			end)
		else
			clickexplodecon = mouse.Button1Down:Connect(function()
				local pos = mouse.Hit.p 
				explode(pos, explosionSettings)
			end)
		end
	end)

	local eserverlag = nil
	local eserverlag2 = nil
	local eserverlag3 = nil
	addCommand("eserverlag", {}, "fuck you palmer state roleplay", {}, function()
		runCmd("uneserverlag")

		eserverlag = runsrv.RenderStepped:Connect(function()
			explode(Vector3.new(0,0,0), explosionSettings)
		end)

		eserverlag2 = runsrv.Stepped:Connect(function()
			explode(Vector3.new(0,0,0), explosionSettings)
		end)

		eserverlag3 = runsrv.Heartbeat:Connect(function()
			explode(Vector3.new(0,0,0), explosionSettings)
		end)

	end)

	addCommand("uneserverlag", {}, nil, {}, function(a)

		if eserverlag and eserverlag2 and eserverlag3 then
			eserverlag:Disconnect()
			eserverlag2:Disconnect()
			eserverlag3:Disconnect()

			eserverlag = nil
			eserverlag2 = nil
			eserverlag3 = nil

		end

	end)

	addCommand("decimate", {}, "absolutely wreck the map in 2 seconds", {"x", "y", "reversed?"}, function(a)
		local x = 10
		local y = 10
		local inc = 1

		if a then
			if a[1] and tonumber(a[1]) then
				x = tonumber(a[1])
			end

			if a[2] and tonumber(a[2]) then
				y = tonumber(a[2])
			end

			if a[3] and checkTrue(tostring(a[3])) then
				x = -x
				y = -y
				inc = -1
			end

		end


		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()

		if clickexplodecon then
			clickexplodecon:Disconnect()
			clickexplodecon = nil
			return
		end


		clickexplodecon = mouse.Button1Down:Connect(function()
			local pos = mouse.Hit.p 

			explode(pos)
			for i=1, x, inc do
				pos = pos + Vector3.new(100,0,0)
				explode(pos, explosionSettings)
				local newpos = pos
				for z=1,y,inc do
					newpos = newpos + Vector3.new(0,0,100)
					explode(newpos, explosionSettings)
				end
			end
		end)
	end)

	addCommand("nosit", {}, "Remove your humanoid's ability to sit.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			end
		end
	end)

	addCommand("unnosit", {"allowsit"}, "Allow your humanoid to sit.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			end
		end
	end)

	addCommand("jump", {}, "Make your character jump.", {}, function(a)
		if plr.Character then
			if plr.Character:FindFirstChildWhichIsA("Humanoid") then
				plr.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)

	local usedSeats = {}
	addCommand("spawnseat", {"seatglitch", "invisibleseat", "icg"}, "Grab a static seat and bring it to your location. [tolerance] defaults to 75 and determines the minimum distance that seats must away from you be to grab them.", {"tolerance"}, function(a)

		local tolerance = a[1] or 75

		local seats = {}
		notify("spawnseat", "Grabbing Seats...", 5)

		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Seat") and not v.Parent:FindFirstChildWhichIsA("VehicleSeat") and not v.Parent.Parent:FindFirstChildWhichIsA("VehicleSeat") and v.Anchored and not table.find(usedSeats, v) and plr.Character and plr.Character.PrimaryPart and math.abs(plr.Character.PrimaryPart.Position - v.Position).Magnitude > 75 then
				table.insert(seats, v)
			end
			task.wait()
		end

		notify("spawnseat", "Seats Grabbed!", 5)
		notify("spawnseat", "Sorting in order of distance...", 5)

		table.sort(seats, function(s1, s2)
			local d1 = math.abs(plr.Character.PrimaryPart.Position - s1.Position).Magnitude
			local d2 = math.abs(plr.Character.PrimaryPart.Position - s2.Position).Magnitude

			if d1 < s2 then
				return true
			else
				return false
			end


		end)

		notify("spawnseat", "Sorted seats!", 5)

		table.insert(usedSeats, seats[1])
		local seat = seats[1]




	end)



	addCommand("firerow", {}, "Explode a [x] by [y] grid where you click. If [reversed?] is true then it will move in the opposite way.", {"x", "y", "reversed?"}, function(a)
		local x = 10
		local y = 10
		local inc = 1

		if a then
			if a[1] and tonumber(a[1]) then
				x = tonumber(a[1])
			end

			if a[2] and tonumber(a[2]) then
				y = tonumber(a[2])
			end

			if a[3] and checkTrue(tostring(a[3])) then
				x = -x
				y = -y
				inc = -1
			end

		end


		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()

		if clickexplodecon then
			clickexplodecon:Disconnect()
			clickexplodecon = nil
			return
		end


		clickexplodecon = mouse.Button1Down:Connect(function()
			local pos = mouse.Hit.p 

			explode(pos)
			for i=1, x, inc do
				pos = pos + Vector3.new(100,0,0)
				explode(pos, explosionSettings)
				local newpos = pos
				for z=1,y,inc do
					newpos = newpos + Vector3.new(0,0,100)
					explode(newpos, explosionSettings)
					task.wait()
				end
				task.wait()
			end
		end)
	end)

	addCommand("unclickexplode", {"noclickexplode", "stopclickexplode"}, nil, {}, function(a)
		if clickexplodecon then
			clickexplodecon:Disconnect()
			clickexplodecon = nil
		end
	end)

	addCommand("explosionsettings", {"expsettings"}, "Edit the explosion settings.", {"pressure", "radius", "damage"}, function(a)
		if a then
			if a[1] and not string.find(string.lower(a[1]), "huge")  and tonumber(a[1]) then
				explosionSettings.ExPressure = tonumber(a[1])
			elseif a[1] and string.find(string.lower(a[1]), "huge") then
				explosionSettings.ExPressure = math.huge
			end
			if a[2] and not string.find(string.lower(a[2]), "huge")  and tonumber(a[2]) then
				explosionSettings.ExpRadius = tonumber(a[2])
				explosionSettings.DestroyJointRadiusPercent = tonumber(a[2])
			elseif a[1] and string.find(string.lower(a[2]), "huge") then
				explosionSettings.ExpRadius = math.huge
				explosionSettings.DestroyJointRadiusPercent = math.huge
			end
			if a[3] and not string.find(string.lower(a[3]), "huge")  and tonumber(a[3]) then
				explosionSettings.ExplosionDamage = tonumber(a[3])
			elseif a[3] and string.find(string.lower(a[3]), "huge") then
				explosionSettings.ExplosionDamage = math.huge
			end
		end
	end)

	addCommand("explode", {"ekill"}, "Kill someone with an explosion.", {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then
				if player.Character then
					if player.Character.PrimaryPart then
						explode(player.Character.PrimaryPart.Position, explosionSettings)
					end
				end
			end
		end
	end)

	local explosionloops = {}
	local explosionloopcon = nil

	addCommand("loopexplode", {"loopexp"}, "Loop kill someone with an explosion.", {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then
				table.insert(explosionloops, player.Name)
			end
		end



		if not explosionloopcon then
			explosionloopcon = runsrv.Heartbeat:Connect(function()
				if explosionloops == {} then
					runCmd("unloopexplode")
					explosionloopcon:Disconnect()
					explosionloopcon = nil
				end
				for i, v in pairs(explosionloops) do
					runCmd("explode ".. v)
				end
			end)
		end
	end)

	addCommand("unloopexplode", {"noloopexplode", "stoploopexplode"}, nil, {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then table.remove(explosionloops, table.find(explosionloops, player.Name)) end
		else
			table.clear(explosionloops)
		end
	end)

	local Elaggers = {}
	local ELagLoop = nil
	addCommand("explosionlag", {"explag", "elag"}, "Spam explosions without force, damage or radius on top of someone to lag them. This may lag your client as well.", {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then
				table.insert(Elaggers, player.Name)
			end

			if not ELagLoop then
				ELagLoop = runsrv.Heartbeat:Connect(function()
					if Elaggers == {} then
						runCmd("unelag")
						ELagLoop:Disconnect()
						ELagLoop = nil
					end
					for i, v in pairs(Elaggers) do
						local x = getPlayer(v)
						if x and x.Character and x.Character.PrimaryPart then
							explode(x.Character.PrimaryPart.Position, explosionLagSettings)
						end
					end
				end)
			end
		end
	end)

	addCommand("unexplosionlag", {"unexplag", "unelag"}, nil, {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then table.remove(Elaggers, table.find(Elaggers, player.Name)) end
		else
			table.clear(Elaggers)
		end
	end)

	local killdamage = math.huge

	addCommand("kill", {}, nil, {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
			if player and humanoid then
				repeat damage(humanoid, killdamage) until humanoid.Died
			end
		end
	end)

	addCommand("setkilldamage", {}, "Defaults to math.huge, useful for games that check the damage to ensure it doesn't exceed a value.", {"damage"}, function(a)
		if a and a[1] and tonumber(a[1]) then
			killdamage = tonumber(a[1])
			notify("Damage Set", "Kill damage set to ".. killdamage, 3)
		else
			killdamage = math.huge
			notify("Damage Set", "Kill damage set to math.huge (inf)")
		end
	end)

	local loopkills = {}
	local loopkillcon = nil
	addCommand("loopkill", {}, nil, {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then
				table.insert(loopkills, player.Name)
			end

			if not loopkillcon then
				loopkillcon = runsrv.Heartbeat:Connect(function()
					if loopkills == {} then
						runCmd("unloopkill")
						loopkillcon:Disconnect()
						loopkillcon = nil
					end
					for i, v in pairs(loopkills) do
						runCmd("kill ".. v)
					end
				end)
			end
		end
	end)

	addCommand("unloopkill", {}, nil, {"player"}, function(a)
		if a and a[1] then
			local player = getPlayer(a[1])
			if player then table.remove(loopkills, table.find(loopkills, player.Name)) end
		else
			table.clear(loopkills)
		end
	end)

	addCommand("damage", {}, nil, {"player", "damage"}, function(a)
		if a and a[1] and a[2] then
			local player = getPlayer(a[1])
			local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
			if player and tonumber(a[2]) and humanoid then
				damage(humanoid, tonumber(a[2]))
			end

		end
	end)

	-- uhh add the commands to the dumb stupid thing


	for i, v in pairs(cmds) do
		local tmp = {}
		for z, c in pairs(v["args"]) do
			table.insert(tmp, tostring("[".. c .."]"))
		end
		local aliases = {}
		for z, c in pairs(v["aliases"]) do
			if c ~= tostring(i) then
				table.insert(aliases, tostring("[".. c .."]"))
			end
		end

		local concat = table.concat(tmp, " ")
		local aliasesc = table.concat(aliases, " ")

		local newlabel = blankLabel(commandList.scrollbar, tostring(i).." ".. concat)

		newlabel.main:GetPropertyChangedSignal("GuiState"):Connect(function()
			local newstate = newlabel.main.GuiState

			if newstate == Enum.GuiState.Idle then
				updatemousefollower("", "", false)
			elseif newstate == Enum.GuiState.Hover then
				updatemousefollower(tostring(i).." ".. aliasesc, tostring(v["description"]), true)
			end

		end)

	end


	cmdBar:GetPropertyChangedSignal("Text"):Connect(function()
		local t = cmdBar.Text
		if t ~= "" then
			for i, v in pairs(commandList.scrollbar:GetChildren()) do
				if v:IsA("TextLabel") then
					v.Visible = false
					for z, c in ipairs(cmds[v.Name]["aliases"]) do
						local a = string.sub(string.lower(c),1,string.len(t))
						if string.match(a, t) then
							v.Visible = true
						end
					end
				end
			end
		else
			for i, v in pairs(commandList.scrollbar:GetChildren()) do
				if v:IsA("TextLabel") then
					v.Visible = true
				end
			end

		end
	end)


	uis.InputBegan:Connect(function(inp, e)
		if not e then

			if kbinding then
				binding = false
				if kc(tostring(inp.KeyCode)) then
					kbindselect = inp.KeyCode
					setbindbutton.Text = tostring(inp.KeyCode)
					kbinding = false
				end

			elseif binding then
				kbinding = false
				if kc(tostring(inp.KeyCode)) then
					local label = sttngsL[activeSlabel]
					_settings[activeSlabel] = inp.KeyCode
					label.button.Text = tostring(inp.KeyCode)
					binding = false
					local newData = returnsavedata() 
					saveData(newData)
				end
			else
				if inp.KeyCode == _settings.Prefix then
					cmdBar.Text = ""
					task.wait(.1)
					openCmdLine()
					cmdBar:CaptureFocus()
				end

				for i, v in pairs(keybinds) do
					if inp.KeyCode == v.keybind and not v.toggle then
						runCmd(v.command)
					elseif inp.KeyCode == v.keybind and v.toggle then
						if keybindsStates[i] == false then
							runCmd(v.command)
							keybindsStates[i] = true
						else
							runCmd(v.command2)
							keybindsStates[i] = false
						end
					end
				end
			end
		end
	end)

	wait(.5)
	closeCmdLine()
	--closeCLog:Play()

	notify("Loaded fully!", "ÆZURE has fully loaded!", 5)
	notify("⚠️IMPORTANT⚠️", "This is a beta version of ÆZURE. Expect bugs.", 5)
end
