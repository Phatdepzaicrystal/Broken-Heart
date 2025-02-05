shared.LoaderTitle = "Youtube: Trẩu Roblox";
shared.LoaderKeyFrames = {
	[1] = {
		1,
		10
	},
	[2] = {
		2,
		30
	},
	[3] = {
		3,
		60
	},
	[4] = {
		2,
		100
	}
};
local v2 = {
	LoaderData = {
		Name = shared.LoaderTitle or "A Loader" ,
		Colors = shared.LoaderColors or {
			Main = Color3.fromRGB(40, 40, 40),
			Topic = Color3.fromRGB(72, 161, 227),
			Title = Color3.fromRGB(255, 255, 255),
			LoaderBackground = Color3.fromRGB(28, 28, 28),
			LoaderSplash = Color3.fromRGB(135, 206, 250)
		}
	},
	Keyframes = shared.LoaderKeyFrames or {
		[1] = {
			1,
			10
		},
		[2] = {
			2,
			30
		},
		[3] = {
			3,
			60
		},
		[4] = {
			2,
			100
		}
	}
};
local v3 = {
	[1] = "Đang Tải...",
	[2] = "Đang Kiểm Tra...",
	[3] = "Chuẩn Bị...",
	[4] = "Hoàn Thành..."
};
function TweenObject(v115, v116, v117)
	game.TweenService:Create(v115, TweenInfo.new(v116, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v117):Play();
end
function CreateObject(v118, v119)
	local v120 = Instance.new(v118);
	local v121;
	for v616, v617 in pairs(v119) do
		if (v616 ~= "Parent") then
			v120[v616] = v617;
		else
			v121 = v617;
		end
	end
	v120.Parent = v121;
	return v120;
end
local v4 = game:GetService("Players");
local v5 = v4.LocalPlayer;
local v6 = v5.UserId;
local v7 = v5.Name;
local v8 = Enum.ThumbnailType.HeadShot;
local v9 = Enum.ThumbnailSize.Size420x420;
local v10, v11 = v4:GetUserThumbnailAsync(v6, v8, v9);
local function v12(v123, v124)
	local v125 = Instance.new("UICorner");
	v125.CornerRadius = UDim.new(0, v123);
	v125.Parent = v124;
end
local v13 = CreateObject("ScreenGui", {
	Name = "Core",
	Parent = game.CoreGui
});
local v14 = CreateObject("Frame", {
	Name = "Main",
	Parent = v13,
	BackgroundColor3 = v2.LoaderData.Colors.Main,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	Position = UDim2.new(0.5, 0, 0.5, 0),
	AnchorPoint = Vector2.new(0.5, 0.5),
	Size = UDim2.new(0, 0, 0, 0)
});
v12(15, v14);
local v15 = CreateObject("ImageLabel", {
	Name = "UserImage",
	Parent = v14,
	BackgroundTransparency = 1,
	Image = v10,
	Position = UDim2.new(0, 15, 0, 10),
	Size = UDim2.new(0, 60, 0, 60)
});
v12(30, v15);
local v16 = CreateObject("TextLabel", {
	Name = "UserName",
	Parent = v14,
	BackgroundTransparency = 1,
	Text = "Chào Bạn: "   .. v7   .. "" ,
	Position = UDim2.new(0, 80, 0, 10),
	Size = UDim2.new(0, 240, 0, 50),
	Font = Enum.Font.Gotham,
	TextColor3 = v2.LoaderData.Colors.Title,
	TextSize = 16,
	TextXAlignment = Enum.TextXAlignment.Left
});
local v17 = CreateObject("TextLabel", {
	Name = "Top",
	Parent = v14,
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 30, 0, 70),
	Size = UDim2.new(0, 301, 0, 20),
	Font = Enum.Font.Gotham
});
local v18 = CreateObject("TextLabel", {
	Name = "Title",
	Parent = v14,
	TextTransparency = 1,
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 30, 0, 90),
	Size = UDim2.new(0, 301, 0, 50),
	Font = Enum.Font.GothamBold,
	RichText = true,
	Text = "<b>"   .. v2.LoaderData.Name   .. "</b>" ,
	TextColor3 = v2.LoaderData.Colors.Title,
	TextSize = 18,
	TextXAlignment = Enum.TextXAlignment.Left
});
local v19 = CreateObject("Frame", {
	Name = "BG",
	Parent = v14,
	AnchorPoint = Vector2.new(0.5, 0),
	BackgroundTransparency = 1,
	BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
	BorderSizePixel = 0,
	Position = UDim2.new(0.5, 0, 0, 70),
	Size = UDim2.new(0.85, 0, 0, 24)
});
v12(12, v19);
local v20 = CreateObject("Frame", {
	Name = "Progress",
	Parent = v19,
	BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Size = UDim2.new(0, 0, 0, 24)
});
v12(12, v20);
local function v21(v128)
	local v129 = CreateObject("TextLabel", v128);
	v129.Font = Enum.Font.SourceSansBold;
	v129.TextSize = 24;
	v129.TextStrokeTransparency = 0.5;
	v129.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
	return v129;
end
local v22 = v21({
	Name = "StepLabel",
	Parent = v14,
	BackgroundTransparency = 1,
	Position = UDim2.new(0.5, 0, 1, -25),
	Size = UDim2.new(1, -20, 0, 20),
	Text = "",
	TextColor3 = v2.LoaderData.Colors.Topic,
	TextXAlignment = Enum.TextXAlignment.Center,
	AnchorPoint = Vector2.new(0.5, 0.5)
});
function UpdateStepText(v135)
	v22.Text = v3[v135] or "" ;
end
function UpdatePercentage(v137, v138)
	TweenObject(v20, 0.5, {
		Size = UDim2.new(v137 / 100 , 0, 0, 24)
	});
	UpdateStepText(v138);
end
local v23 = CreateObject("TextButton", {
	Name = "PlayButton",
	Parent = v14,
	BackgroundColor3 = Color3.fromRGB(255, 128, 128),
	Position = UDim2.new(0.5, -50, 0, 140),
	Size = UDim2.new(0, 100, 0, 40),
	Font = Enum.Font.GothamBold,
	Text = "Chơi",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 20,
	TextXAlignment = Enum.TextXAlignment.Center,
	TextYAlignment = Enum.TextYAlignment.Center
});
v12(12, v23);
v23.Visible = false;
v23.MouseButton1Click:Connect(function()
	TweenObject(v14, 0.25, {
		Size = UDim2.new(0, 0, 0, 0)
	});
	wait(0.25);
	v13:Destroy();
end);
TweenObject(v14, 0.25, {
	Size = UDim2.new(0, 350, 0, 160)
});
wait(0.25);
TweenObject(v17, 0.5, {
	TextTransparency = 0
});
TweenObject(v18, 0.5, {
	TextTransparency = 0
});
TweenObject(v19, 0.5, {
	BackgroundTransparency = 0
});
TweenObject(v20, 0.5, {
	BackgroundTransparency = 0
});
for v139, v140 in pairs(v2.Keyframes) do
	wait(v140[1]);
	UpdatePercentage(v140[2], v139);
end
UpdatePercentage(100, 4);
v23.Visible = false;
TweenObject(v23, 0.5, {
	BackgroundTransparency = 1
});
wait(2);
v13:Destroy();
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	repeat
		task.wait();
		if (game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true) then
			if (getgenv().Team == "Marines") then
				for v1724, v1725 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container['Marines'].Frame.TextButton.Activated)) do
					for v1913, v1914 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
						v1914:Fire();
					end
					v1725.Function();
				end
			else
				for v1726, v1727 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container['Pirates'].Frame.TextButton.Activated)) do
					for v1915, v1916 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
						v1916:Fire();
					end
					v1727.Function();
				end
			end
		end
	until (game.Players.LocalPlayer.Team ~= nil) and game:IsLoaded()
end
if  not LPH_OBFUSCATED then
	function LPH_JIT_MAX(...)
		return ...;
	end
	function LPH_NO_VIRTUALIZE(...)
		return ...;
	end
	function LPH_NO_UPVALUES(...)
		return ...;
	end
end
spawn(function()
	for v618, v619 in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
		if ((v619.Name == "Death") or (v619.Name == "Spawn")) then
			v619:Destroy();
		end
	end
end);
spawn(function()
	for v620, v621 in pairs(game:GetDescendants()) do
		if (v621:IsA("ParticleEmitter") or v621:IsA("Trail")) then
			v621.Lifetime = NumberRange.new(0);
		elseif v621:IsA("Explosion") then
			v621.BlastPressure = 1;
			v621.BlastRadius = 1;
		elseif (v621:IsA("Fire") or v621:IsA("SpotLight") or v621:IsA("Smoke")) then
			v621.Enabled = false;
		end
	end
end);
local v25 = game:GetService("UserInputService");
local v26 = game:GetService("TweenService");
local function v27(v141, v142)
	local v143 = nil;
	local v144 = nil;
	local v145 = nil;
	local v146 = nil;
	local function v147(v622)
		local v623 = v622.Position - v145 ;
		local v624 = UDim2.new(v146.X.Scale, v146.X.Offset + v623.X , v146.Y.Scale, v146.Y.Offset + v623.Y );
		local v625 = v26:Create(v142, TweenInfo.new(0.1), {
			Position = v624
		});
		v625:Play();
	end
	v141.InputBegan:Connect(function(v626)
		if ((v626.UserInputType == Enum.UserInputType.MouseButton1) or (v626.UserInputType == Enum.UserInputType.Touch)) then
			v143 = true;
			v145 = v626.Position;
			v146 = v142.Position;
			v626.Changed:Connect(function()
				if (v626.UserInputState == Enum.UserInputState.End) then
					v143 = false;
				end
			end);
		end
	end);
	v141.InputChanged:Connect(function(v627)
		if ((v627.UserInputType == Enum.UserInputType.MouseMovement) or (v627.UserInputType == Enum.UserInputType.Touch)) then
			v144 = v627;
		end
	end);
	v25.InputChanged:Connect(function(v628)
		if ((v628 == v144) and v143) then
			v147(v628);
		end
	end);
end
local v28 = {};
v28.Window = function(v148, v149)
	local v150 = {};
	local v151 = false;
	local v152 = false;
	local v153 = "";
	local v149 = v149 or Enum.KeyCode.RightControl ;
	local v154 = string.gsub(tostring(v149), "Enum.KeyCode.", "");
	local v155 = Instance.new("ScreenGui");
	v155.Name = "Anchor";
	v155.Parent = game.CoreGui;
	v155.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	local v161 = Instance.new("Frame");
	v161.Name = "Main";
	v161.Parent = v155;
	v161.ClipsDescendants = true;
	v161.AnchorPoint = Vector2.new(0.5, 0.5);
	v161.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v161.BackgroundTransparency = 0.3;
	v161.Position = UDim2.new(0.5, 0, 0.5, 0);
	v161.Size = UDim2.new(0, 0, 0, 0);
	v161:TweenSize(UDim2.new(0, 656, 0, 400), "Out", "Quad", 0, true);
	v161:TweenSize(UDim2.new(0, 656, 0, 350), "Out", "Quad", 0, true);
	v161:TweenSize(UDim2.new(0, 555, 0, 352), "Out", "Quad", 0, true);
	local v170 = Instance.new("UIStroke");
	v170.Name = "BtnStroke";
	v170.Parent = v161;
	v170.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	v170.Color = Color3.fromRGB(0, 134, 139);
	v170.LineJoinMode = Enum.LineJoinMode.Round;
	v170.Thickness = 1.7;
	v170.Transparency = 0.5;
	v170.Enabled = true;
	v170.Archivable = true;
	local v182 = Instance.new("UICorner");
	v182.Parent = Page;
	local v184 = Instance.new("ImageLabel");
	v184.Name = "Page";
	v184.Parent = v161;
	v184.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v184.BackgroundTransparency = 4.1;
	v184.Position = UDim2.new(0.400426834, 0, 0.075000003, 0);
	v184.Size = UDim2.new(0, 270, 0, 325);
	v184.Image = "http://www.roblox.com/asset/?id="   .. tostring(91769234055723) ;
	local v192 = Instance.new("UICorner");
	v192.Name = "MCNR";
	v192.Parent = v161;
	local v195 = Instance.new("UICorner");
	v195.Name = "MCNR";
	v195.Parent = BackgroundImage;
	local v198 = Instance.new("UICorner");
	v198.Name = "lol";
	v198.Parent = Dark;
	local v201 = Instance.new("Frame");
	v201.Name = "Top";
	v201.Parent = v161;
	v201.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v201.Size = UDim2.new(0, 556, 0, 30);
	v201.BackgroundTransparency = 1;
	local v207 = Instance.new("UICorner");
	v207.Name = "TCNR";
	v207.Parent = v201;
	v207.CornerRadius = UDim.new(0, 5);
	local v211 = Instance.new("TextLabel");
	v211.Name = "ttittles";
	v211.Parent = v201;
	v211.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	v211.BackgroundTransparency = 1;
	v211.Position = UDim2.new(0, 30, 0.05, 0);
	v211.Size = UDim2.new(0, 255, 0.05, 25);
	v211.Font = Enum.Font.SourceSansBold;
	v211.Text = "Trẩu Roblox";
	v211.TextSize = 17;
	v211.TextColor3 = Color3.fromRGB(0, 134, 139);
	v211.TextXAlignment = Enum.TextXAlignment.Left;
	local v225 = Instance.new("TextLabel");
	v225.Name = "patch";
	v225.Parent = v201;
	v225.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	v225.BackgroundTransparency = 1;
	v225.Position = UDim2.new(0, 200, 0.05, 0);
	v225.Size = UDim2.new(0, 255, 0.05, 25);
	v225.Font = Enum.Font.SourceSansBold;
	v225.Text = " ";
	v225.TextSize = 17;
	v225.TextColor3 = Color3.fromRGB(43, 43, 43);
	v225.TextXAlignment = Enum.TextXAlignment.Left;
	local v237 = Instance.new("Frame");
	v237.Name = "Tab";
	v237.Parent = v161;
	v237.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v237.Position = UDim2.new(0, 14, 0, 33);
	v237.BackgroundTransparency = 1;
	v237.Size = UDim2.new(0, 138, 0, 307);
	local v170 = Instance.new("UIStroke");
	local v244 = Instance.new("ScrollingFrame");
	v244.Name = "ScrollTab";
	v244.Parent = v237;
	v244.Active = true;
	v244.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v244.Position = UDim2.new(0, 0, 0, 0);
	v244.BackgroundTransparency = 1;
	v244.Size = UDim2.new(0, 138, 0, 307);
	v244.ScrollBarThickness = 0;
	local v253 = Instance.new("UICorner");
	v253.Parent = v237;
	v253.CornerRadius = UDim.new(0, 5);
	local v256 = Instance.new("UIListLayout");
	v256.Name = "PLL";
	v256.Parent = v244;
	v256.SortOrder = Enum.SortOrder.LayoutOrder;
	v256.Padding = UDim.new(0, 2);
	local v262 = Instance.new("UIPadding");
	v262.Name = "PPD";
	v262.Parent = v244;
	local v170 = Instance.new("UIStroke");
	local v184 = Instance.new("Frame");
	v184.Name = "Page";
	v184.Parent = v161;
	v184.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v184.Position = UDim2.new(0, 162, 0, 33);
	v184.Size = UDim2.new(0, 380, 0, 308);
	v184.BackgroundTransparency = 1;
	local v265 = Instance.new("UICorner");
	v265.Parent = v184;
	v265.CornerRadius = UDim.new(0, 3);
	local v268 = Instance.new("Frame");
	v268.Name = "MainPage";
	v268.Parent = v184;
	v268.ClipsDescendants = true;
	v268.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	v268.BackgroundTransparency = 1;
	v268.Size = UDim2.new(0, 380, 0, 307);
	local v275 = Instance.new("Folder");
	v275.Name = "PageList";
	v275.Parent = v268;
	local v278 = Instance.new("UIPageLayout");
	v278.Parent = v275;
	v278.SortOrder = Enum.SortOrder.LayoutOrder;
	v278.EasingDirection = Enum.EasingDirection.InOut;
	v278.EasingStyle = Enum.EasingStyle.Quad;
	v278.FillDirection = Enum.FillDirection.Vertical;
	v278.Padding = UDim.new(0, 10);
	v278.TweenTime = 0;
	v278.GamepadInputEnabled = false;
	v278.ScrollWheelInputEnabled = false;
	v278.TouchInputEnabled = false;
	v27(v201, v161);
	v25.InputBegan:Connect(function(v629)
		if (v629.KeyCode == Enum.KeyCode.RightControl) then
			if (v151 == false) then
				v151 = true;
				v161:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0, true);
			else
				v151 = false;
				v161:TweenSize(UDim2.new(0, 556, 0, 350), "Out", "Quad", 0, true);
			end
		end
	end);
	local v292 = {};
	v292.T = function(v630, v631, v632)
		local v633 = Instance.new("UIStroke");
		local v634 = Instance.new("UICorner");
		local v635 = Instance.new("TextButton");
		local v636 = Instance.new("TextLabel");
		local v637 = Instance.new("UICorner");
		local v638 = Instance.new("TextLabel");
		v635.Parent = v244;
		v635.Name = v631   .. "Server" ;
		v635.Text = "";
		v635.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		v635.BackgroundTransparency = 1;
		v635.Size = UDim2.new(0, 136, 0, 30);
		v635.Font = Enum.Font.SourceSansBold;
		v635.TextColor3 = Color3.fromRGB(255, 255, 255);
		v635.TextSize = 12;
		v635.TextTransparency = 0.9;
		v638.Parent = v635;
		v638.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		v638.BackgroundTransparency = 1;
		v638.Position = UDim2.new(0, 30, 0, 2);
		v638.Size = UDim2.new(0, 100, 0, 25);
		v638.Font = Enum.Font.SourceSansBold;
		v638.Text = v631;
		v638.TextColor3 = Color3.fromRGB(255, 255, 255);
		v638.TextSize = 14.5;
		v638.TextXAlignment = Enum.TextXAlignment.Left;
		local v661 = Instance.new("ImageLabel");
		v661.Name = "LogoIDK";
		v661.Parent = v635;
		v661.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		v661.BackgroundTransparency = 1;
		v661.Position = UDim2.new(0, 6, 0, 4.5);
		v661.Size = UDim2.new(0, 20, 0, 20);
		v661.Image = v632;
		v637.CornerRadius = UDim.new(0, 5);
		v637.Parent = v635;
		v634.CornerRadius = UDim.new(0, 5);
		v634.Parent = v635;
		local v673 = Instance.new("ScrollingFrame");
		v673.Name = v631   .. "_Page" ;
		v673.Parent = v275;
		v673.Active = true;
		v673.BackgroundColor3 = Color3.fromRGB(0, 10, 250);
		v673.Position = UDim2.new(0, 0, 0, 0);
		v673.BackgroundTransparency = 1;
		v673.Size = UDim2.new(0, 400, 0, 307);
		v673.ScrollBarThickness = 0;
		local v682 = Instance.new("UICorner");
		v682.Parent = v268;
		v682.CornerRadius = UDim.new(0, 5);
		local v685 = Instance.new("UIPadding");
		local v686 = Instance.new("UIListLayout");
		v685.Parent = v673;
		v686.Padding = UDim.new(0, 3);
		v686.Parent = v673;
		v686.SortOrder = Enum.SortOrder.LayoutOrder;
		local v692 = {};
		function ActivateTab(v883)
			if activeTab then
				activeTab.BackgroundTransparency = 1;
			end
			activeTab = v883;
			activeTab.BackgroundTransparency = 0.8;
			local v885 = string.gsub(v883.Name, "Server", "")   .. "_Page" ;
			for v1435, v1436 in pairs(v275:GetChildren()) do
				if (v1436.Name == v885) then
					v278:JumpTo(v1436);
				end
			end
		end
		for v886, v887 in pairs(v244:GetChildren()) do
			if v887:IsA("TextButton") then
				table.insert(v692, v887);
				v887.MouseButton1Click:Connect(function()
					ActivateTab(v887);
				end);
			end
		end
		if (v152 == false) then
			for v1537, v1538 in ipairs(v692) do
				v26:Create(v1538, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 1
				}):Play();
			end
			ActivateTab(v692[1]);
			v152 = true;
		end
		game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				v673.CanvasSize = UDim2.new(0, 0, 0, v686.AbsoluteContentSize.Y + 20 );
				v244.CanvasSize = UDim2.new(0, 0, 0, v256.AbsoluteContentSize.Y + 20 );
			end);
		end);
		local v693 = {};
		v693.Button = function(v888, v889, v890)
			local v891 = Instance.new("Frame");
			local v892 = Instance.new("UICorner");
			local v893 = Instance.new("TextButton");
			local v894 = Instance.new("UICorner");
			local v895 = Instance.new("Frame");
			local v896 = Instance.new("UICorner");
			v891.Name = "Button";
			v891.Parent = v673;
			v891.BackgroundColor3 = Color3.new(0, 0, 0);
			v891.BackgroundTransparency = 1;
			v891.Size = UDim2.new(0, 358, 0, 33);
			v892.CornerRadius = UDim.new(0, 5);
			v892.Parent = v891;
			v893.Name = "TextBtn";
			v893.Parent = v891;
			v893.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v893.BackgroundTransparency = 0.8;
			v893.Position = UDim2.new(0, 0, 0, 0);
			v893.Size = UDim2.new(0, 379, 0, 33);
			v893.AutoButtonColor = false;
			v893.Font = Enum.Font.SourceSansBold;
			v893.Text = "[ "   .. v889   .. " ]" ;
			v893.TextColor3 = Color3.fromRGB(255, 255, 255);
			v893.TextSize = 15;
			v894.CornerRadius = UDim.new(0, 5);
			v894.Parent = v893;
			v895.Name = "Black";
			v895.Parent = v891;
			v895.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v895.BackgroundTransparency = 1;
			v895.BorderSizePixel = 0;
			v895.Position = UDim2.new(0, 0, 0, 0);
			v895.Size = UDim2.new(0, 379, 0, 33);
			v896.CornerRadius = UDim.new(0, 5);
			v896.Parent = v895;
			v893.MouseEnter:Connect(function()
				v26:Create(v895, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 0.7
				}):Play();
			end);
			v893.MouseLeave:Connect(function()
				v26:Create(v895, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 1
				}):Play();
			end);
			v893.MouseButton1Click:Connect(function()
				v893.TextSize = 0;
				v26:Create(v893, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					TextSize = 15
				}):Play();
				v890();
			end);
		end;
		v693.Toggle = function(v927, v928, v929, v930)
			v929 = v929 or false ;
			local v931 = v929;
			_G.Color = Color3.fromRGB(240, 10, 10);
			_G.TrueColor = Color3.fromRGB(0, 0, 0);
			local v932 = Instance.new("UICorner");
			local v933 = Instance.new("UIPadding");
			local v934 = Instance.new("UIStroke");
			local v935 = Instance.new("TextButton");
			local v936 = Instance.new("UICorner");
			local v937 = Instance.new("TextLabel");
			local v938 = Instance.new("TextButton");
			local v939 = Instance.new("UICorner");
			local v940 = Instance.new("Frame");
			local v941 = Instance.new("UICorner");
			local v942 = Instance.new("ImageLabel");
			v935.Name = "Button";
			v935.Parent = v673;
			v935.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v935.BackgroundTransparency = 0.8;
			v935.Size = UDim2.new(0, 379, 0, 46);
			v935.AutoButtonColor = false;
			v935.Font = Enum.Font.SourceSans;
			v935.Text = "";
			v935.TextColor3 = Color3.fromRGB(0, 0, 0);
			v935.TextSize = 11;
			v936.CornerRadius = UDim.new(0, 5);
			v936.Parent = v935;
			v942.Name = "Icon";
			v942.Parent = v935;
			v942.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v942.BackgroundTransparency = 1;
			v942.Position = UDim2.new(0, 5, 0, 8);
			v942.Size = UDim2.new(0, 30, 0, 30);
			v937.Parent = v935;
			v937.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
			v937.BackgroundTransparency = 1;
			v937.Position = UDim2.new(0, 40, 0, 0);
			v937.Size = UDim2.new(0, 280, 0, 46);
			v937.Font = Enum.Font.SourceSansBold;
			v937.Text = v928;
			v937.TextColor3 = Color3.fromRGB(255, 255, 255);
			v937.TextSize = 15;
			v937.TextXAlignment = Enum.TextXAlignment.Left;
			v938.Name = "ToggleImage";
			v938.Parent = v935;
			v938.BackgroundColor3 = Color3.fromRGB(46, 56, 56);
			v938.BackgroundTransparency = 0.1;
			v938.Position = UDim2.new(0, 320, 0, 13);
			v938.Size = UDim2.new(0, 45, 0, 20);
			v938.Text = "";
			v939.CornerRadius = UDim.new(0, 10);
			v939.Parent = v938;
			v940.Name = "Circle";
			v940.Parent = v938;
			v940.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v940.Position = UDim2.new(0, 2, 0, 2);
			v940.Size = UDim2.new(0, 16, 0, 16);
			v941.CornerRadius = UDim.new(0, 10);
			v941.Parent = v940;
			v938.MouseButton1Click:Connect(function()
				if (v931 == false) then
					v931 = true;
					v934.Color = _G.TrueColor;
					v940:TweenPosition(UDim2.new(0, 27, 0, 2), "Out", "Sine", 0.1, true);
					v26:Create(v940, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = _G.TrueColor
					}):Play();
				else
					v931 = false;
					v934.Color = _G.Color;
					v940:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Sine", 0.1, true);
					v26:Create(v940, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					}):Play();
				end
				pcall(v930, v931);
			end);
			if (v929 == true) then
				v931 = true;
				v934.Color = _G.TrueColor;
				v940:TweenPosition(UDim2.new(0, 27, 0, 2), "Out", "Sine", 0, true);
				v26:Create(v940, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundColor3 = _G.TrueColor
				}):Play();
				pcall(v930, v931);
			end
		end;
		v693.Dropdown = function(v990, v991, v992, v993)
			local v994 = false;
			local v995 = Instance.new("Frame");
			local v996 = Instance.new("UICorner");
			local v997 = Instance.new("UICorner");
			local v998 = Instance.new("UICorner");
			local v999 = Instance.new("TextLabel");
			local v1000 = Instance.new("ScrollingFrame");
			local v1001 = Instance.new("UIListLayout");
			local v1002 = Instance.new("UIPadding");
			local v1003 = Instance.new("TextButton");
			local v1004 = Instance.new("TextButton");
			local v1005 = Instance.new("ImageLabel");
			local v1006 = Instance.new("UIStroke");
			v995.Name = "Dropdown";
			v995.Parent = v673;
			v995.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v995.BackgroundTransparency = 0.8;
			v995.ClipsDescendants = true;
			v995.Size = UDim2.new(0, 379, 0, 38);
			v996.CornerRadius = UDim.new(0, 3);
			v996.Parent = v995;
			local v1015 = Instance.new("ImageLabel");
			v1015.Name = "Icon";
			v1015.Parent = v995;
			v1015.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1015.BackgroundTransparency = 1;
			v1015.Position = UDim2.new(0, 5, 0, 3);
			v1015.Size = UDim2.new(0, 30, 0, 30);
			v999.Name = "DropTitle";
			v999.Parent = v995;
			v999.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v999.BackgroundTransparency = 1;
			v999.Size = UDim2.new(0, 379, 0, 38);
			v999.Font = Enum.Font.SourceSansBold;
			v999.Text = v991;
			v999.TextColor3 = Color3.fromRGB(255, 255, 255);
			v999.TextSize = 15;
			v999.TextXAlignment = Enum.TextXAlignment.Left;
			v999.Position = UDim2.new(0, 40, 0, 0);
			v1004.Name = "SelectItems";
			v1004.Parent = v995;
			v1004.BackgroundColor3 = Color3.fromRGB(46, 56, 56);
			v1004.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1004.BackgroundTransparency = 0.1;
			v1004.Position = UDim2.new(0, 220, 0, 34);
			v1004.Size = UDim2.new(0, 155, 0, 30);
			v1004.Font = Enum.Font.SourceSansBold;
			v1004.TextSize = 12;
			v1004.Text = "Chọn..";
			v1004.ClipsDescendants = true;
			v1004.TextXAlignment = Enum.TextXAlignment.Left;
			local v1047 = Instance.new("UIPadding");
			v1047.Parent = v1004;
			v1047.PaddingLeft = UDim.new(0, 15);
			v1047.PaddingRight = UDim.new(0, 15);
			v1004.AnchorPoint = Vector2.new(0, 3);
			v997.Parent = v1004;
			v997.CornerRadius = UDim.new(0, 5);
			v998.Parent = v1000;
			v998.CornerRadius = UDim.new(0, 5);
			v1000.Name = "DropScroll";
			v1000.Parent = v995;
			v1000.Active = true;
			v1000.BackgroundColor3 = Color3.fromRGB(46, 56, 56);
			v1000.BackgroundTransparency = 0.1;
			v1000.BorderSizePixel = 0;
			v1000.Position = UDim2.new(0, 2, 0, 40);
			v1000.Size = UDim2.new(0, 375, 0, 100);
			v1000.ScrollBarThickness = 3;
			v1001.Parent = v1000;
			v1001.SortOrder = Enum.SortOrder.LayoutOrder;
			v1001.Padding = UDim.new(0, 5);
			v1002.Parent = v1000;
			v1002.PaddingLeft = UDim.new(0, 5);
			v1002.PaddingTop = UDim.new(0, 10);
			for v1440, v1441 in next, v992 do
				local v1442 = Instance.new("TextButton");
				v1442.Name = "Item";
				v1442.Parent = v1000;
				v1442.BackgroundColor3 = Color3.fromRGB(46, 56, 56);
				v1442.BackgroundTransparency = 1;
				v1442.Size = UDim2.new(0, 379, 0, 26);
				v1442.Font = Enum.Font.SourceSansBold;
				v1442.Text = tostring(v1441);
				v1442.TextColor3 = Color3.fromRGB(255, 255, 255);
				v1442.TextSize = 12;
				v1442.TextTransparency = 0.5;
				v1442.TextXAlignment = Enum.TextXAlignment.Center;
				v1442.MouseEnter:Connect(function()
					v26:Create(v1442, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0
					}):Play();
				end);
				v1442.MouseLeave:Connect(function()
					v26:Create(v1442, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0.5
					}):Play();
				end);
				v1442.MouseButton1Click:Connect(function()
					v994 = false;
					v995:TweenSize(UDim2.new(0, 379, 0, 38), "Out", "Quad", 0.1, true);
					v26:Create(v1005, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = 180
					}):Play();
					v993(v1442.Text);
					v1004.Text = v1442.Text;
				end);
			end
			v1000.CanvasSize = UDim2.new(0, 0, 0, v1001.AbsoluteContentSize.Y + 10 );
			v1004.MouseButton1Click:Connect(function()
				if (v994 == false) then
					v994 = true;
					v995:TweenSize(UDim2.new(0, 379, 0, 142), "Out", "Quad", 0.1, true);
					v26:Create(v1005, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = 0
					}):Play();
				else
					v994 = false;
					v995:TweenSize(UDim2.new(0, 379, 0, 38), "Out", "Quad", 0.1, true);
					v26:Create(v1005, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = 180
					}):Play();
				end
			end);
			local v1073 = {};
			v1073.Add = function(v1456, v1457)
				local v1458 = Instance.new("TextButton");
				v1458.Name = "Item";
				v1458.Parent = v1000;
				v1458.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				v1458.BackgroundTransparency = 1;
				v1458.Size = UDim2.new(0, 379, 0, 26);
				v1458.Font = Enum.Font.SourceSansBold;
				v1458.Text = tostring(v1457);
				v1458.TextColor3 = Color3.fromRGB(255, 255, 255);
				v1458.TextSize = 13;
				v1458.TextTransparency = 0.5;
				v1458.MouseEnter:Connect(function()
					v26:Create(v1458, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0
					}):Play();
				end);
				v1458.MouseLeave:Connect(function()
					v26:Create(v1458, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0.5
					}):Play();
				end);
				v1458.MouseButton1Click:Connect(function()
					v994 = false;
					v995:TweenSize(UDim2.new(0, 379, 0, 38), "Out", "Quad", 0.1, true);
					v26:Create(v1005, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = 180
					}):Play();
					v993(v1458.Text);
					v999.Text = v991   .. ": "   .. v1458.Text ;
				end);
			end;
			v1073.Clear = function(v1470)
				v999.Text = tostring(v991)   .. ": " ;
				v994 = false;
				v995:TweenSize(UDim2.new(0, 379, 0, 38), "Out", "Quad", 0.1, true);
				v26:Create(v1005, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Rotation = 180
				}):Play();
				for v1543, v1544 in next, v1000:GetChildren() do
					if v1544:IsA("TextButton") then
						v1544:Destroy();
					end
				end
			end;
			return v1073;
		end;
		v693.Textbox = function(v1076, v1077, v1078, v1079)
			local v1080 = Instance.new("Frame");
			local v1081 = Instance.new("UICorner");
			local v1082 = Instance.new("Frame");
			local v1083 = Instance.new("UICorner");
			local v1084 = Instance.new("TextLabel");
			local v1085 = Instance.new("TextButton");
			local v1086 = Instance.new("TextBox");
			local v1087 = Instance.new("UICorner");
			v1080.Name = "Textbox";
			v1080.Parent = v673;
			v1080.BackgroundColor3 = Color3.new(0, 134, 139);
			v1080.BackgroundTransparency = 0.5;
			v1080.Size = UDim2.new(0, 379, 0, 31);
			v1081.CornerRadius = UDim.new(0, 5);
			v1081.Name = "TextboxCorner";
			v1081.Parent = v1080;
			v1082.Name = "Textboxx";
			v1082.Parent = v1080;
			v1082.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
			v1082.Position = UDim2.new(0, 1, 0, 1);
			v1082.Size = UDim2.new(0, 385, 0, 29);
			v1083.CornerRadius = UDim.new(0, 5);
			v1083.Name = "TextboxxCorner";
			v1083.Parent = v1082;
			v1084.Name = "TextboxLabel";
			v1084.Parent = v1080;
			v1084.BackgroundColor3 = Color3.fromRGB(240, 10, 10);
			v1084.BackgroundTransparency = 1;
			v1084.Position = UDim2.new(0, 15, 0, 0);
			v1084.Text = v1077;
			v1084.Size = UDim2.new(0, 145, 0, 31);
			v1084.Font = Enum.Font.SourceSansBold;
			v1084.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1084.TextSize = 16;
			v1084.TextTransparency = 0;
			v1084.TextXAlignment = Enum.TextXAlignment.Left;
			v1085.Name = "txtbtn";
			v1085.Parent = v1080;
			v1085.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1085.BackgroundTransparency = 1;
			v1085.Position = UDim2.new(0, 1, 0, 1);
			v1085.Size = UDim2.new(0, 379, 0, 29);
			v1085.Font = Enum.Font.SourceSans;
			v1085.Text = "";
			v1085.TextColor3 = Color3.fromRGB(0, 0, 0);
			v1085.TextSize = 14;
			v1086.Name = "RealTextbox";
			v1086.Parent = v1080;
			v1086.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v1086.BackgroundTransparency = 0;
			v1086.Position = UDim2.new(0, 275, 0, 4);
			v1086.Size = UDim2.new(0, 100, 0, 24);
			v1086.Font = Enum.Font.SourceSansBold;
			v1086.Text = "";
			v1086.TextColor3 = Color3.fromRGB(225, 225, 225);
			v1086.TextSize = 11;
			v1086.TextTransparency = 0;
			v1086.FocusLost:Connect(function()
				v1079(v1086.Text);
				if v1078 then
					v1086.Text = "";
				end
			end);
			v1087.CornerRadius = UDim.new(0, 5);
			v1087.Parent = v1086;
		end;
		v693.Label = function(v1142, v1143)
			local v1144 = Instance.new("TextLabel");
			local v1145 = Instance.new("UIPadding");
			local v1146 = {};
			v1144.Name = "Label";
			v1144.Parent = v673;
			v1144.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1144.BackgroundTransparency = 1;
			v1144.Size = UDim2.new(0, 410, 0, 20);
			v1144.Font = Enum.Font.SourceSansBold;
			v1144.TextColor3 = Color3.fromRGB(225, 225, 225);
			v1144.TextSize = 16;
			v1144.Text = v1143;
			v1144.TextXAlignment = Enum.TextXAlignment.Left;
			v1145.PaddingLeft = UDim.new(0, 15);
			v1145.Parent = v1144;
			v1145.Name = "PaddingLabel";
			v1146.Set = function(v1472, v1473)
				v1144.Text = v1473;
			end;
			return v1146;
		end;
		v693.Label1 = function(v1163, v1164)
			local v1165 = Instance.new("TextLabel");
			local v1166 = Instance.new("UIPadding");
			local v1167 = {};
			v1165.Name = "Label1";
			v1165.Parent = v673;
			v1165.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1165.BackgroundTransparency = 1;
			v1165.Size = UDim2.new(0, 410, 0, 20);
			v1165.Font = Enum.Font.SourceSansBold;
			v1165.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1165.TextSize = 15;
			v1165.Text = v1164;
			v1165.TextXAlignment = Enum.TextXAlignment.Left;
			v1166.PaddingLeft = UDim.new(0, 15);
			v1166.Parent = v1165;
			v1166.Name = "PaddingLabel1";
			v1167.Refresh = function(v1475, v1476)
				v1165.Text = v1476;
			end;
			return v1167;
		end;
		v693.Textbox = function(v1184, v1185, v1186, v1187)
			local v1188 = Instance.new("Frame");
			local v1189 = Instance.new("UICorner");
			local v1190 = Instance.new("Frame");
			local v1191 = Instance.new("UICorner");
			local v1192 = Instance.new("TextLabel");
			local v1193 = Instance.new("TextButton");
			local v1194 = Instance.new("TextBox");
			local v1195 = Instance.new("UICorner");
			v1188.Name = "Textbox";
			v1188.Parent = v673;
			v1188.BackgroundColor3 = Color3.new(0, 134, 139);
			v1188.BackgroundTransparency = 0.5;
			v1188.Size = UDim2.new(0, 379, 0, 31);
			v1189.CornerRadius = UDim.new(0, 5);
			v1189.Name = "TextboxCorner";
			v1189.Parent = v1188;
			v1190.Name = "Textboxx";
			v1190.Parent = v1188;
			v1190.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
			v1190.Position = UDim2.new(0, 1, 0, 1);
			v1190.Size = UDim2.new(0, 385, 0, 29);
			v1191.CornerRadius = UDim.new(0, 3);
			v1191.Name = "TextboxxCorner";
			v1191.Parent = v1190;
			v1192.Name = "TextboxLabel";
			v1192.Parent = v1188;
			v1192.BackgroundColor3 = Color3.fromRGB(240, 10, 10);
			v1192.BackgroundTransparency = 1;
			v1192.Position = UDim2.new(0, 15, 0, 0);
			v1192.Text = v1185;
			v1192.Size = UDim2.new(0, 145, 0, 31);
			v1192.Font = Enum.Font.SourceSansBold;
			v1192.TextColor3 = Color3.fromRGB(225, 225, 225);
			v1192.TextSize = 16;
			v1192.TextTransparency = 0;
			v1192.TextXAlignment = Enum.TextXAlignment.Left;
			v1193.Name = "txtbtn";
			v1193.Parent = v1188;
			v1193.BackgroundColor3 = Color3.fromRGB(240, 10, 10);
			v1193.BackgroundTransparency = 1;
			v1193.Position = UDim2.new(0, 1, 0, 1);
			v1193.Size = UDim2.new(0, 379, 0, 29);
			v1193.Font = Enum.Font.SourceSans;
			v1193.Text = "";
			v1193.TextColor3 = Color3.fromRGB(0, 0, 0);
			v1193.TextSize = 14;
			v1194.Name = "RealTextbox";
			v1194.Parent = v1188;
			v1194.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			v1194.BackgroundTransparency = 0;
			v1194.Position = UDim2.new(0, 275, 0, 4);
			v1194.Size = UDim2.new(0, 100, 0, 24);
			v1194.Font = Enum.Font.SourceSansBold;
			v1194.Text = "";
			v1194.TextColor3 = Color3.fromRGB(225, 225, 225);
			v1194.TextSize = 11;
			v1194.TextTransparency = 0;
			v1194.FocusLost:Connect(function()
				v1187(v1194.Text);
				if v1186 then
					v1194.Text = "";
				end
			end);
			v1195.CornerRadius = UDim.new(0, 3);
			v1195.Parent = v1194;
		end;
		v693.Label = function(v1250, v1251)
			local v1252 = Instance.new("TextLabel");
			local v1253 = Instance.new("UIPadding");
			local v1254 = {};
			v1252.Name = "Label";
			v1252.Parent = v673;
			v1252.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1252.BackgroundTransparency = 1;
			v1252.Size = UDim2.new(0, 410, 0, 30);
			v1252.Font = Enum.Font.SourceSansBold;
			v1252.TextColor3 = Color3.fromRGB(225, 225, 225);
			v1252.TextSize = 14;
			v1252.Text = v1251;
			v1252.TextXAlignment = Enum.TextXAlignment.Left;
			v1253.PaddingLeft = UDim.new(0, 15);
			v1253.Parent = v1252;
			v1253.Name = "PaddingLabel";
			v1254.Set = function(v1478, v1479)
				v1252.Text = v1479;
			end;
			return v1254;
		end;
		v693.Label1 = function(v1271, v1272)
			local v1273 = Instance.new("TextLabel");
			local v1274 = Instance.new("UIPadding");
			local v1275 = {};
			v1273.Name = "Label1";
			v1273.Parent = v673;
			v1273.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1273.BackgroundTransparency = 1;
			v1273.Size = UDim2.new(0, 410, 0, 20);
			v1273.Font = Enum.Font.SourceSansBold;
			v1273.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1273.TextSize = 15;
			v1273.Text = v1272;
			v1273.RichText = true;
			v1273.TextXAlignment = Enum.TextXAlignment.Left;
			v1274.PaddingLeft = UDim.new(0, 15);
			v1274.Parent = v1273;
			v1274.Name = "PaddingLabel1";
			v1275.Refresh = function(v1481, v1482)
				v1273.Text = v1482;
			end;
			return v1275;
		end;
		v693.Dis = function(v1293, v1294, v1295)
			local v1296 = Instance.new("TextLabel");
			local v1297 = Instance.new("UIPadding");
			local v1298 = {};
			v1296.Name = "Label1";
			v1296.Parent = v673;
			v1296.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1296.BackgroundTransparency = 1;
			v1296.Size = UDim2.new(0, 410, 0, 20);
			v1296.Font = Enum.Font.SourceSansBold;
			v1296.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1296.TextSize = 15;
			v1296.Text = v1294;
			v1296.TextXAlignment = Enum.TextXAlignment.Left;
			Labeld.Name = "Labeld";
			Labeld.Parent = v673;
			Labeld.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Labeld.BackgroundTransparency = 1;
			Labeld.Size = UDim2.new(0, 410, 0, 20);
			Labeld.Font = Enum.Font.SourceSansBold;
			Labeld.TextColor3 = Color3.fromRGB(240, 10, 10);
			Labeld.TextSize = 15;
			Labeld.Text = v1295 or "" ;
			Labeld.TextXAlignment = Enum.TextXAlignment.Left;
			v1297.PaddingLeft = UDim.new(0, 15);
			v1297.Parent = v1296;
			v1297.Name = "PaddingLabel1";
			v1298.Refresh = function(v1484, v1485)
				v1296.Text = v1485;
			end;
			return v1298;
		end;
		v693.Seperator = function(v1325, v1326)
			local v1327 = Instance.new("Frame");
			local v1328 = Instance.new("Frame");
			local v1329 = Instance.new("TextLabel");
			local v1330 = Instance.new("Frame");
			v1327.Name = "Seperator";
			v1327.Parent = v673;
			v1327.BackgroundColor3 = Color3.fromRGB(43, 43, 43);
			v1327.BackgroundTransparency = 0.8;
			v1327.Size = UDim2.new(0, 379, 0, 30);
			v1329.Name = "Sep2";
			v1329.Parent = v1327;
			v1329.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			v1329.BackgroundTransparency = 1;
			v1329.Position = UDim2.new(0, 0, 0, 0);
			v1329.Size = UDim2.new(0, 379, 0, 30);
			v1329.Font = Enum.Font.SourceSansBold;
			v1329.Text = " "   .. v1326   .. " " ;
			v1329.TextColor3 = Color3.fromRGB(255, 255, 255);
			v1329.TextSize = 14;
		end;
		v693.UserAnchor = function(v1347)
		end;
		return v693;
	end;
	return v292;
end;
local v30 = Instance.new("ScreenGui");
local v31 = Instance.new("ImageButton");
local v32 = Instance.new("UICorner");
v30.Name = "ToggleUI";
v30.Parent = game.CoreGui;
v30.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v31.Name = "ToggleButton";
v31.Parent = v30;
v31.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
v31.BorderSizePixel = 0;
v31.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0);
v31.Size = UDim2.new(0, 53.5, 0, 53.5);
v31.BackgroundTransparency = 1;
v31.Image = "rbxassetid://138689078158833";
v31.Draggable = true;
v31.MouseButton1Click:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game);
	game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game);
end);
v32.CornerRadius = UDim.new(0, 10);
v32.Parent = v31;
if (game.PlaceId == 2753915549) then
	World1 = true;
elseif (game.PlaceId == 4442272183) then
	World2 = true;
elseif (game.PlaceId == 7449423635) then
	World3 = true;
end
function CheckQuest()
	MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value;
	if World1 then
		if ((MyLevel == 1) or (MyLevel <= 9)) then
			Mon = "Bandit";
			LevelQuest = 1;
			NameQuest = "BanditQuest1";
			NameMon = "Bandit";
			CFrameQuest = CFrame.new(1059, 17, 1546);
			CFrameMon = CFrame.new(943, 45, 1562);
		elseif ((MyLevel == 10) or (MyLevel <= 14)) then
			Mon = "Monkey";
			LevelQuest = 1;
			NameQuest = "JungleQuest";
			NameMon = "Monkey";
			CFrameQuest = CFrame.new( -1598, 37, 153);
			CFrameMon = CFrame.new( -1524, 50, 37);
		elseif ((MyLevel == 15) or (MyLevel <= 29)) then
			Mon = "Gorilla";
			LevelQuest = 2;
			NameQuest = "JungleQuest";
			NameMon = "Gorilla";
			CFrameQuest = CFrame.new( -1598, 37, 153);
			CFrameMon = CFrame.new( -1128, 40, -451);
		elseif ((MyLevel == 30) or (MyLevel <= 39)) then
			Mon = "Pirate";
			LevelQuest = 1;
			NameQuest = "BuggyQuest1";
			NameMon = "Pirate";
			CFrameQuest = CFrame.new( -1140, 4, 3829);
			CFrameMon = CFrame.new( -1262, 40, 3905);
		elseif ((MyLevel == 40) or (MyLevel <= 59)) then
			Mon = "Brute";
			LevelQuest = 2;
			NameQuest = "BuggyQuest1";
			NameMon = "Brute";
			CFrameQuest = CFrame.new( -1140, 4, 3829);
			CFrameMon = CFrame.new( -976, 55, 4304);
		elseif ((MyLevel == 60) or (MyLevel <= 74)) then
			Mon = "Desert Bandit";
			LevelQuest = 1;
			NameQuest = "DesertQuest";
			NameMon = "Desert Bandit";
			CFrameQuest = CFrame.new(897, 6, 4389);
			CFrameMon = CFrame.new(924, 7, 4482);
		elseif ((MyLevel == 75) or (MyLevel <= 89)) then
			Mon = "Desert Officer";
			LevelQuest = 2;
			NameQuest = "DesertQuest";
			NameMon = "Desert Officer";
			CFrameQuest = CFrame.new(897, 6, 4389);
			CFrameMon = CFrame.new(1608, 9, 4371);
		elseif ((MyLevel == 90) or (MyLevel <= 99)) then
			Mon = "Snow Bandit";
			LevelQuest = 1;
			NameQuest = "SnowQuest";
			NameMon = "Snow Bandit";
			CFrameQuest = CFrame.new(1385, 87, -1298);
			CFrameMon = CFrame.new(1362, 120, -1531);
		elseif ((MyLevel == 100) or (MyLevel <= 119)) then
			Mon = "Snowman";
			LevelQuest = 2;
			NameQuest = "SnowQuest";
			NameMon = "Snowman";
			CFrameQuest = CFrame.new(1385, 87, -1298);
			CFrameMon = CFrame.new(1243, 140, -1437);
		elseif ((MyLevel == 120) or (MyLevel <= 149)) then
			Mon = "Chief Petty Officer";
			LevelQuest = 1;
			NameQuest = "MarineQuest2";
			NameMon = "Chief Petty Officer";
			CFrameQuest = CFrame.new( -5035, 29, 4326);
			CFrameMon = CFrame.new( -4881, 23, 4274);
		elseif ((MyLevel == 150) or (MyLevel <= 174)) then
			Mon = "Sky Bandit";
			LevelQuest = 1;
			NameQuest = "SkyQuest";
			NameMon = "Sky Bandit";
			CFrameQuest = CFrame.new( -4844, 718, -2621);
			CFrameMon = CFrame.new( -4953, 296, -2899);
		elseif ((MyLevel == 175) or (MyLevel <= 189)) then
			Mon = "Dark Master";
			LevelQuest = 2;
			NameQuest = "SkyQuest";
			NameMon = "Dark Master";
			CFrameQuest = CFrame.new( -4844, 718, -2621);
			CFrameMon = CFrame.new( -5260, 391, -2229);
		elseif ((MyLevel == 190) or (MyLevel <= 209)) then
			Mon = "Prisoner";
			LevelQuest = 1;
			NameQuest = "PrisonerQuest";
			NameMon = "Prisoner";
			CFrameQuest = CFrame.new(5306, 2, 477);
			CFrameMon = CFrame.new(5099, "-0", 474);
		elseif ((MyLevel == 210) or (MyLevel <= 249)) then
			Mon = "Dangerous Prisoner";
			LevelQuest = 2;
			NameQuest = "PrisonerQuest";
			NameMon = "Dangerous Prisoner";
			CFrameQuest = CFrame.new(5306, 2, 477);
			CFrameMon = CFrame.new(5655, 16, 866);
		elseif ((MyLevel == 250) or (MyLevel <= 274)) then
			Mon = "Toga Warrior";
			LevelQuest = 1;
			NameQuest = "ColosseumQuest";
			NameMon = "Toga Warrior";
			CFrameQuest = CFrame.new( -1581, 7, -2982);
			CFrameMon = CFrame.new( -1820, 51, -2741);
		elseif ((MyLevel == 275) or (MyLevel <= 299)) then
			Mon = "Gladiator";
			LevelQuest = 2;
			NameQuest = "ColosseumQuest";
			NameMon = "Gladiator";
			CFrameQuest = CFrame.new( -1581, 7, -2982);
			CFrameMon = CFrame.new( -1268, 30, -2996);
		elseif ((MyLevel == 300) or (MyLevel <= 324)) then
			Mon = "Military Soldier";
			LevelQuest = 1;
			NameQuest = "MagmaQuest";
			NameMon = "Military Soldier";
			CFrameQuest = CFrame.new( -5319, 12, 8515);
			CFrameMon = CFrame.new( -5335, 46, 8638);
		elseif ((MyLevel == 325) or (MyLevel <= 374)) then
			Mon = "Military Spy";
			LevelQuest = 2;
			NameQuest = "MagmaQuest";
			NameMon = "Military Spy";
			CFrameQuest = CFrame.new( -5319, 12, 8515);
			CFrameMon = CFrame.new( -5803, 86, 8829);
		elseif ((MyLevel == 375) or (MyLevel <= 399)) then
			Mon = "Fishman Warrior";
			LevelQuest = 1;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Warrior";
			CFrameQuest = CFrame.new(61122, 18, 1567);
			CFrameMon = CFrame.new(60998, 50, 1534);
		elseif ((MyLevel == 400) or (MyLevel <= 449)) then
			Mon = "Fishman Commando";
			LevelQuest = 2;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Commando";
			CFrameQuest = CFrame.new(61122, 18, 1567);
			CFrameMon = CFrame.new(61866, 55, 1655);
		elseif ((MyLevel == 450) or (MyLevel <= 474)) then
			Mon = "God's Guard";
			LevelQuest = 1;
			NameQuest = "SkyExp1Quest";
			NameMon = "God's Guard";
			CFrameQuest = CFrame.new( -4720, 846, -1951);
			CFrameMon = CFrame.new( -4720, 846, -1951);
		elseif ((MyLevel == 475) or (MyLevel <= 524)) then
			Mon = "Shanda";
			LevelQuest = 2;
			NameQuest = "SkyExp1Quest";
			NameMon = "Shanda";
			CFrameQuest = CFrame.new( -7861, 5545, -381);
			CFrameMon = CFrame.new( -7741, 5580, -395);
		elseif ((MyLevel == 525) or (MyLevel <= 549)) then
			Mon = "Royal Squad";
			LevelQuest = 1;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Squad";
			CFrameQuest = CFrame.new( -7903, 5636, -1412);
			CFrameMon = CFrame.new( -7727, 5650, -1410);
		elseif ((MyLevel == 550) or (MyLevel <= 624)) then
			Mon = "Royal Soldier";
			LevelQuest = 2;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Soldier";
			CFrameQuest = CFrame.new( -7903, 5636, -1412);
			CFrameMon = CFrame.new( -7894, 5640, -1629);
		elseif ((MyLevel == 625) or (MyLevel <= 649)) then
			Mon = "Galley Pirate";
			LevelQuest = 1;
			NameQuest = "FountainQuest";
			NameMon = "Galley Pirate";
			CFrameQuest = CFrame.new(5258, 39, 4052);
			CFrameMon = CFrame.new(5391, 70, 4023);
		elseif (MyLevel >= 650) then
			Mon = "Galley Captain";
			LevelQuest = 2;
			NameQuest = "FountainQuest";
			NameMon = "Galley Captain";
			CFrameQuest = CFrame.new(5258, 39, 4052);
			CFrameMon = CFrame.new(5985, 70, 4790);
		end
	elseif World2 then
		if ((MyLevel == 700) or (MyLevel <= 724)) then
			Mon = "Raider";
			LevelQuest = 1;
			NameQuest = "Area1Quest";
			NameMon = "Raider";
			CFrameQuest = CFrame.new( -427, 73, 1835);
			CFrameMon = CFrame.new( -614, 90, 2240);
		elseif ((MyLevel == 725) or (MyLevel <= 774)) then
			Mon = "Mercenary";
			LevelQuest = 2;
			NameQuest = "Area1Quest";
			NameMon = "Mercenary";
			CFrameQuest = CFrame.new( -427, 73, 1835);
			CFrameMon = CFrame.new( -867, 110, 1621);
		elseif ((MyLevel == 775) or (MyLevel <= 874)) then
			Mon = "Swan Pirate";
			LevelQuest = 1;
			NameQuest = "Area2Quest";
			NameMon = "Swan Pirate";
			CFrameQuest = CFrame.new(635, 73, 919);
			CFrameMon = CFrame.new(635, 73, 919);
		elseif ((MyLevel == 875) or (MyLevel <= 899)) then
			Mon = "Marine Lieutenant";
			LevelQuest = 1;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Lieutenant";
			CFrameQuest = CFrame.new( -2441, 73, -3219);
			CFrameMon = CFrame.new( -2552, 110, -3050);
		elseif ((MyLevel == 900) or (MyLevel <= 949)) then
			Mon = "Marine Captain";
			LevelQuest = 2;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Captain";
			CFrameQuest = CFrame.new( -2441, 73, -3219);
			CFrameMon = CFrame.new( -1695, 110, -3299);
		elseif ((MyLevel == 950) or (MyLevel <= 974)) then
			Mon = "Zombie";
			LevelQuest = 1;
			NameQuest = "ZombieQuest";
			NameMon = "Zombie";
			CFrameQuest = CFrame.new( -5495, 48, -794);
			CFrameMon = CFrame.new( -5715, 90, -917);
		elseif ((MyLevel == 975) or (MyLevel <= 999)) then
			Mon = "Vampire";
			LevelQuest = 2;
			NameQuest = "ZombieQuest";
			NameMon = "Vampire";
			CFrameQuest = CFrame.new( -5495, 48, -794);
			CFrameMon = CFrame.new( -6027, 50, -1130);
		elseif ((MyLevel == 1000) or (MyLevel <= 1049)) then
			Mon = "Snow Trooper";
			LevelQuest = 1;
			NameQuest = "SnowMountainQuest";
			NameMon = "Snow Trooper";
			CFrameQuest = CFrame.new(607, 401, -5371);
			CFrameMon = CFrame.new(445, 440, -5175);
		elseif ((MyLevel == 1050) or (MyLevel <= 1099)) then
			Mon = "Winter Warrior";
			LevelQuest = 2;
			NameQuest = "SnowMountainQuest";
			NameMon = "Winter Warrior";
			CFrameQuest = CFrame.new(607, 401, -5371);
			CFrameMon = CFrame.new(1224, 460, -5332);
		elseif ((MyLevel == 1100) or (MyLevel <= 1124)) then
			Mon = "Lab Subordinate";
			LevelQuest = 1;
			NameQuest = "IceSideQuest";
			NameMon = "Lab Subordinate";
			CFrameQuest = CFrame.new( -6061, 16, -4904);
			CFrameMon = CFrame.new( -5941, 50, -4322);
		elseif ((MyLevel == 1125) or (MyLevel <= 1174)) then
			Mon = "Horned Warrior";
			LevelQuest = 2;
			NameQuest = "IceSideQuest";
			NameMon = "Horned Warrior";
			CFrameQuest = CFrame.new( -6061, 16, -4904);
			CFrameMon = CFrame.new( -6306, 50, -5752);
		elseif ((MyLevel == 1175) or (MyLevel <= 1199)) then
			Mon = "Magma Ninja";
			LevelQuest = 1;
			NameQuest = "FireSideQuest";
			NameMon = "Magma Ninja";
			CFrameQuest = CFrame.new( -5430, 16, -5298);
			CFrameMon = CFrame.new( -5233, 60, -6227);
		elseif ((MyLevel == 1200) or (MyLevel <= 1249)) then
			Mon = "Lava Pirate";
			LevelQuest = 2;
			NameQuest = "FireSideQuest";
			NameMon = "Lava Pirate";
			CFrameQuest = CFrame.new( -5430, 16, -5298);
			CFrameMon = CFrame.new( -4955, 60, -4836);
		elseif ((MyLevel == 1250) or (MyLevel <= 1274)) then
			Mon = "Ship Deckhand";
			LevelQuest = 1;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Deckhand";
			CFrameQuest = CFrame.new(1033, 125, 32909);
			CFrameMon = CFrame.new(1033, 125, 32909);
		elseif ((MyLevel == 1275) or (MyLevel <= 1299)) then
			Mon = "Ship Engineer";
			LevelQuest = 2;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Engineer";
			CFrameQuest = CFrame.new(1033, 125, 32909);
			CFrameMon = CFrame.new(809, 80, 33090);
		elseif ((MyLevel == 1300) or (MyLevel <= 1324)) then
			Mon = "Ship Steward";
			LevelQuest = 1;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Steward";
			CFrameQuest = CFrame.new(973, 125, 33245);
			CFrameMon = CFrame.new(838, 160, 33408);
		elseif ((MyLevel == 1325) or (MyLevel <= 1349)) then
			Mon = "Ship Officer";
			LevelQuest = 2;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Officer";
			CFrameQuest = CFrame.new(973, 125, 33245);
			CFrameMon = CFrame.new(1238, 220, 33148);
		elseif ((MyLevel == 1350) or (MyLevel <= 1374)) then
			Mon = "Arctic Warrior";
			LevelQuest = 1;
			NameQuest = "FrostQuest";
			NameMon = "Arctic Warrior";
			CFrameQuest = CFrame.new(5668, 28, -6484);
			CFrameMon = CFrame.new(5836, 80, -6257);
		elseif ((MyLevel == 1375) or (MyLevel <= 1424)) then
			Mon = "Snow Lurker";
			LevelQuest = 2;
			NameQuest = "FrostQuest";
			NameMon = "Snow Lurker";
			CFrameQuest = CFrame.new(5668, 28, -6484);
			CFrameMon = CFrame.new(5700, 80, -6724);
		elseif ((MyLevel == 1425) or (MyLevel <= 1449)) then
			Mon = "Sea Soldier";
			LevelQuest = 1;
			NameQuest = "ForgottenQuest";
			NameMon = "Sea Soldier";
			CFrameQuest = CFrame.new( -3056, 240, -10145);
			CFrameMon = CFrame.new( -2583, 80, -9821);
		elseif (MyLevel >= 1450) then
			Mon = "Water Fighter";
			LevelQuest = 2;
			NameQuest = "ForgottenQuest";
			NameMon = "Water Fighter";
			CFrameQuest = CFrame.new( -3056, 240, -10145);
			CFrameMon = CFrame.new( -3339, 290, -10412);
		end
	elseif World3 then
		if ((MyLevel == 1500) or (MyLevel <= 1524)) then
			Mon = "Pirate Millionaire";
			LevelQuest = 1;
			NameQuest = "PiratePortQuest";
			NameMon = "Pirate Millionaire";
			CFrameQuest = CFrame.new( -291, 44, 5580);
			CFrameMon = CFrame.new( -44, 70, 5623);
		elseif ((MyLevel == 1525) or (MyLevel <= 1574)) then
			Mon = "Pistol Billionaire";
			LevelQuest = 2;
			NameQuest = "PiratePortQuest";
			NameMon = "Pistol Billionaire";
			CFrameQuest = CFrame.new( -291, 44, 5580);
			CFrameMon = CFrame.new(219, 105, 6018);
		elseif ((MyLevel == 1575) or (MyLevel <= 1599)) then
			Mon = "Dragon Crew Warrior";
			LevelQuest = 1;
			NameQuest = "AmazonQuest";
			NameMon = "Dragon Crew Warrior";
			CFrameQuest = CFrame.new(5834, 51, -1103);
			CFrameMon = CFrame.new(5992, 90, -1581);
		elseif ((MyLevel == 1600) or (MyLevel <= 1624)) then
			Mon = "Dragon Crew Archer";
			NameQuest = "AmazonQuest";
			LevelQuest = 2;
			NameMon = "Dragon Crew Archer";
			CFrameQuest = CFrame.new(5834, 51, -1103);
			CFrameMon = CFrame.new(6472, 370, -151);
		elseif ((MyLevel == 1625) or (MyLevel <= 1649)) then
			Mon = "Female Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 1;
			NameMon = "Female Islander";
			CFrameQuest = CFrame.new(5448, 602, 748);
			CFrameMon = CFrame.new(4836, 740, 928);
		elseif ((MyLevel == 1650) or (MyLevel <= 1699)) then
			Mon = "Giant Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 2;
			NameMon = "Giant Islander";
			CFrameQuest = CFrame.new(5448, 602, 748);
			CFrameMon = CFrame.new(4784, 660, 155);
		elseif ((MyLevel == 1700) or (MyLevel <= 1724)) then
			Mon = "Marine Commodore";
			LevelQuest = 1;
			NameQuest = "MarineTreeIsland";
			NameMon = "Marine Commodore";
			CFrameQuest = CFrame.new(2180, 29, -6738);
			CFrameMon = CFrame.new(3156, 120, -7837);
		elseif ((MyLevel == 1725) or (MyLevel <= 1774)) then
			Mon = "Marine Rear Admiral";
			NameMon = "Marine Rear Admiral";
			NameQuest = "MarineTreeIsland";
			LevelQuest = 2;
			CFrameQuest = CFrame.new(2180, 29, -6738);
			CFrameMon = CFrame.new(3205, 120, -6742);
		elseif ((MyLevel == 1775) or (MyLevel <= 1799)) then
			Mon = "Fishman Raider";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Raider";
			CFrameQuest = CFrame.new( -10581, 332, -8758);
			CFrameMon = CFrame.new( -10550, 380, -8574);
		elseif ((MyLevel == 1800) or (MyLevel <= 1824)) then
			Mon = "Fishman Captain";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Captain";
			CFrameQuest = CFrame.new( -10581, 332, -8758);
			CFrameMon = CFrame.new( -10764, 380, -8799);
		elseif ((MyLevel == 1825) or (MyLevel <= 1849)) then
			Mon = "Forest Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland";
			NameMon = "Forest Pirate";
			CFrameQuest = CFrame.new( -13233, 332, -7626);
			CFrameMon = CFrame.new( -13335, 380, -7660);
		elseif ((MyLevel == 1850) or (MyLevel <= 1899)) then
			Mon = "Mythological Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland";
			NameMon = "Mythological Pirate";
			CFrameQuest = CFrame.new( -13233, 332, -7626);
			CFrameMon = CFrame.new( -13844, 520, -7016);
		elseif ((MyLevel == 1900) or (MyLevel <= 1924)) then
			Mon = "Jungle Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland2";
			NameMon = "Jungle Pirate";
			CFrameQuest = CFrame.new( -12682, 391, -9901);
			CFrameMon = CFrame.new( -12166, 380, -10375);
		elseif ((MyLevel == 1925) or (MyLevel <= 1974)) then
			Mon = "Musketeer Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland2";
			NameMon = "Musketeer Pirate";
			CFrameQuest = CFrame.new( -12682, 391, -9901);
			CFrameMon = CFrame.new( -13098, 450, -9831);
		elseif ((MyLevel == 1975) or (MyLevel <= 1999)) then
			Mon = "Reborn Skeleton";
			LevelQuest = 1;
			NameQuest = "HauntedQuest1";
			NameMon = "Reborn Skeleton";
			CFrameQuest = CFrame.new( -9481, 142, 5565);
			CFrameMon = CFrame.new( -8680, 190, 5852);
		elseif ((MyLevel == 2000) or (MyLevel <= 2024)) then
			Mon = "Living Zombie";
			LevelQuest = 2;
			NameQuest = "HauntedQuest1";
			NameMon = "Living Zombie";
			CFrameQuest = CFrame.new( -9481, 142, 5565);
			CFrameMon = CFrame.new( -10144, 140, 5932);
		elseif ((MyLevel == 2025) or (MyLevel <= 2049)) then
			Mon = "Demonic Soul";
			LevelQuest = 1;
			NameQuest = "HauntedQuest2";
			NameMon = "Demonic Soul";
			CFrameQuest = CFrame.new( -9515, 172, 607);
			CFrameMon = CFrame.new( -9275, 210, 6166);
		elseif ((MyLevel == 2050) or (MyLevel <= 2074)) then
			Mon = "Posessed Mummy";
			LevelQuest = 2;
			NameQuest = "HauntedQuest2";
			NameMon = "Posessed Mummy";
			CFrameQuest = CFrame.new( -9515, 172, 607);
			CFrameMon = CFrame.new( -9442, 60, 6304);
		elseif ((MyLevel == 2075) or (MyLevel <= 2099)) then
			Mon = "Peanut Scout";
			LevelQuest = 1;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut Scout";
			CFrameQuest = CFrame.new( -2104, 38, -10194);
			CFrameMon = CFrame.new( -1870, 100, -10225);
		elseif ((MyLevel == 2100) or (MyLevel <= 2124)) then
			Mon = "Peanut President";
			LevelQuest = 2;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut President";
			CFrameQuest = CFrame.new( -2104, 38, -10194);
			CFrameMon = CFrame.new( -2005, 100, -10585);
		elseif ((MyLevel == 2125) or (MyLevel <= 2149)) then
			Mon = "Ice Cream Chef";
			LevelQuest = 1;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Chef";
			CFrameQuest = CFrame.new( -818, 66, -10964);
			CFrameMon = CFrame.new( -501, 100, -10883);
		elseif ((MyLevel == 2150) or (MyLevel <= 2199)) then
			Mon = "Ice Cream Commander";
			LevelQuest = 2;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Commander";
			CFrameQuest = CFrame.new( -818, 66, -10964);
			CFrameMon = CFrame.new( -690, 100, -11350);
		elseif ((MyLevel == 2200) or (MyLevel <= 2224)) then
			Mon = "Cookie Crafter";
			LevelQuest = 1;
			NameQuest = "CakeQuest1";
			NameMon = "Cookie Crafter";
			CFrameQuest = CFrame.new( -2023, 38, -12028);
			CFrameMon = CFrame.new( -2332, 90, -12049);
		elseif ((MyLevel == 2225) or (MyLevel <= 2249)) then
			Mon = "Cake Guard";
			LevelQuest = 2;
			NameQuest = "CakeQuest1";
			NameMon = "Cake Guard";
			CFrameQuest = CFrame.new( -2023, 38, -12028);
			CFrameMon = CFrame.new( -1514, 90, -12422);
		elseif ((MyLevel == 2250) or (MyLevel <= 2274)) then
			Mon = "Baking Staff";
			LevelQuest = 1;
			NameQuest = "CakeQuest2";
			NameMon = "Baking Staff";
			CFrameQuest = CFrame.new( -1931, 38, -12840);
			CFrameMon = CFrame.new( -1930, 90, -12963);
		elseif ((MyLevel == 2275) or (MyLevel <= 2299)) then
			Mon = "Head Baker";
			LevelQuest = 2;
			NameQuest = "CakeQuest2";
			NameMon = "Head Baker";
			CFrameQuest = CFrame.new( -1931, 38, -12840);
			CFrameMon = CFrame.new( -2123, 110, -12777);
		elseif ((MyLevel == 2300) or (MyLevel <= 2324)) then
			Mon = "Cocoa Warrior";
			LevelQuest = 1;
			NameQuest = "ChocQuest1";
			NameMon = "Cocoa Warrior";
			CFrameQuest = CFrame.new(235, 25, -12199);
			CFrameMon = CFrame.new(110, 80, -12245);
		elseif ((MyLevel == 2325) or (MyLevel <= 2349)) then
			Mon = "Chocolate Bar Battler";
			LevelQuest = 2;
			NameQuest = "ChocQuest1";
			NameMon = "Chocolate Bar Battler";
			CFrameQuest = CFrame.new(235, 25, -12199);
			CFrameMon = CFrame.new(579, 80, -12413);
		elseif ((MyLevel == 2350) or (MyLevel <= 2374)) then
			Mon = "Sweet Thief";
			LevelQuest = 1;
			NameQuest = "ChocQuest2";
			NameMon = "Sweet Thief";
			CFrameQuest = CFrame.new(150, 25, -12777);
			CFrameMon = CFrame.new( -68, 80, -12692);
		elseif ((MyLevel == 2375) or (MyLevel <= 2399)) then
			Mon = "Candy Rebel";
			LevelQuest = 2;
			NameQuest = "ChocQuest2";
			NameMon = "Candy Rebel";
			CFrameQuest = CFrame.new(150, 25, -12777);
			CFrameMon = CFrame.new(17, 80, -12962);
		elseif ((MyLevel == 2400) or (MyLevel <= 2424)) then
			Mon = "Candy Pirate";
			LevelQuest = 1;
			NameQuest = "CandyQuest1";
			NameMon = "Candy Pirate";
			CFrameQuest = CFrame.new( -1148, 14, -14446);
			CFrameMon = CFrame.new( -1371, 70, -14405);
		elseif ((MyLevel == 2425) or (MyLevel <= 2449)) then
			Mon = "Snow Demon";
			LevelQuest = 2;
			NameQuest = "CandyQuest1";
			NameMon = "Snow Demon";
			CFrameQuest = CFrame.new( -1148, 14, -14446);
			CFrameMon = CFrame.new( -836, 70, -14326);
		elseif ((MyLevel == 2450) or (MyLevel <= 2474)) then
			Mon = "Isle Outlaw";
			LevelQuest = 1;
			NameQuest = "TikiQuest1";
			NameMon = "Isle Outlaw";
			CFrameQuest = CFrame.new( -16547, 56, -172);
			CFrameMon = CFrame.new( -16431, 90, -223);
		elseif ((MyLevel == 2475) or (MyLevel <= 2499)) then
			Mon = "Island Boy";
			LevelQuest = 2;
			NameQuest = "TikiQuest1";
			NameMon = "Island Boy";
			CFrameQuest = CFrame.new( -16547, 56, -172);
			CFrameMon = CFrame.new( -16668, 70, -243);
		elseif ((MyLevel == 2500) or (MyLevel <= 2524)) then
			Mon = "Sun-kissed Warrior";
			LevelQuest = 1;
			NameQuest = "TikiQuest2";
			NameMon = "kissed";
			CFrameQuest = CFrame.new( -16540, 56, 1051);
			CFrameMon = CFrame.new( -16345, 80, 1004);
		elseif ((MyLevel == 2525) or (MyLevel <= 2549)) then
			Mon = "Isle Champion";
			LevelQuest = 2;
			NameQuest = "TikiQuest2";
			NameMon = "Isle Champion";
			CFrameQuest = CFrame.new( -16540, 56, 1051);
			CFrameMon = CFrame.new( -16634, 85, 1106);
		elseif ((MyLevel == 2550) or (MyLevel <= 2574)) then
			Mon = "Serpent Hunter";
			LevelQuest = 1;
			NameQuest = "TikiQuest3";
			NameMon = "Serpent Hunter";
			CFrameQuest = CFrame.new( -16665, 105, 1580);
			CFrameMon = CFrame.new( -16542.4824, 146.675156, 1529.61401, -0.999948919, 1.0729811e-8, 0.0101067368, 1.0128324e-8, 1, -5.9564663e-8, -0.0101067368, -5.9459257e-8, -0.999948919);
		elseif ((MyLevel == 2575) or (MyLevel <= 2600)) then
			Mon = "Skull Slayer";
			LevelQuest = 2;
			NameQuest = "TikiQuest3";
			NameMon = "Skull Slayer";
			CFrameQuest = CFrame.new( -16665, 105, 1580);
			CFrameMon = CFrame.new( -16849.9336, 147.005066, 1640.88354, 0.470148534, 0.491874039, -0.732816696, 1.72165e-8, 0.83030504, 0.55730921, 0.882587314, -0.262018114, 0.390366673);
		end
	end
end
function Hop()
	local v295 = game.PlaceId;
	local v296 = {};
	local v297 = "";
	local v298 = os.date("!*t").hour;
	local v299 = false;
	function TPReturner()
		local v703;
		if (v297 == "") then
			v703 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v295   .. "/servers/Public?sortOrder=Asc&limit=100" ));
		else
			v703 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v295   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v297 ));
		end
		local v704 = "";
		if (v703.nextPageCursor and (v703.nextPageCursor ~= "null") and (v703.nextPageCursor ~= nil)) then
			v297 = v703.nextPageCursor;
		end
		local v705 = 0;
		for v1348, v1349 in pairs(v703.data) do
			local v1350 = true;
			v704 = tostring(v1349.id);
			if (tonumber(v1349.maxPlayers) > tonumber(v1349.playing)) then
				for v1631, v1632 in pairs(v296) do
					if (v705 ~= 0) then
						if (v704 == tostring(v1632)) then
							v1350 = false;
						end
					elseif (tonumber(v298) ~= tonumber(v1632)) then
						local v2112 = pcall(function()
							v296 = {};
							table.insert(v296, v298);
						end);
					end
					v705 = v705 + 1 ;
				end
				if (v1350 == true) then
					table.insert(v296, v704);
					wait();
					pcall(function()
						wait();
						game:GetService("TeleportService"):TeleportToPlaceInstance(v295, v704, game.Players.LocalPlayer);
					end);
					wait(4);
				end
			end
		end
	end
	function Teleport()
		while wait() do
			pcall(function()
				TPReturner();
				if (v297 ~= "") then
					TPReturner();
				end
			end);
		end
	end
	Teleport();
end
function UpdateIslandESP()
	for v706, v707 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
		pcall(function()
			if IslandESP then
				if (v707.Name ~= "Sea") then
					if  not v707:FindFirstChild("NameEsp") then
						local v1917 = Instance.new("BillboardGui", v707);
						v1917.Name = "NameEsp";
						v1917.ExtentsOffset = Vector3.new(0, 1, 0);
						v1917.Size = UDim2.new(1, 200, 1, 30);
						v1917.Adornee = v707;
						v1917.AlwaysOnTop = true;
						local v1923 = Instance.new("TextLabel", v1917);
						v1923.Font = "GothamBold";
						v1923.FontSize = "Size14";
						v1923.TextWrapped = true;
						v1923.Size = UDim2.new(1, 0, 1, 0);
						v1923.TextYAlignment = "Top";
						v1923.BackgroundTransparency = 1;
						v1923.TextStrokeTransparency = 0.5;
						v1923.TextColor3 = Color3.fromRGB(255, 255, 255);
					else
						v707['NameEsp'].TextLabel.Text = v707.Name   .. "   \n"   .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - v707.Position).Magnitude / 3 )   .. " Distance" ;
					end
				end
			elseif v707:FindFirstChild("NameEsp") then
				v707:FindFirstChild("NameEsp"):Destroy();
			end
		end);
	end
end
function isnil(v300)
	return v300 == nil ;
end
local function v49(v301)
	return math.floor(tonumber(v301) + 0.5 );
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
	for v708, v709 in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if  not isnil(v709.Character) then
				if ESPPlayer then
					if ( not isnil(v709.Character.Head) and  not v709.Character.Head:FindFirstChild("NameEsp"   .. Number )) then
						local v1933 = Instance.new("BillboardGui", v709.Character.Head);
						v1933.Name = "NameEsp"   .. Number ;
						v1933.ExtentsOffset = Vector3.new(0, 1, 0);
						v1933.Size = UDim2.new(1, 200, 1, 30);
						v1933.Adornee = v709.Character.Head;
						v1933.AlwaysOnTop = true;
						local v1940 = Instance.new("TextLabel", v1933);
						v1940.Font = Enum.Font.GothamSemibold;
						v1940.FontSize = "Size14";
						v1940.TextWrapped = true;
						v1940.Text = v709.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v709.Character.Head.Position).Magnitude / 3 )   .. " Distance" ;
						v1940.Size = UDim2.new(1, 0, 1, 0);
						v1940.TextYAlignment = "Top";
						v1940.BackgroundTransparency = 1;
						v1940.TextStrokeTransparency = 0.5;
						if (v709.Team == game.Players.LocalPlayer.Team) then
							v1940.TextColor3 = Color3.new(0, 134, 139);
						else
							v1940.TextColor3 = Color3.new(0, 134, 139);
						end
					else
						v709.Character.Head["NameEsp"   .. Number ].TextLabel.Text = v709.Name   .. " | "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v709.Character.Head.Position).Magnitude / 3 )   .. " Distance\nHealth: "   .. v49((v709.Character.Humanoid.Health * 100) / v709.Character.Humanoid.MaxHealth )   .. "%" ;
					end
				elseif v709.Character.Head:FindFirstChild("NameEsp"   .. Number ) then
					v709.Character.Head:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateChestChams()
	for v710, v711 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v711.Name, "Chest") then
				if ChestESP then
					if string.find(v711.Name, "Chest") then
						if  not v711:FindFirstChild("NameEsp"   .. Number ) then
							local v2249 = Instance.new("BillboardGui", v711);
							v2249.Name = "NameEsp"   .. Number ;
							v2249.ExtentsOffset = Vector3.new(0, 1, 0);
							v2249.Size = UDim2.new(1, 200, 1, 30);
							v2249.Adornee = v711;
							v2249.AlwaysOnTop = true;
							local v2255 = Instance.new("TextLabel", v2249);
							v2255.Font = Enum.Font.GothamSemibold;
							v2255.FontSize = "Size14";
							v2255.TextWrapped = true;
							v2255.Size = UDim2.new(1, 0, 1, 0);
							v2255.TextYAlignment = "Top";
							v2255.BackgroundTransparency = 1;
							v2255.TextStrokeTransparency = 0.5;
							if (v711.Name == "Chest1") then
								v2255.TextColor3 = Color3.fromRGB(109, 109, 109);
								v2255.Text = "Chest 1"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v711.Position).Magnitude / 3 )   .. " Distance" ;
							end
							if (v711.Name == "Chest2") then
								v2255.TextColor3 = Color3.fromRGB(173, 158, 21);
								v2255.Text = "Chest 2"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v711.Position).Magnitude / 3 )   .. " Distance" ;
							end
							if (v711.Name == "Chest3") then
								v2255.TextColor3 = Color3.fromRGB(85, 255, 255);
								v2255.Text = "Chest 3"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v711.Position).Magnitude / 3 )   .. " Distance" ;
							end
						else
							v711["NameEsp"   .. Number ].TextLabel.Text = v711.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v711.Position).Magnitude / 3 )   .. " Distance" ;
						end
					end
				elseif v711:FindFirstChild("NameEsp"   .. Number ) then
					v711:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateDevilChams()
	for v712, v713 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v713.Name, "Fruit") then
					if  not v713.Handle:FindFirstChild("NameEsp"   .. Number ) then
						local v1951 = Instance.new("BillboardGui", v713.Handle);
						v1951.Name = "NameEsp"   .. Number ;
						v1951.ExtentsOffset = Vector3.new(0, 1, 0);
						v1951.Size = UDim2.new(1, 200, 1, 30);
						v1951.Adornee = v713.Handle;
						v1951.AlwaysOnTop = true;
						local v1958 = Instance.new("TextLabel", v1951);
						v1958.Font = Enum.Font.GothamSemibold;
						v1958.FontSize = "Size14";
						v1958.TextWrapped = true;
						v1958.Size = UDim2.new(1, 0, 1, 0);
						v1958.TextYAlignment = "Top";
						v1958.BackgroundTransparency = 1;
						v1958.TextStrokeTransparency = 0.5;
						v1958.TextColor3 = Color3.fromRGB(255, 255, 255);
						v1958.Text = v713.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v713.Handle.Position).Magnitude / 3 )   .. " Distance" ;
					else
						v713.Handle["NameEsp"   .. Number ].TextLabel.Text = v713.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v713.Handle.Position).Magnitude / 3 )   .. " Distance" ;
					end
				end
			elseif v713.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v713.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end);
	end
end
function UpdateFlowerChams()
	for v714, v715 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if ((v715.Name == "Flower2") or (v715.Name == "Flower1")) then
				if FlowerESP then
					if  not v715:FindFirstChild("NameEsp"   .. Number ) then
						local v1970 = Instance.new("BillboardGui", v715);
						v1970.Name = "NameEsp"   .. Number ;
						v1970.ExtentsOffset = Vector3.new(0, 1, 0);
						v1970.Size = UDim2.new(1, 200, 1, 30);
						v1970.Adornee = v715;
						v1970.AlwaysOnTop = true;
						local v1976 = Instance.new("TextLabel", v1970);
						v1976.Font = Enum.Font.GothamSemibold;
						v1976.FontSize = "Size14";
						v1976.TextWrapped = true;
						v1976.Size = UDim2.new(1, 0, 1, 0);
						v1976.TextYAlignment = "Top";
						v1976.BackgroundTransparency = 1;
						v1976.TextStrokeTransparency = 0.5;
						v1976.TextColor3 = Color3.fromRGB(255, 0, 0);
						if (v715.Name == "Flower1") then
							v1976.Text = "Blue Flower"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v715.Position).Magnitude / 3 )   .. " Distance" ;
							v1976.TextColor3 = Color3.fromRGB(0, 0, 255);
						end
						if (v715.Name == "Flower2") then
							v1976.Text = "Red Flower"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v715.Position).Magnitude / 3 )   .. " Distance" ;
							v1976.TextColor3 = Color3.fromRGB(255, 0, 0);
						end
					else
						v715["NameEsp"   .. Number ].TextLabel.Text = v715.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v715.Position).Magnitude / 3 )   .. " Distance" ;
					end
				elseif v715:FindFirstChild("NameEsp"   .. Number ) then
					v715:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateRealFruitChams()
	for v716, v717 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v717:IsA("Tool") then
			if RealFruitESP then
				if  not v717.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1729 = Instance.new("BillboardGui", v717.Handle);
					v1729.Name = "NameEsp"   .. Number ;
					v1729.ExtentsOffset = Vector3.new(0, 1, 0);
					v1729.Size = UDim2.new(1, 200, 1, 30);
					v1729.Adornee = v717.Handle;
					v1729.AlwaysOnTop = true;
					local v1736 = Instance.new("TextLabel", v1729);
					v1736.Font = Enum.Font.GothamSemibold;
					v1736.FontSize = "Size14";
					v1736.TextWrapped = true;
					v1736.Size = UDim2.new(1, 0, 1, 0);
					v1736.TextYAlignment = "Top";
					v1736.BackgroundTransparency = 1;
					v1736.TextStrokeTransparency = 0.5;
					v1736.TextColor3 = Color3.fromRGB(255, 0, 0);
					v1736.Text = v717.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v717.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v717.Handle["NameEsp"   .. Number ].TextLabel.Text = v717.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v717.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v717.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v717.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
	for v718, v719 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v719:IsA("Tool") then
			if RealFruitESP then
				if  not v719.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1748 = Instance.new("BillboardGui", v719.Handle);
					v1748.Name = "NameEsp"   .. Number ;
					v1748.ExtentsOffset = Vector3.new(0, 1, 0);
					v1748.Size = UDim2.new(1, 200, 1, 30);
					v1748.Adornee = v719.Handle;
					v1748.AlwaysOnTop = true;
					local v1755 = Instance.new("TextLabel", v1748);
					v1755.Font = Enum.Font.GothamSemibold;
					v1755.FontSize = "Size14";
					v1755.TextWrapped = true;
					v1755.Size = UDim2.new(1, 0, 1, 0);
					v1755.TextYAlignment = "Top";
					v1755.BackgroundTransparency = 1;
					v1755.TextStrokeTransparency = 0.5;
					v1755.TextColor3 = Color3.fromRGB(255, 174, 0);
					v1755.Text = v719.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v719.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v719.Handle["NameEsp"   .. Number ].TextLabel.Text = v719.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v719.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v719.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v719.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
	for v720, v721 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v721:IsA("Tool") then
			if RealFruitESP then
				if  not v721.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1767 = Instance.new("BillboardGui", v721.Handle);
					v1767.Name = "NameEsp"   .. Number ;
					v1767.ExtentsOffset = Vector3.new(0, 1, 0);
					v1767.Size = UDim2.new(1, 200, 1, 30);
					v1767.Adornee = v721.Handle;
					v1767.AlwaysOnTop = true;
					local v1774 = Instance.new("TextLabel", v1767);
					v1774.Font = Enum.Font.GothamSemibold;
					v1774.FontSize = "Size14";
					v1774.TextWrapped = true;
					v1774.Size = UDim2.new(1, 0, 1, 0);
					v1774.TextYAlignment = "Top";
					v1774.BackgroundTransparency = 1;
					v1774.TextStrokeTransparency = 0.5;
					v1774.TextColor3 = Color3.fromRGB(251, 255, 0);
					v1774.Text = v721.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v721.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v721.Handle["NameEsp"   .. Number ].TextLabel.Text = v721.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v721.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v721.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v721.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
end
function UpdateIslandESP()
	for v722, v723 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
		pcall(function()
			if IslandESP then
				if (v723.Name ~= "Sea") then
					if  not v723:FindFirstChild("NameEsp") then
						local v1987 = Instance.new("BillboardGui", v723);
						v1987.Name = "NameEsp";
						v1987.ExtentsOffset = Vector3.new(0, 1, 0);
						v1987.Size = UDim2.new(1, 200, 1, 30);
						v1987.Adornee = v723;
						v1987.AlwaysOnTop = true;
						local v1993 = Instance.new("TextLabel", v1987);
						v1993.Font = "GothamBold";
						v1993.FontSize = "Size14";
						v1993.TextWrapped = true;
						v1993.Size = UDim2.new(1, 0, 1, 0);
						v1993.TextYAlignment = "Top";
						v1993.BackgroundTransparency = 1;
						v1993.TextStrokeTransparency = 0.5;
						v1993.TextColor3 = Color3.fromRGB(255, 255, 255);
					else
						v723['NameEsp'].TextLabel.Text = v723.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v723.Position).Magnitude / 3 )   .. " Distance" ;
					end
				end
			elseif v723:FindFirstChild("NameEsp") then
				v723:FindFirstChild("NameEsp"):Destroy();
			end
		end);
	end
end
function isnil(v302)
	return v302 == nil ;
end
local function v49(v303)
	return math.floor(tonumber(v303) + 0.5 );
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
	for v724, v725 in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if  not isnil(v725.Character) then
				if ESPPlayer then
					if ( not isnil(v725.Character.Head) and  not v725.Character.Head:FindFirstChild("NameEsp"   .. Number )) then
						local v2003 = Instance.new("BillboardGui", v725.Character.Head);
						v2003.Name = "NameEsp"   .. Number ;
						v2003.ExtentsOffset = Vector3.new(0, 1, 0);
						v2003.Size = UDim2.new(1, 200, 1, 30);
						v2003.Adornee = v725.Character.Head;
						v2003.AlwaysOnTop = true;
						local v2010 = Instance.new("TextLabel", v2003);
						v2010.Font = Enum.Font.GothamSemibold;
						v2010.FontSize = "Size14";
						v2010.TextWrapped = true;
						v2010.Text = v725.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v725.Character.Head.Position).Magnitude / 3 )   .. " Distance" ;
						v2010.Size = UDim2.new(1, 0, 1, 0);
						v2010.TextYAlignment = "Top";
						v2010.BackgroundTransparency = 1;
						v2010.TextStrokeTransparency = 0.5;
						if (v725.Team == game.Players.LocalPlayer.Team) then
							v2010.TextColor3 = Color3.new(0, 134, 139);
						else
							v2010.TextColor3 = Color3.new(0, 134, 139);
						end
					else
						v725.Character.Head["NameEsp"   .. Number ].TextLabel.Text = v725.Name   .. " | "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v725.Character.Head.Position).Magnitude / 3 )   .. " Distance\nHealth: "   .. v49((v725.Character.Humanoid.Health * 100) / v725.Character.Humanoid.MaxHealth )   .. "%" ;
					end
				elseif v725.Character.Head:FindFirstChild("NameEsp"   .. Number ) then
					v725.Character.Head:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateChestChams()
	for v726, v727 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v727.Name, "Chest") then
				if ChestESP then
					if string.find(v727.Name, "Chest") then
						if  not v727:FindFirstChild("NameEsp"   .. Number ) then
							local v2271 = Instance.new("BillboardGui", v727);
							v2271.Name = "NameEsp"   .. Number ;
							v2271.ExtentsOffset = Vector3.new(0, 1, 0);
							v2271.Size = UDim2.new(1, 200, 1, 30);
							v2271.Adornee = v727;
							v2271.AlwaysOnTop = true;
							local v2277 = Instance.new("TextLabel", v2271);
							v2277.Font = Enum.Font.GothamSemibold;
							v2277.FontSize = "Size14";
							v2277.TextWrapped = true;
							v2277.Size = UDim2.new(1, 0, 1, 0);
							v2277.TextYAlignment = "Top";
							v2277.BackgroundTransparency = 1;
							v2277.TextStrokeTransparency = 0.5;
							if (v727.Name == "Chest1") then
								v2277.TextColor3 = Color3.fromRGB(109, 109, 109);
								v2277.Text = "Chest 1"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v727.Position).Magnitude / 3 )   .. " Distance" ;
							end
							if (v727.Name == "Chest2") then
								v2277.TextColor3 = Color3.fromRGB(173, 158, 21);
								v2277.Text = "Chest 2"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v727.Position).Magnitude / 3 )   .. " Distance" ;
							end
							if (v727.Name == "Chest3") then
								v2277.TextColor3 = Color3.fromRGB(85, 255, 255);
								v2277.Text = "Chest 3"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v727.Position).Magnitude / 3 )   .. " Distance" ;
							end
						else
							v727["NameEsp"   .. Number ].TextLabel.Text = v727.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v727.Position).Magnitude / 3 )   .. " Distance" ;
						end
					end
				elseif v727:FindFirstChild("NameEsp"   .. Number ) then
					v727:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateDevilChams()
	for v728, v729 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v729.Name, "Fruit") then
					if  not v729.Handle:FindFirstChild("NameEsp"   .. Number ) then
						local v2021 = Instance.new("BillboardGui", v729.Handle);
						v2021.Name = "NameEsp"   .. Number ;
						v2021.ExtentsOffset = Vector3.new(0, 1, 0);
						v2021.Size = UDim2.new(1, 200, 1, 30);
						v2021.Adornee = v729.Handle;
						v2021.AlwaysOnTop = true;
						local v2028 = Instance.new("TextLabel", v2021);
						v2028.Font = Enum.Font.GothamSemibold;
						v2028.FontSize = "Size14";
						v2028.TextWrapped = true;
						v2028.Size = UDim2.new(1, 0, 1, 0);
						v2028.TextYAlignment = "Top";
						v2028.BackgroundTransparency = 1;
						v2028.TextStrokeTransparency = 0.5;
						v2028.TextColor3 = Color3.fromRGB(255, 255, 255);
						v2028.Text = v729.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v729.Handle.Position).Magnitude / 3 )   .. " Distance" ;
					else
						v729.Handle["NameEsp"   .. Number ].TextLabel.Text = v729.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v729.Handle.Position).Magnitude / 3 )   .. " Distance" ;
					end
				end
			elseif v729.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v729.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end);
	end
end
function UpdateFlowerChams()
	for v730, v731 in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if ((v731.Name == "Flower2") or (v731.Name == "Flower1")) then
				if FlowerESP then
					if  not v731:FindFirstChild("NameEsp"   .. Number ) then
						local v2040 = Instance.new("BillboardGui", v731);
						v2040.Name = "NameEsp"   .. Number ;
						v2040.ExtentsOffset = Vector3.new(0, 1, 0);
						v2040.Size = UDim2.new(1, 200, 1, 30);
						v2040.Adornee = v731;
						v2040.AlwaysOnTop = true;
						local v2046 = Instance.new("TextLabel", v2040);
						v2046.Font = Enum.Font.GothamSemibold;
						v2046.FontSize = "Size14";
						v2046.TextWrapped = true;
						v2046.Size = UDim2.new(1, 0, 1, 0);
						v2046.TextYAlignment = "Top";
						v2046.BackgroundTransparency = 1;
						v2046.TextStrokeTransparency = 0.5;
						v2046.TextColor3 = Color3.fromRGB(255, 0, 0);
						if (v731.Name == "Flower1") then
							v2046.Text = "Blue Flower"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v731.Position).Magnitude / 3 )   .. " Distance" ;
							v2046.TextColor3 = Color3.fromRGB(0, 0, 255);
						end
						if (v731.Name == "Flower2") then
							v2046.Text = "Red Flower"   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v731.Position).Magnitude / 3 )   .. " Distance" ;
							v2046.TextColor3 = Color3.fromRGB(255, 0, 0);
						end
					else
						v731["NameEsp"   .. Number ].TextLabel.Text = v731.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v731.Position).Magnitude / 3 )   .. " Distance" ;
					end
				elseif v731:FindFirstChild("NameEsp"   .. Number ) then
					v731:FindFirstChild("NameEsp"   .. Number ):Destroy();
				end
			end
		end);
	end
end
function UpdateRealFruitChams()
	for v732, v733 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v733:IsA("Tool") then
			if RealFruitESP then
				if  not v733.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1786 = Instance.new("BillboardGui", v733.Handle);
					v1786.Name = "NameEsp"   .. Number ;
					v1786.ExtentsOffset = Vector3.new(0, 1, 0);
					v1786.Size = UDim2.new(1, 200, 1, 30);
					v1786.Adornee = v733.Handle;
					v1786.AlwaysOnTop = true;
					local v1793 = Instance.new("TextLabel", v1786);
					v1793.Font = Enum.Font.GothamSemibold;
					v1793.FontSize = "Size14";
					v1793.TextWrapped = true;
					v1793.Size = UDim2.new(1, 0, 1, 0);
					v1793.TextYAlignment = "Top";
					v1793.BackgroundTransparency = 1;
					v1793.TextStrokeTransparency = 0.5;
					v1793.TextColor3 = Color3.fromRGB(255, 0, 0);
					v1793.Text = v733.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v733.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v733.Handle["NameEsp"   .. Number ].TextLabel.Text = v733.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v733.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v733.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v733.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
	for v734, v735 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v735:IsA("Tool") then
			if RealFruitESP then
				if  not v735.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1805 = Instance.new("BillboardGui", v735.Handle);
					v1805.Name = "NameEsp"   .. Number ;
					v1805.ExtentsOffset = Vector3.new(0, 1, 0);
					v1805.Size = UDim2.new(1, 200, 1, 30);
					v1805.Adornee = v735.Handle;
					v1805.AlwaysOnTop = true;
					local v1812 = Instance.new("TextLabel", v1805);
					v1812.Font = Enum.Font.GothamSemibold;
					v1812.FontSize = "Size14";
					v1812.TextWrapped = true;
					v1812.Size = UDim2.new(1, 0, 1, 0);
					v1812.TextYAlignment = "Top";
					v1812.BackgroundTransparency = 1;
					v1812.TextStrokeTransparency = 0.5;
					v1812.TextColor3 = Color3.fromRGB(255, 174, 0);
					v1812.Text = v735.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v735.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v735.Handle["NameEsp"   .. Number ].TextLabel.Text = v735.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v735.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v735.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v735.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
	for v736, v737 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v737:IsA("Tool") then
			if RealFruitESP then
				if  not v737.Handle:FindFirstChild("NameEsp"   .. Number ) then
					local v1824 = Instance.new("BillboardGui", v737.Handle);
					v1824.Name = "NameEsp"   .. Number ;
					v1824.ExtentsOffset = Vector3.new(0, 1, 0);
					v1824.Size = UDim2.new(1, 200, 1, 30);
					v1824.Adornee = v737.Handle;
					v1824.AlwaysOnTop = true;
					local v1831 = Instance.new("TextLabel", v1824);
					v1831.Font = Enum.Font.GothamSemibold;
					v1831.FontSize = "Size14";
					v1831.TextWrapped = true;
					v1831.Size = UDim2.new(1, 0, 1, 0);
					v1831.TextYAlignment = "Top";
					v1831.BackgroundTransparency = 1;
					v1831.TextStrokeTransparency = 0.5;
					v1831.TextColor3 = Color3.fromRGB(251, 255, 0);
					v1831.Text = v737.Name   .. " \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v737.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				else
					v737.Handle["NameEsp"   .. Number ].TextLabel.Text = v737.Name   .. " "   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v737.Handle.Position).Magnitude / 3 )   .. " Distance" ;
				end
			elseif v737.Handle:FindFirstChild("NameEsp"   .. Number ) then
				v737.Handle:FindFirstChild("NameEsp"   .. Number ):Destroy();
			end
		end
	end
end
function UpdateIslandMirageESP()
	for v738, v739 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
		pcall(function()
			if MirageIslandESP then
				if (v739.Name == "Mirage Island") then
					if  not v739:FindFirstChild("NameEsp") then
						local v2057 = Instance.new("BillboardGui", v739);
						v2057.Name = "NameEsp";
						v2057.ExtentsOffset = Vector3.new(0, 1, 0);
						v2057.Size = UDim2.new(1, 200, 1, 30);
						v2057.Adornee = v739;
						v2057.AlwaysOnTop = true;
						local v2063 = Instance.new("TextLabel", v2057);
						v2063.Font = "Code";
						v2063.FontSize = "Size14";
						v2063.TextWrapped = true;
						v2063.Size = UDim2.new(1, 0, 1, 0);
						v2063.TextYAlignment = "Top";
						v2063.BackgroundTransparency = 1;
						v2063.TextStrokeTransparency = 0.5;
						v2063.TextColor3 = Color3.fromRGB(255, 255, 255);
					else
						v739['NameEsp'].TextLabel.Text = v739.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v739.Position).Magnitude / 3 )   .. " M" ;
					end
				end
			elseif v739:FindFirstChild("NameEsp") then
				v739:FindFirstChild("NameEsp"):Destroy();
			end
		end);
	end
end
function UpdateLSDESP()
	for v740, v741 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
		pcall(function()
			if LADESP then
				if (v741.Name == "Legendary Sword Dealer") then
					if  not v741:FindFirstChild("NameEsp") then
						local v2073 = Instance.new("BillboardGui", v741);
						v2073.Name = "NameEsp";
						v2073.ExtentsOffset = Vector3.new(0, 1, 0);
						v2073.Size = UDim2.new(1, 200, 1, 30);
						v2073.Adornee = v741;
						v2073.AlwaysOnTop = true;
						local v2079 = Instance.new("TextLabel", v2073);
						v2079.Font = "Code";
						v2079.FontSize = "Size14";
						v2079.TextWrapped = true;
						v2079.Size = UDim2.new(1, 0, 1, 0);
						v2079.TextYAlignment = "Top";
						v2079.BackgroundTransparency = 1;
						v2079.TextStrokeTransparency = 0.5;
						v2079.TextColor3 = Color3.fromRGB(255, 255, 255);
					else
						v741['NameEsp'].TextLabel.Text = v741.Name   .. "   \n"   .. v49((game:GetService("Players").LocalPlayer.Character.Head.Position - v741.Position).Magnitude / 3 )   .. " M" ;
					end
				end
			elseif v741:FindFirstChild("NameEsp") then
				v741:FindFirstChild("NameEsp"):Destroy();
			end
		end);
	end
end
function InfAb()
	if InfAbility then
		if  not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
			local v1545 = Instance.new("ParticleEmitter");
			v1545.Acceleration = Vector3.new(0, 0, 0);
			v1545.Archivable = true;
			v1545.Drag = 20;
			v1545.EmissionDirection = Enum.NormalId.Top;
			v1545.Enabled = true;
			v1545.Lifetime = NumberRange.new(0, 0);
			v1545.LightInfluence = 0;
			v1545.LockedToPart = true;
			v1545.Name = "Agility";
			v1545.Rate = 500;
			local v1557 = {
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 4)
			};
			v1545.Size = NumberSequence.new(v1557);
			v1545.RotSpeed = NumberRange.new(9999, 99999);
			v1545.Rotation = NumberRange.new(0, 0);
			v1545.Speed = NumberRange.new(30, 30);
			v1545.SpreadAngle = Vector2.new(0, 0, 0, 0);
			v1545.Texture = "";
			v1545.VelocityInheritance = 0;
			v1545.ZOffset = 2;
			v1545.Transparency = NumberSequence.new(0);
			v1545.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0));
			v1545.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
		end
	elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy();
	end
end
local v50 = game:GetService("Players").LocalPlayer;
local v51 = v50.Character.Energy.Value;
function infinitestam()
	v50.Character.Energy.Changed:connect(function()
		if InfiniteEnergy then
			v50.Character.Energy.Value = v51;
		end
	end);
end
spawn(function()
	pcall(function()
		while wait(0.1) do
			if InfiniteEnergy then
				wait(0.1);
				v51 = v50.Character.Energy.Value;
				infinitestam();
			end
		end
	end);
end);
function NoDodgeCool()
	if nododgecool then
		for v1489, v1490 in next, getgc() do
			if game:GetService("Players").LocalPlayer.Character.Dodge then
				if ((typeof(v1490) == "function") and (getfenv(v1490).script == game:GetService("Players").LocalPlayer.Character.Dodge)) then
					for v2089, v2090 in next, getupvalues(v1490) do
						if (tostring(v2090) == "0.1") then
							repeat
								wait(0.1);
								setupvalue(v1490, v2089, 0);
							until  not nododgecool
						end
					end
				end
			end
		end
	end
end
function fly()
	local v304 = game:GetService("Players").LocalPlayer:GetMouse("");
	localplayer = game:GetService("Players").LocalPlayer;
	game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart");
	local v306 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
	local v307 = 25;
	local v308 = {
		a = false,
		d = false,
		w = false,
		s = false
	};
	local v309;
	local v310;
	local function v311()
		local v742 = Instance.new("BodyPosition", v306);
		local v743 = Instance.new("BodyGyro", v306);
		v742.Name = "EPIXPOS";
		v742.maxForce = Vector3.new(math.huge, math.huge, math.huge);
		v742.position = v306.Position;
		v743.maxTorque = Vector3.new(8999999488, 8999999488, 8999999488);
		v743.CFrame = v306.CFrame;
		repeat
			wait();
			localplayer.Character.Humanoid.PlatformStand = true;
			local v1352 = (v743.CFrame - v743.CFrame.p) + v742.position ;
			if ( not v308.w and  not v308.s and  not v308.a and  not v308.d) then
				speed = 1;
			end
			if v308.w then
				v1352 = v1352 + (workspace.CurrentCamera.CoordinateFrame.lookVector * speed) ;
				speed = speed + v307 ;
			end
			if v308.s then
				v1352 = v1352 - (workspace.CurrentCamera.CoordinateFrame.lookVector * speed) ;
				speed = speed + v307 ;
			end
			if v308.d then
				v1352 = v1352 * CFrame.new(speed, 0, 0) ;
				speed = speed + v307 ;
			end
			if v308.a then
				v1352 = v1352 * CFrame.new( -speed, 0, 0) ;
				speed = speed + v307 ;
			end
			if (speed > v307) then
				speed = v307;
			end
			v742.position = v1352.p;
			if v308.w then
				v743.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles( -math.rad(speed * 15 ), 0, 0) ;
			elseif v308.s then
				v743.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15 ), 0, 0) ;
			else
				v743.CFrame = workspace.CurrentCamera.CoordinateFrame;
			end
		until  not Fly
		if v743 then
			v743:Destroy();
		end
		if v742 then
			v742:Destroy();
		end
		flying = false;
		localplayer.Character.Humanoid.PlatformStand = false;
		speed = 0;
	end
	v309 = v304.KeyDown:connect(function(v752)
		if ( not v306 or  not v306.Parent) then
			flying = false;
			v309:disconnect();
			v310:disconnect();
			return;
		end
		if (v752 == "w") then
			v308.w = true;
		elseif (v752 == "s") then
			v308.s = true;
		elseif (v752 == "a") then
			v308.a = true;
		elseif (v752 == "d") then
			v308.d = true;
		end
	end);
	v310 = v304.KeyUp:connect(function(v753)
		if (v753 == "w") then
			v308.w = false;
		elseif (v753 == "s") then
			v308.s = false;
		elseif (v753 == "a") then
			v308.a = false;
		elseif (v753 == "d") then
			v308.d = false;
		end
	end);
	v311();
end
function Click()
	game:GetService("VirtualUser"):CaptureController();
	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
end
function AutoHaki()
	if  not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso");
	end
end
function EquipWeapon(v312)
	if  not Nill then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(v312) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(v312);
			wait(0.1);
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool);
		end
	end
end
function BTP(v313)
	pcall(function()
		if (((v313.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500) and  not Auto_Raid and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)) then
			repeat
				wait();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v313;
				wait(0.05);
				game.Players.LocalPlayer.Character.Head:Destroy();
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v313;
			until ((v313.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500) and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)
		end
	end);
end
local v52 = false;
function WaitHRP(v314)
	if  not v314 then
		return;
	end
	return v314.Character:WaitForChild("HumanoidRootPart", 9);
end
function CheckNearestTeleporter(v315)
	local v316 = v315.Position;
	local v317 = math.huge;
	local v318 = nil;
	local v319 = game.PlaceId;
	local v320 = {};
	if (v319 == 2753915549) then
		v320 = {
			Sky3 = Vector3.new( -7894, 5547, -380),
			Sky3Exit = Vector3.new( -4607, 874, -1667),
			UnderWater = Vector3.new(61163, 11, 1819),
			UnderwaterExit = Vector3.new(4050, -1, -1814)
		};
	elseif (v319 == 4442272183) then
		v320 = {
			["Swan Mansion"] = Vector3.new( -390, 332, 673),
			["Swan Room"] = Vector3.new(2285, 15, 905),
			["Cursed Ship"] = Vector3.new(923, 126, 32852),
			["Zombie Island"] = Vector3.new( -6509, 83, -133)
		};
	elseif (v319 == 7449423635) then
		v320 = {
			["Floating Turtle"] = Vector3.new( -12462, 375, -7552),
			["Hydra Island"] = Vector3.new(5745, 610, -267),
			Mansion = Vector3.new( -12462, 375, -7552),
			Castle = Vector3.new( -5036, 315, -3179),
			["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
			["Beautiful Room"] = Vector3.new(5314.58203, 22.5364361, -125.942276, 1, 2.1476277e-8, -1.9911115e-13, -2.1476277e-8, 1, -3.0510602e-8, 1.984559e-13, 3.0510602e-8, 1),
			["Temple of Time"] = Vector3.new(28286, 14897, 103)
		};
	end
	for v754, v755 in pairs(v320) do
		local v756 = (v755 - v316).Magnitude;
		if (v756 < v317) then
			v317 = v756;
			v318 = v755;
		end
	end
	local v321 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
	if (v317 <= (v316 - v321).Magnitude) then
		return v318;
	end
end
function requestEntrance(v322)
	game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", v322);
	local v323 = game.Players.LocalPlayer.Character.HumanoidRootPart;
	v323.CFrame = v323.CFrame + Vector3.new(0, 50, 0) ;
	task.wait(0.5);
end
local v53 = false;
function topos(v325)
	local v326 = game.Players.LocalPlayer;
	if (v326.Character and (v326.Character.Humanoid.Health > 0) and v326.Character:FindFirstChild("HumanoidRootPart")) then
		if  not v325 then
			return;
		end
		local v1355 = (v325.Position - v326.Character.HumanoidRootPart.Position).Magnitude;
		local v1356 = CheckNearestTeleporter(v325);
		if v1356 then
			requestEntrance(v1356);
		end
		if  not v326.Character:FindFirstChild("PartTele") then
			local v1573 = Instance.new("Part", v326.Character);
			v1573.Size = Vector3.new(10, 1, 10);
			v1573.Name = "PartTele";
			v1573.Anchored = true;
			v1573.Transparency = 1;
			v1573.CanCollide = false;
			v1573.CFrame = WaitHRP(v326).CFrame;
			v1573:GetPropertyChangedSignal("CFrame"):Connect(function()
				if  not v52 then
					return;
				end
				task.wait();
				if (v326.Character and v326.Character:FindFirstChild("HumanoidRootPart")) then
					local v1845 = v1573.CFrame;
					WaitHRP(v326).CFrame = CFrame.new(v1845.Position.X, v325.Position.Y, v1845.Position.Z);
				end
			end);
		end
		v52 = true;
		if (v53 and (v1355 > distbyp)) then
			bypass(v325);
		end
		local v1357 = getgenv().TweenSpeed;
		if (v1355 <= 250) then
			v1357 = v1357 * 3 ;
		end
		local v1358 = CFrame.new(v325.Position.X, v325.Position.Y, v325.Position.Z);
		local v1359 = game:GetService("TweenService"):Create(v326.Character.PartTele, TweenInfo.new(v1355 / v1357 , Enum.EasingStyle.Linear), {
			CFrame = v325
		});
		v1359:Play();
		v1359.Completed:Connect(function(v1493)
			if (v1493 == Enum.PlaybackState.Completed) then
				if v326.Character:FindFirstChild("PartTele") then
					v326.Character.PartTele:Destroy();
				end
				v52 = false;
			end
		end);
	end
end
function TP1(v327)
	topos(v327);
end
function TP2(v328)
	local v329 = game.Players.LocalPlayer;
	if (v329.Character and (v329.Character.Humanoid.Health > 0) and v329.Character:FindFirstChild("HumanoidRootPart")) then
		local v1360 = (v328.Position - v329.Character.HumanoidRootPart.Position).Magnitude;
		if  not v328 then
			return;
		end
		local v1361 = CheckNearestTeleporter(v328);
		if v1361 then
			requestEntrance(v1361);
		end
		if  not v329.Character:FindFirstChild("PartTele") then
			local v1581 = Instance.new("Part", v329.Character);
			v1581.Size = Vector3.new(10, 1, 10);
			v1581.Name = "PartTele";
			v1581.Anchored = true;
			v1581.Transparency = 1;
			v1581.CanCollide = true;
			v1581.CFrame = WaitHRP(v329).CFrame;
			v1581:GetPropertyChangedSignal("CFrame"):Connect(function()
				if  not v52 then
					return;
				end
				task.wait();
				if (v329.Character and v329.Character:FindFirstChild("HumanoidRootPart")) then
					WaitHRP(v329).CFrame = v1581.CFrame;
				end
			end);
		end
		v52 = true;
		local v1362 = game:GetService("TweenService"):Create(v329.Character.PartTele, TweenInfo.new(v1360 / 350 , Enum.EasingStyle.Linear), {
			CFrame = v328
		});
		v1362:Play();
		v1362.Completed:Connect(function(v1494)
			if (v1494 == Enum.PlaybackState.Completed) then
				if v329.Character:FindFirstChild("PartTele") then
					v329.Character.PartTele:Destroy();
				end
				v52 = false;
			end
		end);
	end
end
function stopTeleport()
	v52 = false;
	local v330 = game.Players.LocalPlayer;
	if v330.Character:FindFirstChild("PartTele") then
		v330.Character.PartTele:Destroy();
	end
end
spawn(function()
	while task.wait() do
		if  not v52 then
			stopTeleport();
		end
	end
end);
spawn(function()
	local v331 = game.Players.LocalPlayer;
	while task.wait() do
		pcall(function()
			if v331.Character:FindFirstChild("PartTele") then
				if ((v331.Character.HumanoidRootPart.Position - v331.Character.PartTele.Position).Magnitude >= 100) then
					stopTeleport();
				end
			end
		end);
	end
end);
local v54 = game.Players.LocalPlayer;
local function v55(v332)
	local v333 = v332:WaitForChild("Humanoid");
	v333.Died:Connect(function()
		stopTeleport();
	end);
end
v54.CharacterAdded:Connect(v55);
if v54.Character then
	v55(v54.Character);
end
function TPB(v334)
	local v335 = game:service("TweenService");
	local v336 = TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - v334.Position).Magnitude / 300 , Enum.EasingStyle.Linear);
	tween = v335:Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat, v336, {
		CFrame = v334
	});
	tween:Play();
	local v337 = {};
	v337.Stop = function(v757)
		tween:Cancel();
	end;
	return v337;
end
Type = 1;
spawn(function()
	while wait() do
		if (Type == 1) then
			Pos = CFrame.new(0, PosY, -19);
		elseif (Type == 2) then
			Pos = CFrame.new(19, PosY, 0);
		elseif (Type == 3) then
			Pos = CFrame.new(0, PosY, 19);
		elseif (Type == 4) then
			Pos = CFrame.new( -19, PosY, 0);
		end
	end
end);
spawn(function()
	while wait(0.1) do
		Type = 1;
		wait(0.2);
		Type = 2;
		wait(0.2);
		Type = 3;
		wait(0.2);
		Type = 4;
		wait(0.2);
	end
end);
spawn(function()
	pcall(function()
		while wait() do
			if (_G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or FarmBoss or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.d or _G.waden or _G.gay or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.FarmChest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or Grab_Chest or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.Farmfast or _G.Race or _G.RaidPirate or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip or _G.FrozenDimension or _G.FKitsune) then
				if  not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local v1693 = Instance.new("BodyVelocity");
					v1693.Name = "BodyClip";
					v1693.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
					v1693.MaxForce = Vector3.new(100000, 100000, 100000);
					v1693.Velocity = Vector3.new(0, 0, 0);
				end
			end
		end
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if (_G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or FarmBoss or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.d or _G.waden or _G.gay or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.FarmChest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or Grab_Chest or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.Farmfast or _G.Race or _G.RaidPirate or _G.TushitaSword or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip) then
				local v1589 = game:GetService("Players").LocalPlayer;
				local v1590 = v1589.Character and v1589.Character:FindFirstChildOfClass("Humanoid") ;
				if v1590 then
					local v1699 = v1590:GetState();
					if ((v1699 ~= Enum.HumanoidStateType.Seated) and (v1699 ~= Enum.HumanoidStateType.Running) and (v1699 ~= Enum.HumanoidStateType.Landed)) then
						v1590:ChangeState(5);
					end
				end
			end
		end
	end);
end);
spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
			if (_G.AdvanceDungeon or _G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.Factory or _G.FarmBossHallow or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.NoClip or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Kill_Ply or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.GrabChest or _G.Holy_Torch or _G.Level or _G.Clip or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.FarmMaterial or _G.Guitar or _G.Dragon_Trident or _G.tushita or _G.waden or _G.pole or _G.saw or _G.ObservationHakiV2 or _G.FarmNearest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Kai or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.FarmMob or _G.MysticIsland or _G.FarmDungeon or _G.RaidPirate or _G.QuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.Race or _G.RaidPirate or Open_Color_Haki or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.FrozenDimension or _G.FKitsune) then
				for v1635, v1636 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
					if v1636:IsA("BasePart") then
						v1636.CanCollide = false;
					end
				end
			end
		end);
	end);
end);
function InstancePos(v339)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v339;
end
function TP3(v341)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v341;
end
spawn(function()
	while wait() do
		if (_G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.FarmBossHallow or _G.Factory or _G.FarmSwanGlasses or _G.LongSword or _G.BlackSpikeycoat or _G.ElectricClaw or _G.FarmGunMastery or _G.HolyTorch or _G.LawRaid or _G.FarmBoss or _G.TwinHooks or _G.OpenSwanDoor or _G.Dragon_Trident or _G.Saber or _G.NoClip or _G.FarmFruitMastery or _G.FarmGunMastery or _G.TeleportIsland or _G.EvoRace or _G.FarmAllMsBypassType or _G.Observationv2 or _G.MusketeerHat or _G.Ectoplasm or _G.Rengoku or _G.Rainbow_Haki or _G.Observation or _G.DarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.BudySword or _G.OderSword or _G.AllBoss or _G.Sharkman or _G.Mastery_Fruit or _G.Mastery_Gun or _G.Dungeon or _G.Cavender or _G.Pole or _G.Factory or _G.SecondSea or _G.TeleportPly or _G.Bartilo or _G.DarkBoss or _G.Level or _G.Clip or _G.Elitehunter or _G.ThirdSea or _G.Bone or _G.heart or _G.doughking or _G.d or _G.waden or _G.gay or _G.ObservationHakiV2 or _G.FarmMaterial or _G.FarmNearest or _G.Carvender or _G.TwinHook or AutoMobAura or _G.Leather or _G.Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.FarmSeabaest or _G.CDK or _G.RaidPirate or getgenv().AutoFarm or _G.PlayerHunter or _G.Factory or _G.AttackDummy or _G.Seabest or _G.SeaBest or _G.KillTial or _G.Saber or _G.Farmfast or _G.RaidPirate or _G.Terrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.bjirFishBoat or (_G.KillGhostShip == true)) then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
			end);
		end
	end
end);
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if (_G.Click or Fastattack) then
			pcall(function()
				game:GetService("VirtualUser"):CaptureController();
				game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1));
			end);
		end
	end);
end);
function StopTween(v343)
	if  not v343 then
		_G.StopTween = true;
		wait();
		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
		wait();
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy();
		end
		_G.StopTween = false;
		_G.Clip = false;
	end
	if game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
		game.Players.LocalPlayer.Character:FindFirstChild("Highlight"):Destroy();
	end
end
spawn(function()
	pcall(function()
		while wait() do
			for v1495, v1496 in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
				if v1496:IsA("Tool") then
					if v1496:FindFirstChild("RemoteFunctionShoot") then
						SelectWeaponGun = v1496.Name;
					end
				end
			end
		end
	end);
end);
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	wait(1);
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);
PosY = 25;
Kill_At = 28;
local v56 = v28:Window(Enum.KeyCode.RightControl);
local v57 = v56:T("Trạng thái", "rbxassetid://10734984606");
local v58 = v56:T("chung", "rbxassetid://15712703260");
local v59 = v56:T("Cài Đặt ", "rbxassetid://15712711639");
local v60 = v56:T("Vật Phẩm", "rbxassetid://15712717270");
local v61 = v56:T("Tộc - Đảo Bí Ẩn", "rbxassetid://15712776421");
local v62 = v56:T("Người Chơi", "rbxassetid://10747373176");
local v63 = v56:T("Thị giác", "rbxassetid://10723346959");
local v64 = v56:T("Tập Kích", "rbxassetid://10723345749");
local v65 = v56:T("Di Chuyển", "rbxassetid://15712738876");
local v66 = v56:T("Cửa Hàng", "rbxassetid://10734952479");
local v67 = v56:T("Trái Ác Quỷ", "rbxassetid://15712758182");
local v68 = v56:T("Máy Chủ", "rbxassetid://10709782582");
v57:Seperator("Info Hub");
v57:Label("Discord Trẩu Roblox Và Shop Uy Tín Số 1 Vn");
v57:Button("Sao Chép Link Discord", function()
	setclipboard("https://discord.gg/s8R9b5NfsU");
end);
v57:Button("Sao Chép Link Shop", function()
	setclipboard("https://trauroblox.site/");
end);
v57:Seperator("Thời Gian");
Time = v57:Label("Thời Gian Hoạt Động");
function UpdateTime()
	local v344 = math.floor(workspace.DistributedGameTime + 0.5 );
	local v345 = math.floor(v344 / (60 ^ 2) ) % 24 ;
	local v346 = math.floor(v344 / (60 ^ 1) ) % 60 ;
	local v347 = math.floor(v344 / (60 ^ 0) ) % 60 ;
	Time:Set("[Thời Gian Máy Chủ]: Giờ: "   .. v345   .. " Phút: "   .. v346   .. " Giây: "   .. v347 );
end
spawn(function()
	while task.wait() do
		pcall(function()
			UpdateTime();
		end);
	end
end);
Client = v57:Label("Client");
function UpdateClient()
	local v348 = workspace:GetRealPhysicsFPS();
	Client:Set("[FPS]: "   .. v348 );
end
spawn(function()
	while true do
		wait(0.1);
		UpdateClient();
	end
end);
Client1 = v57:Label("Client");
function UpdateClient1()
	local v349 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString();
	Client1:Set("[PING]: "   .. v349 );
end
spawn(function()
	while true do
		wait(0.1);
		UpdateClient1();
	end
end);
v57:Seperator("Người Chơi");
local v69 = v57:Label("Tộc");
spawn(function()
	while wait() do
		pcall(function()
			v69:Set("Race:"   .. " "   .. game:GetService("Players").LocalPlayer.Data.Race.Value );
		end);
	end
end);
local v70 = v57:Label("Beli");
spawn(function()
	while wait() do
		pcall(function()
			v70:Set("Beli:"   .. " "   .. game:GetService("Players").LocalPlayer.Data.Beli.Value );
		end);
	end
end);
local v71 = v57:Label("Điểm Tím");
spawn(function()
	while wait() do
		pcall(function()
			v71:Set("Diểm Tím:"   .. " "   .. game:GetService("Players").LocalPlayer.Data.Fragments.Value );
		end);
	end
end);
local v72 = v57:Label("Tiền Thưởng");
spawn(function()
	while wait() do
		pcall(function()
			v72:Set("Tiền Thưởng:"   .. " "   .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value );
		end);
	end
end);
local v73 = v57:Label("Trái");
spawn(function()
	while wait() do
		pcall(function()
			if (game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)) then
				v73:Set("Trái:"   .. " "   .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value );
			else
				v73:Set("Không Có Trái");
			end
		end);
	end
end);
v57:Label("Dev Hub");
v57:Button("Link Discord", function()
	setclipboard("https://discord.com/invite/hcJ8PHtkfy");
end);
v58:Seperator("Vũ Khí");
local v74 = {
	"Võ",
	"Kiếm",
	"Trái",
	"Súng"
};
_G.SelectWeapon = "Võ";
v58:Dropdown("Chọn Vũ Khí", v74, function(v350)
	_G.SelectWeapon = v350;
end);
task.spawn(function()
	while wait() do
		pcall(function()
			if (_G.SelectWeapon == "Võ") then
				for v1637, v1638 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if (v1638.ToolTip == "Melee") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1638.Name)) then
							_G.SelectWeapon = v1638.Name;
						end
					end
				end
			elseif (_G.SelectWeapon == "Kiếm") then
				for v1851, v1852 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if (v1852.ToolTip == "Sword") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1852.Name)) then
							_G.SelectWeapon = v1852.Name;
						end
					end
				end
			elseif (_G.SelectWeapon == "Súng") then
				for v2116, v2117 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if (v2117.ToolTip == "Gun") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v2117.Name)) then
							_G.SelectWeapon = v2117.Name;
						end
					end
				end
			elseif (_G.SelectWeapon == "Trái") then
				for v2312, v2313 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if (v2313.ToolTip == "Blox Fruit") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v2313.Name)) then
							_G.SelectWeapon = v2313.Name;
						end
					end
				end
			end
		end);
	end
end);
local v75 = {
	"Bình Thường",
	"Nhanh",
	"Siêu Nhanh",
	"Cực Nhanh"
};
_G.FastAttackDelay = "Bình Thường";
v58:Dropdown("Tốc Độ Đánh", v75, function(v351)
	_G.FastAttackDelay = v351;
end);
spawn(function()
	while wait(0.1) do
		if _G.FastAttackDelay then
			pcall(function()
				if (_G.FastAttackDelay == "Bình Thường") then
					_G.FastAttackDelay = 0.13;
				elseif (_G.FastAttackDelay == "Nhanh") then
					_G.FastAttackDelay = 0.07;
				elseif (_G.FastAttackDelay == "Siêu Nhanh") then
					_G.FastAttackDelay = 0.04;
				elseif (_G.FastAttackDelay == "Cực Nhanh") then
					_G.FastAttackDelay = 0;
				end
			end);
		end
	end
end);
_G.FastAttack = true;
if _G.FastAttack then
	local _ENV = (getgenv or getrenv or getfenv)();
	local function v758(v1363, v1364)
		local v1365, v1366 = pcall(function()
			return v1363:WaitForChild(v1364);
		end);
		if ( not v1365 or  not v1366) then
			warn("noooooo: "   .. v1364 );
		end
		return v1366;
	end
	local function v759(v1367, ...)
		local v1368 = v1367;
		for v1497, v1498 in {
			...
		} do
			v1368 = v1368:FindFirstChild(v1498) or v758(v1368, v1498) ;
			if  not v1368 then
				break;
			end
		end
		return v1368;
	end
	local v760 = game:GetService("VirtualInputManager");
	local v761 = game:GetService("CollectionService");
	local v762 = game:GetService("ReplicatedStorage");
	local v763 = game:GetService("TeleportService");
	local v764 = game:GetService("RunService");
	local v765 = game:GetService("Players");
	local v766 = v765.LocalPlayer;
	if  not v766 then
		warn("Không tìm thấy người chơi cục bộ.");
		return;
	end
	local v767 = v758(v762, "Remotes");
	if  not v767 then
		return;
	end
	local v768 = v758(v767, "Validator");
	local v769 = v758(v767, "CommF_");
	local v770 = v758(v767, "CommE");
	local v771 = v758(workspace, "ChestModels");
	local v772 = v758(workspace, "_WorldOrigin");
	local v773 = v758(workspace, "Characters");
	local v774 = v758(workspace, "Enemies");
	local v775 = v758(workspace, "Map");
	local v776 = v758(v772, "EnemySpawns");
	local v777 = v758(v772, "Locations");
	local v778 = v764.RenderStepped;
	local v779 = v764.Heartbeat;
	local v780 = v764.Stepped;
	local v781 = v758(v762, "Modules");
	local v782 = v758(v781, "Net");
	local v783 = sethiddenproperty or function(...)
		return ...;
	end ;
	local v784 = setupvalue or (debug and debug.setupvalue) ;
	local v785 = getupvalue or (debug and debug.getupvalue) ;
	local v786 = {
		AutoClick = true,
		ClickDelay = 0
	};
	local v787 = {};
	v787.FastAttack = (function()
		if _ENV.rz_FastAttack then
			return _ENV.rz_FastAttack;
		end
		local v1369 = {
			Distance = 100,
			attackMobs = true,
			attackPlayers = true,
			Equipped = nil
		};
		local v1370 = v758(v782, "RE/RegisterAttack");
		local v1371 = v758(v782, "RE/RegisterHit");
		local function v1372(v1499)
			return v1499 and v1499:FindFirstChild("Humanoid") and (v1499.Humanoid.Health > 0) ;
		end
		local function v1373(v1500, v1501)
			local v1502 = nil;
			for v1591, v1592 in v1501:GetChildren() do
				local v1593 = v1592:FindFirstChild("Head");
				if (v1593 and v1372(v1592) and (v766:DistanceFromCharacter(v1593.Position) < v1369.Distance)) then
					if (v1592 ~= v766.Character) then
						table.insert(v1500, {
							v1592,
							v1593
						});
						v1502 = v1593;
					end
				end
			end
			return v1502;
		end
		v1369.Attack = function(v1503, v1504, v1505)
			if ( not v1504 or ( #v1505 == 0)) then
				return;
			end
			v1370:FireServer(v786.ClickDelay or 0 );
			v1371:FireServer(v1504, v1505);
		end;
		v1369.AttackNearest = function(v1506)
			local v1507 = {};
			local v1508 = v1373(v1507, v774);
			local v1509 = v1373(v1507, v773);
			if ( #v1507 > 0) then
				v1506:Attack(v1508 or v1509 , v1507);
			else
				task.wait(0);
			end
		end;
		v1369.BladeHits = function(v1510)
			local v1511 = v1372(v766.Character) and v766.Character:FindFirstChildOfClass("Tool") ;
			if (v1511 and (v1511.ToolTip ~= "Gun")) then
				v1510:AttackNearest();
			else
				task.wait(0);
			end
		end;
		task.spawn(function()
			while task.wait(v786.ClickDelay) do
				if v786.AutoClick then
					v1369:BladeHits();
				end
			end
		end);
		_ENV.rz_FastAttack = v1369;
		return v1369;
	end)();
end
v58:Seperator("Tự Động Cày");
v58:Toggle("Cày Cấp", _G.Farm, function(v352)
	_G.Level = v352;
	StopTween(_G.Farm);
end);
spawn(function()
	while wait() do
		if _G.Level then
			pcall(function()
				local v1594 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if  not string.find(v1594, NameMon) then
					StartMagnet = false;
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
				end
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					StartMagnet = false;
					CheckQuest();
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 3500) then
							BTP(CFrameQuest);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 3500) then
							TP1(CFrameQuest);
						end
					else
						TP1(CFrameQuest);
					end
					if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end
				elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					CheckQuest();
					if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
						for v2314, v2315 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2315:FindFirstChild("HumanoidRootPart") and v2315:FindFirstChild("Humanoid") and (v2315.Humanoid.Health > 0)) then
								if (v2315.Name == Mon) then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										repeat
											task.wait();
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											PosMon = v2315.HumanoidRootPart.CFrame;
											TP1(v2315.HumanoidRootPart.CFrame * Pos );
											v2315.HumanoidRootPart.CanCollide = false;
											v2315.Humanoid.WalkSpeed = 0;
											v2315.Head.CanCollide = false;
											v2315.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											StartMagnet = true;
										until  not _G.Level or (v2315.Humanoid.Health <= 0) or  not v2315.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
									else
										StartMagnet = false;
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
									end
								end
							end
						end
					else
						TP1(CFrameMon);
						UnEquipWeapon(_G.SelectWeapon);
						StartMagnet = false;
						if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
							TP1(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15, 10, 2) );
						end
					end
				end
			end);
		end
	end
end);
if World1 then
	v58:Toggle("Cày Cấp Nhanh ( Cấp 1-300 )", _G.FarmFast, function(v1377)
		_G.Farmfast = v1377;
		StopTween(_G.Farmfast);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if (_G.Farmfast and World1) then
					if (game.Players.LocalPlayer.Data.Level.Value >= 10) then
						_G.Level = false;
						_G.Farmfast = true;
					end
				end
			end
		end);
	end);
	spawn(function()
		while wait() do
			if (_G.Farmfast and World1) then
				pcall(function()
					if (game.Players.LocalPlayer.Data.Level.Value >= 10) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -7894.6176757813, 5547.1416015625, -380.29119873047));
						for v2118, v2119 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2119.Name == "Shanda") then
								if (v2119:FindFirstChild("Humanoid") and v2119:FindFirstChild("HumanoidRootPart") and (v2119.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2119.HumanoidRootPart.CanCollide = false;
										v2119.Humanoid.WalkSpeed = 0;
										StardMag = true;
										FastMon = v2119.HumanoidRootPart.CFrame;
										v2119.HumanoidRootPart.Size = Vector3.new(80, 80, 80);
										TP1(v2119.HumanoidRootPart.CFrame * Pos );
									until  not _G.Farmfast or  not v2119.Parent or (v2119.Humanoid.Health <= 0)
									StardMag = false;
									TP1(CFrame.new( -7678.48974609375, 5566.40380859375, -497.2156066894531));
									UnEquipWeapon(_G.SelectWeapon);
								end
							end
						end
					elseif game:GetService("ReplicatedStorage"):FindFirstChild("Shanda") then
						TP1(game:GetService("ReplicatedStorage"):FindFirstChild("Shanda").HumanoidRootPart.CFrame * CFrame.new(5, 10, 2) );
					end
				end);
			end
		end
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if (_G.Farmfast and World1) then
					if (game.Players.LocalPlayer.Data.Level.Value >= 75) then
						_G.Farmfast = false;
						_G.PlayerHunter = true;
					end
				end
			end
		end);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if (_G.Farmfast and World1) then
					if (game.Players.LocalPlayer.Data.Level.Value >= 200) then
						_G.Level = true;
						_G.PlayerHunter = false;
					end
				end
			end
		end);
	end);
end
v58:Toggle("Cày Cấp Và Mua Item", false, function(v353)
	_G.Level = v353;
	_G.SelectWeapon = "Combat";
	_G.Stats_Kaitun = v353;
	_G.Superhuman = v353;
	_G.SecondSea = v353;
	_G.ThirdSea = v353;
	_G.BuyLegendarySword = v353;
	_G.StoreFruit = v353;
	_G.Random_Auto = v353;
	_G.BuyAllAib = v353;
	_G.BuyAllSword = v353;
	StopTween(_G.Farm);
end);
spawn(function()
	while wait() do
		if _G.BuyAllSword then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
				if _G.BuyHop then
					wait(10);
					Hop();
				end
			end);
		end
	end
end);
spawn(function()
	while wait() do
		if _G.BuyAllAib then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
				if _G.HopBuy then
					wait(10);
					Hop();
				end
			end);
		end
	end
end);
v58:Toggle("Đánh Quái Ở Gần", _G.FarmNearest, function(v354)
	_G.FarmNearest = v354;
	StopTween(_G.FarmNearest);
end);
spawn(function()
	while wait() do
		if _G.FarmNearest then
			for v1595, v1596 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if (v1596.Name and v1596:FindFirstChild("Humanoid")) then
					if (v1596.Humanoid.Health > 0) then
						repeat
							wait();
							EquipWeapon(_G.SelectWeapon);
							if  not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
								local v2316 = {
									[1] = "Buso"
								};
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v2316));
							end
							topos(v1596.HumanoidRootPart.CFrame * Pos );
							v1596.HumanoidRootPart.CanCollide = false;
							Fastattack = true;
							v1596.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
							AutoFarmNearestMagnet = true;
							PosMon = v1596.HumanoidRootPart.CFrame;
						until  not _G.FarmNearest or  not v1596.Parent or (v1596.Humanoid.Health <= 0)
						AutoFarmNearestMagnet = false;
						Fastattack = false;
					end
				end
			end
		end
	end
end);
v58:Seperator("Elite");
local v76 = v58:Label("N/A");
spawn(function()
	while wait() do
		pcall(function()
			if (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
				v76:Set("Trạng thái: Có");
			else
				v76:Set("Trạng thái: Không");
			end
		end);
	end
end);
v58:Toggle("Đánh Elite Hunter", _G.Elitehunter, function(v355)
	_G.Elitehunter = v355;
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
	StopTween(_G.Elitehunter);
end);
spawn(function()
	while wait() do
		if (_G.Elitehunter and World3) then
			pcall(function()
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
						if (game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
							for v2317, v2318 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if ((v2318.Name == "Diablo") or (v2318.Name == "Deandre") or (v2318.Name == "Urban")) then
									if (v2318:FindFirstChild("Humanoid") and v2318:FindFirstChild("HumanoidRootPart") and (v2318.Humanoid.Health > 0)) then
										repeat
											wait();
											AutoHaki();
											EquipWeapon(_G.SelectWeapon);
											v2318.HumanoidRootPart.CanCollide = false;
											v2318.Humanoid.WalkSpeed = 0;
											v2318.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											topos(v2318.HumanoidRootPart.CFrame * CFrame.new(PosX, PosY, PosZ) );
											game:GetService("VirtualUser"):CaptureController();
											game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
											sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
										until (_G.Elitehunter == false) or (v2318.Humanoid.Health <= 0) or  not v2318.Parent
									end
								end
							end
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						end
					end
				elseif (_G.EliteHunterHop and (game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later.")) then
					hop();
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter");
				end
			end);
		end
	end
end);
v58:Toggle("Đánh Elite Đổi Sever", _G.EliteHunterHop, function(v356)
	_G.EliteHunterHop = v356;
end);
v58:Seperator("Nhiệm Vụ");
local v77 = {
	"Không Nhận",
	"Nhận"
};
Mode = "Nhận";
v58:Dropdown("Nhận Nhiệm Vụ Xương Và Bánh ngọt", v77, function(v357)
	Mode = v357;
end);
local v78 = CFrame.new( -2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.8030205e-8, 0.288177818, 6.930119e-8, 1, 7.519312e-8, -0.288177818, -5.2032135e-8, 0.957576931);
spawn(function()
	while wait() do
		if ((Mode == "Nhận") and _G.DoughtBoss and World3) then
			pcall(function()
				if (game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")) then
					for v1853, v1854 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if ((v1854.Name == "Cake Prince") or (v1854.Name == "Dough King")) then
							if (v1854:FindFirstChild("Humanoid") and v1854:FindFirstChild("HumanoidRootPart") and (v1854.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1854.HumanoidRootPart.CanCollide = false;
									v1854.Humanoid.WalkSpeed = 0;
									v1854.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1854.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.DoughtBoss or  not v1854.Parent or (v1854.Humanoid.Health <= 0)
							end
						end
					end
				elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
					topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(5, 10, 2) );
				end
			end);
		end
	end
end);
spawn(function()
	while wait() do
		if (Mode and _G.DoughtBoss and World3 and  not game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince")) then
			pcall(function()
				local v1597 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if  not string.find(v1597, "Cookie Crafter") then
					MagnetDought = false;
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
				end
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					MagnetDought = false;
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v78.Position).Magnitude > 3500) then
							BTP(v78);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v78.Position).Magnitude < 3500) then
							topos(v78);
						end
					else
						topos(v78);
					end
					if ((v78.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1);
					end
				elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")) then
						for v2319, v2320 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2320:FindFirstChild("HumanoidRootPart") and v2320:FindFirstChild("Humanoid") and (v2320.Humanoid.Health > 0)) then
								if ((v2320.Name == "Cookie Crafter") or (v2320.Name == "Cake Guard") or (v2320.Name == "Baking Staff") or (v2320.Name == "Head Baker")) then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Cookie Crafter") then
										repeat
											task.wait();
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											PosMonCake = v2320.HumanoidRootPart.CFrame;
											topos(v2320.HumanoidRootPart.CFrame * Pos );
											v2320.HumanoidRootPart.CanCollide = false;
											v2320.Humanoid.WalkSpeed = 0;
											v2320.Head.CanCollide = false;
											v2320.HumanoidRootPart.Size = Vector3.new(70, 70, 70);
											MagnetDought = true;
											PosMonDoughtOpenDoor = v2320.HumanoidRootPart.CFrame;
										until  not _G.DoughtBoss or  not v2320.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) or (v2320.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0) or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or (KillMob == 0)
									else
										MagnetDought = false;
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
									end
								end
							end
						end
					else
						MagnetDought = false;
						if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(15, 10, 2) );
						end
					end
				end
			end);
		end
	end
end);
local v79 = CFrame.new( -9515.75, 174.8521728515625, 6079.40625);
spawn(function()
	while wait() do
		if ((Mode == "Nhận") and _G.Bone and World3) then
			pcall(function()
				local v1598 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if  not string.find(v1598, "Demonic Soul") then
					StartMagnetBoneMon = false;
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
				end
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					StartMagnetBoneMon = false;
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v79.Position).Magnitude > 3500) then
							BTP(v79);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v79.Position).Magnitude < 3500) then
							topos(v79);
						end
					else
						topos(v79);
					end
					if ((v79.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1);
					end
				elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
						for v2321, v2322 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2322:FindFirstChild("HumanoidRootPart") and v2322:FindFirstChild("Humanoid") and (v2322.Humanoid.Health > 0)) then
								if ((v2322.Name == "Reborn Skeleton") or (v2322.Name == "Living Zombie") or (v2322.Name == "Demonic Soul") or (v2322.Name == "Posessed Mummy")) then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
										repeat
											task.wait();
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											PosMonBone = v2322.HumanoidRootPart.CFrame;
											topos(v2322.HumanoidRootPart.CFrame * Pos );
											v2322.HumanoidRootPart.CanCollide = false;
											v2322.Humanoid.WalkSpeed = 0;
											v2322.Head.CanCollide = false;
											v2322.HumanoidRootPart.Size = Vector3.new(70, 70, 70);
											StartMagnetBoneMon = true;
										until  not _G.Bone or (v2322.Humanoid.Health <= 0) or  not v2322.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
									else
										StartMagnetBoneMon = false;
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
									end
								end
							end
						end
					else
						StartMagnetBoneMon = false;
						if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul [Lv. 2025]").HumanoidRootPart.CFrame * CFrame.new(15, 10, 2) );
						end
					end
				end
			end);
		end
	end
end);
v58:Seperator("Xương");
BoneCheck = v58:Label("Xương Của Bạn: N/A");
spawn(function()
	while wait() do
		pcall(function()
			BoneCheck:Set("Xương Của Bạn: "   .. (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")) );
		end);
	end
end);
v58:Toggle("Cày Xương", _G.Bone, function(v358)
	_G.Bone = v358;
	StopTween(_G.Bone);
end);
local v80 = CFrame.new( -9506.234375, 172.130615234375, 6117.0771484375);
spawn(function()
	while wait() do
		if ((Mode == "Không Nhận") and _G.Bone and World3) then
			pcall(function()
				if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
					for v1855, v1856 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if ((v1856.Name == "Reborn Skeleton") or (v1856.Name == "Living Zombie") or (v1856.Name == "Demonic Soul") or (v1856.Name == "Posessed Mummy")) then
							if (v1856:FindFirstChild("Humanoid") and v1856:FindFirstChild("HumanoidRootPart") and (v1856.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1856.HumanoidRootPart.CanCollide = false;
									v1856.Humanoid.WalkSpeed = 0;
									v1856.Head.CanCollide = false;
									StartMagnetBoneMon = true;
									PosMonBone = v1856.HumanoidRootPart.CFrame;
									topos(v1856.HumanoidRootPart.CFrame * Pos );
								until  not _G.Bone or  not v1856.Parent or (v1856.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v80.Position).Magnitude > 3500) then
							BTP(v80);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v80.Position).Magnitude < 3500) then
							topos(v80);
						end
					else
						topos(v80);
					end
					UnEquipWeapon(_G.SelectWeapon);
					StartMagnetBoneMon = false;
					topos(CFrame.new( -9506.234375, 172.130615234375, 6117.0771484375));
					for v1857, v1858 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
						if (v1858.Name == "Reborn Skeleton") then
							topos(v1858.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif (v1858.Name == "Living Zombie") then
							topos(v1858.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif (v1858.Name == "Demonic Soul") then
							topos(v1858.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif (v1858.Name == "Posessed Mummy") then
							topos(v1858.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						end
					end
				end
			end);
		end
	end
end);
v58:Toggle("Đổi Xương", _G.Random_Bone, function(v359)
	_G.Random_Bone = v359;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Random_Bone then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1);
			end
		end
	end);
end);
v58:Toggle("Tự động cầu nguyện", pry, function(v360)
	_G.Pray = v360;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.Pray then
				TP1(CFrame.new( -8652.99707, 143.450119, 6170.50879, -0.983064115, -2.4800553e-10, 0.18326205, -1.7891039e-9, 1, -8.243923e-9, -0.18326205, -8.43218e-9, -0.983064115));
				wait();
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 1);
			end
		end
	end);
end);
v58:Toggle("Tự động thử vận may", Trylux, function(v361)
	_G.Trylux = v361;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.Trylux then
				TP1(CFrame.new( -8652.99707, 143.450119, 6170.50879, -0.983064115, -2.4800553e-10, 0.18326205, -1.7891039e-9, 1, -8.243923e-9, -0.18326205, -8.43218e-9, -0.983064115));
				wait();
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2);
			end
		end
	end);
end);
v58:Seperator("Bột");
local v81 = v58:Label("Killed");
spawn(function()
	while wait() do
		pcall(function()
			if (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88) then
				v81:Set("Defeat: "   .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) );
			elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87) then
				v81:Set("Defeat: "   .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) );
			elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86) then
				v81:Set("Defeat: "   .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) );
			else
				v81:Set("Boss Is Spawning");
			end
		end);
	end
end);
v58:Toggle("Đánh Tư Lệnh Bột", _G.DoughtBoss, function(v362)
	_G.DoughtBoss = v362;
	StopTween(_G.DoughtBoss);
end);
spawn(function()
	while wait() do
		pcall(function()
			if (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88) then
				KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41)) - 500 ;
			elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87) then
				KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 40, 41)) - 500 ;
			elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86) then
				KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 41, 41)) - 500 ;
			end
		end);
	end
end);
local v82 = CFrame.new( -2091.911865234375, 70.00884246826172, -12142.8359375);
spawn(function()
	while wait() do
		if ((Mode == "Không Nhận") and _G.DoughtBoss) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
					for v1859, v1860 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1860.Name == "Cake Prince") then
							if (v1860:FindFirstChild("Humanoid") and v1860:FindFirstChild("HumanoidRootPart") and (v1860.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1860.HumanoidRootPart.CanCollide = false;
									v1860.Humanoid.WalkSpeed = 0;
									v1860.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1860.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.DoughtBoss or  not v1860.Parent or (v1860.Humanoid.Health <= 0)
							end
						end
					end
				elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
					topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
				else
					if (KillMob == 0) then
					end
					if (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1) then
						if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")) then
							for v2430, v2431 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if ((v2431.Name == "Cookie Crafter") or (v2431.Name == "Cake Guard") or (v2431.Name == "Baking Staff") or (v2431.Name == "Head Baker")) then
									if (v2431:FindFirstChild("Humanoid") and v2431:FindFirstChild("HumanoidRootPart") and (v2431.Humanoid.Health > 0)) then
										repeat
											task.wait();
											AutoHaki();
											EquipWeapon(_G.SelectWeapon);
											v2431.HumanoidRootPart.CanCollide = false;
											v2431.Humanoid.WalkSpeed = 0;
											v2431.Head.CanCollide = false;
											v2431.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											MagnetDought = true;
											PosMonDoughtOpenDoor = v2431.HumanoidRootPart.CFrame;
											topos(v2431.HumanoidRootPart.CFrame * Pos );
										until  not _G.DoughtBoss or  not v2431.Parent or (v2431.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0) or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or (KillMob == 0)
									end
								end
							end
						else
							if BypassTP then
								if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v82.Position).Magnitude > 3500) then
									BTP(v82);
								elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v82.Position).Magnitude < 3500) then
									topos(v82);
								end
							else
								topos(v82);
							end
							MagnetDought = false;
							UnEquipWeapon(_G.SelectWeapon);
							topos(CFrame.new( -2091.911865234375, 70.00884246826172, -12142.8359375));
							if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							end
						end
					elseif game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
						topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					end
				end
			end);
		end
	end
end);
v58:Toggle("Tự Động Triệu Hồi Tư Lệnh", false, function(v363)
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", value);
end);
v58:Toggle("Vua bột tự động", _G.doughking, function(v364)
	_G.doughking = v364;
	StopTween(_G.doughking);
end);
v58:Toggle("Vua bột tự động Đổi Sever", _G.doughkingHop, function(v365)
	_G.doughkingHop = v365;
end);
spawn(function()
	while wait() do
		if (_G.doughking and World3) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
					for v1861, v1862 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1862.Name == "Dough King") then
							if (v1862:FindFirstChild("Humanoid") and v1862:FindFirstChild("HumanoidRootPart") and (v1862.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1862.HumanoidRootPart.CanCollide = false;
									v1862.Humanoid.WalkSpeed = 0;
									v1862.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1862.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.doughking or  not v1862.Parent or (v1862.Humanoid.Health <= 0)
							end
						end
					end
				else
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -2662.818603515625, 1062.3480224609375, -11853.6953125));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.doughkingHop then
						Hop();
					end
				end
			end);
		end
	end
end);
v58:Seperator("Thông Thạo");
v58:Toggle("Cày Thông Thạo Trái", _G.FarmFruitMastery, function(v366)
	_G.FarmFruitMastery = v366;
	StopTween(_G.FarmFruitMastery);
	if (_G.FarmFruitMastery == false) then
		UseSkill = false;
	end
end);
spawn(function()
	while wait() do
		if _G.FarmFruitMastery then
			pcall(function()
				local v1599 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if  not string.find(v1599, NameMon) then
					Magnet = false;
					UseSkill = false;
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
				end
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					StartMasteryFruitMagnet = false;
					UseSkill = false;
					CheckQuest();
					repeat
						wait();
						TP1(CFrameQuest);
					until ((CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or  not _G.FarmFruitMastery
					if ((CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5) then
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
						wait(0.1);
					end
				elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					CheckQuest();
					if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
						for v2323, v2324 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2324:FindFirstChild("HumanoidRootPart") and v2324:FindFirstChild("Humanoid") and (v2324.Humanoid.Health > 0)) then
								if (v2324.Name == Mon) then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										HealthMs = (v2324.Humanoid.MaxHealth * Kill_At) / 100 ;
										repeat
											task.wait();
											if (v2324.Humanoid.Health <= HealthMs) then
												AutoHaki();
												EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value);
												TP1(v2324.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) );
												v2324.HumanoidRootPart.CanCollide = false;
												PosMonMasteryFruit = v2324.HumanoidRootPart.CFrame;
												v2324.Humanoid.WalkSpeed = 0;
												v2324.Head.CanCollide = false;
												UseSkill = true;
											else
												UseSkill = false;
												AutoHaki();
												EquipWeapon(_G.SelectWeapon);
												TP1(v2324.HumanoidRootPart.CFrame * Pos );
												v2324.HumanoidRootPart.CanCollide = false;
												v2324.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
												PosMonMasteryFruit = v2324.HumanoidRootPart.CFrame;
												v2324.Humanoid.WalkSpeed = 0;
												v2324.Head.CanCollide = false;
											end
											StartMasteryFruitMagnet = true;
										until  not _G.FarmFruitMastery or (v2324.Humanoid.Health <= 0) or  not v2324.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
									else
										UseSkill = false;
										StartMasteryFruitMagnet = false;
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
									end
								end
							end
						end
					else
						TP1(CFrameMon);
						UnEquipWeapon(_G.SelectWeapon);
						StartMasteryFruitMagnet = false;
						UseSkill = false;
						local v2291 = game:GetService("ReplicatedStorage"):FindFirstChild(Mon);
						if v2291 then
							TP1(v2291.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10) );
						elseif (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1) then
							game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true;
							task.wait();
							game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false;
						end
					end
				end
			end);
		end
	end
end);
spawn(function()
	while wait() do
		if UseSkill then
			pcall(function()
				CheckQuest();
				for v1639, v1640 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
						MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value;
					elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
						MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value;
					end
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
						if _G.SkillZ then
							local v2124 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2124));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
						end
						if _G.SkillX then
							local v2125 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2125));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
						end
						if _G.SkillC then
							local v2126 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2126));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
							wait(2);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
						end
					elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
						if _G.SkillZ then
							local v2325 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2325));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
						end
						if _G.SkillX then
							local v2326 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2326));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
						end
						if _G.SkillC then
							local v2327 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2327));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
							wait(2);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
						end
					elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
						if (_G.SkillZ and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1))) then
							local v2432 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2432));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
						end
						if _G.SkillX then
							local v2433 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2433));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
						end
						if _G.SkillC then
							local v2434 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2434));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
						end
						if _G.SkillV then
							local v2435 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2435));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game);
						end
					elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
						if _G.SkillZ then
							local v2553 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2553));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
						end
						if _G.SkillX then
							local v2554 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2554));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
						end
						if _G.SkillC then
							local v2555 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2555));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
						end
						if _G.SkillV then
							local v2556 = {
								[1] = PosMonMasteryFruit.Position
							};
							game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2556));
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game);
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game);
						end
					end
				end
			end);
		end
	end
end);
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		pcall(function()
			if UseSkill then
				for v1641, v1642 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
					if (v1642.Name == "NotificationTemplate") then
						if string.find(v1642.Text, "Skill locked!") then
							v1642:Destroy();
						end
					end
				end
			end
		end);
	end);
end);
spawn(function()
	pcall(function()
		game:GetService("RunService").RenderStepped:Connect(function()
			if UseSkill then
				local v1600 = {
					[1] = PosMonMasteryFruit.Position
				};
				game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(v1600));
			end
		end);
	end);
end);
v58:Toggle("Cày Thông Thạo Súng ", _G.FarmGunMastery, function(v367)
	_G.FarmGunMastery = v367;
	StopTween(_G.FarmGunMastery);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.FarmGunMastery then
				local v1601 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if  not string.find(v1601, NameMon) then
					Magnet = false;
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
				end
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					StartMasteryGunMagnet = false;
					CheckQuest();
					TP1(CFrameQuest);
					if ((CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end
				elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
					CheckQuest();
					if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
						pcall(function()
							for v2379, v2380 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2380.Name == Mon) then
									repeat
										task.wait();
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
											HealthMin = (v2380.Humanoid.MaxHealth * Kill_At) / 100 ;
											if (v2380.Humanoid.Health <= HealthMin) then
												EquipWeapon(SelectWeaponGun);
												TP1(v2380.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) );
												v2380.Humanoid.WalkSpeed = 0;
												v2380.HumanoidRootPart.CanCollide = false;
												v2380.HumanoidRootPart.Size = Vector3.new(2, 2, 1);
												v2380.Head.CanCollide = false;
												local v2643 = {
													[1] = v2380.HumanoidRootPart.Position,
													[2] = v2380.HumanoidRootPart
												};
												game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(v2643));
											else
												AutoHaki();
												EquipWeapon(_G.SelectWeapon);
												v2380.Humanoid.WalkSpeed = 0;
												v2380.HumanoidRootPart.CanCollide = false;
												v2380.Head.CanCollide = false;
												v2380.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
												TP1(v2380.HumanoidRootPart.CFrame * Pos );
											end
											StartMasteryGunMagnet = true;
											PosMonMasteryGun = v2380.HumanoidRootPart.CFrame;
										else
											StartMasteryGunMagnet = false;
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
										end
									until (v2380.Humanoid.Health <= 0) or (_G.FarmGunMastery == false) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
									StartMasteryGunMagnet = false;
								end
							end
						end);
					else
						TP1(CFrameMon);
						UnEquipWeapon(_G.SelectWeapon);
						_G.FarmGunMastery = false;
						local v2292 = game:GetService("ReplicatedStorage"):FindFirstChild(Mon);
						if v2292 then
							TP1(v2292.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10) );
						elseif (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1) then
							game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true;
							task.wait();
							game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false;
						end
					end
				end
			end
		end
	end);
end);
v58:Seperator("Quan sát");
v58:Toggle("Cày Điểm Haki Quan Sát", _G.Observation, function(v368)
	_G.Observation = v368;
	StopTween(_G.Observation);
end);
spawn(function()
	while wait() do
		pcall(function()
			if _G.Observation then
				repeat
					task.wait();
					if  not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
						game:GetService("VirtualUser"):CaptureController();
						game:GetService("VirtualUser"):SetKeyDown("0x65");
						wait(2);
						game:GetService("VirtualUser"):SetKeyUp("0x65");
					end
				until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or  not _G.Observation
			end
		end);
	end
end);
v58:Toggle("Cày Điểm Haki Đổi Sever", _G.Observation_Hop, function(v369)
	_G.Observation_Hop = v369;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Observation then
				if (game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000) then
					wait(2);
				elseif World2 then
					if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
						if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0) ;
							until (_G.Observation == false) or  not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						else
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = (game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)) + wait(1) ;
								if ( not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and (_G.Observation_Hop == true)) then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
								end
							until (_G.Observation == false) or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						end
					else
						topos(CFrame.new( -5478.39209, 15.9775667, -5246.9126));
					end
				elseif World1 then
					if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain") then
						if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0) ;
							until (_G.Observation == false) or  not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						else
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) ;
								wait(1);
								if ( not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and (_G.Observation_Hop == true)) then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
								end
							until (_G.Observation == false) or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						end
					else
						topos(CFrame.new(5533.29785, 88.1079102, 4852.3916));
					end
				elseif World3 then
					if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander") then
						if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0) ;
							until (_G.Observation == false) or  not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						else
							repeat
								task.wait();
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) ;
								wait(1);
								if ( not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and (_G.Observation_Hop == true)) then
									game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
								end
							until (_G.Observation == false) or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
						end
					else
						topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789));
					end
				end
			end
		end
	end);
end);
v58:Seperator("Trùm");
local v83 = v58:Label("Trạng thái : Chọn Trùm");
spawn(function()
	while wait() do
		pcall(function()
			if (game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) or game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss)) then
				v83:Set("Trạng thái : Có");
			else
				v83:Set("Trạng thái : Không");
			end
		end);
	end
end);
if World1 then
	v58:Dropdown("Chọn Trùm", {
		"The Gorilla King",
		"Bobby",
		"Yeti",
		"Mob Leader",
		"Vice Admiral",
		"Warden",
		"Chief Warden",
		"Swan",
		"Magma Admiral",
		"Fishman Lord",
		"Wysper",
		"Thunder God",
		"Cyborg",
		"Saber Expert"
	}, function(v1378)
		_G.SelectBoss = v1378;
	end);
end
if World2 then
	v58:Dropdown("Chọn Trùm", {
		"Diamond",
		"Jeremy",
		"Fajita",
		"Don Swan",
		"Smoke Admiral",
		"Cursed Captain",
		"Darkbeard",
		"Order",
		"Awakened Ice Admiral",
		"Tide Keeper"
	}, function(v1379)
		_G.SelectBoss = v1379;
	end);
end
if World3 then
	v58:Dropdown("Chọn Trùm", {
		"Stone",
		"Island Empress",
		"Kilo Admiral",
		"Captain Elephant",
		"Beautiful Pirate",
		"rip_indra True Form",
		"Longma",
		"Soul Reaper",
		"Cake Queen"
	}, function(v1380)
		_G.SelectBoss = v1380;
	end);
end
v58:Toggle("Đánh Trùm Đã Chọn", _G.FarmBoss, function(v370)
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
	_G.FarmBoss = v370;
	StopTween(_G.FarmBoss);
end);
spawn(function()
	while wait() do
		if (_G.FarmBoss and BypassTP) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
					for v1864, v1865 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1865.Name == _G.SelectBoss) then
							if (v1865:FindFirstChild("Humanoid") and v1865:FindFirstChild("HumanoidRootPart") and (v1865.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1865.HumanoidRootPart.CanCollide = false;
									v1865.Humanoid.WalkSpeed = 0;
									v1865.HumanoidRootPart.Size = Vector3.new(80, 80, 80);
									topos(v1865.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.FarmBoss or  not v1865.Parent or (v1865.Humanoid.Health <= 0)
							end
						end
					end
				elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
					if ((game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500) then
						topos(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame);
					else
						BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame);
					end
				end
			end);
		end
	end
end);
spawn(function()
	while wait() do
		if (_G.FarmBoss and  not BypassTP) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
					for v1866, v1867 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1867.Name == _G.SelectBoss) then
							if (v1867:FindFirstChild("Humanoid") and v1867:FindFirstChild("HumanoidRootPart") and (v1867.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1867.HumanoidRootPart.CanCollide = false;
									v1867.Humanoid.WalkSpeed = 0;
									v1867.HumanoidRootPart.Size = Vector3.new(80, 80, 80);
									topos(v1867.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.FarmBoss or  not v1867.Parent or (v1867.Humanoid.Health <= 0)
							end
						end
					end
				elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
					topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7) );
				end
			end);
		end
	end
end);
v58:Toggle("Đánh Tất Cả Trùm", _G.AllBoss, function(v371)
	_G.AllBoss = v371;
	StopTween(_G.AllBoss);
end);
v58:Toggle("Đánh Tất Cả Trùm Đổi sever", _G.AllBossHop, function(v372)
	_G.AllBossHop = v372;
end);
spawn(function()
	while wait() do
		if _G.AllBoss then
			pcall(function()
				for v1643, v1644 in pairs(game.ReplicatedStorage:GetChildren()) do
					if ((v1644.Name == "rip_indra") or (v1644.Name == "Ice Admiral") or (v1644.Name == "Saber Expert") or (v1644.Name == "The Saw") or (v1644.Name == "Greybeard") or (v1644.Name == "Mob Leader") or (v1644.Name == "The Gorilla King") or (v1644.Name == "Bobby") or (v1644.Name == "Yeti") or (v1644.Name == "Vice Admiral") or (v1644.Name == "Warden") or (v1644.Name == "Chief Warden") or (v1644.Name == "Swan") or (v1644.Name == "Magma Admiral") or (v1644.Name == "Fishman Lord") or (v1644.Name == "Wysper") or (v1644.Name == "Thunder God") or (v1644.Name == "Cyborg") or (v1644.Name == "Don Swan") or (v1644.Name == "Diamond") or (v1644.Name == "Jeremy") or (v1644.Name == "Fajita") or (v1644.Name == "Smoke Admiral") or (v1644.Name == "Awakened Ice Admiral") or (v1644.Name == "Tide Keeper") or (v1644.Name == "Order") or (v1644.Name == "Darkbeard") or (v1644.Name == "Stone") or (v1644.Name == "Island Empress") or (v1644.Name == "Kilo Admiral") or (v1644.Name == "Captain Elephant") or (v1644.Name == "Beautiful Pirate") or (v1644.Name == "Cake Queen") or (v1644.Name == "rip_indra True Form") or (v1644.Name == "Longma") or (v1644.Name == "Soul Reaper") or (v1644.Name == "Cake Prince") or (v1644.Name == "Dough King")) then
						if ((v1644.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000) then
							repeat
								task.wait();
								AutoHaki();
								EquipWeapon(_G.SelectWeapon);
								v1644.Humanoid.WalkSpeed = 0;
								v1644.HumanoidRootPart.CanCollide = false;
								v1644.Head.CanCollide = false;
								v1644.HumanoidRootPart.Size = Vector3.new(80, 80, 80);
								topos(v1644.HumanoidRootPart.CFrame * Pos );
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
							until (v1644.Humanoid.Health <= 0) or (_G.AllBoss == false) or  not v1644.Parent
						end
					elseif _G.AllBossHop then
						Hop();
					end
				end
			end);
		end
	end
end);
v59:Seperator("Cày Đặt");
v59:Toggle("Duy Chuyển Dạng Reset", BypassTP, function(v373)
	BypassTP = v373;
end);
v59:Seperator("Bay");
local v84 = {
	"100",
	"150",
	"250",
	"300",
	"325",
	"350"
};
getgenv().TweenSpeed = "325";
v59:Dropdown("Tốc Độ Bay", v84, function(v374)
	getgenv().TweenSpeed = v374;
end);
v59:Button("Dừng Bay", function()
	topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
	_G.Clip = false;
end);
v59:Toggle("Gôm Quái", true, function(v376)
	_G.BringMonster = v376;
end);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.BringMonster then
				CheckQuest();
				for v1645, v1646 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if (_G.Level and StartMagnet and (v1646.Name == Mon) and ((Mon == "Factory Staff [Lv. 800]") or (Mon == "Monkey [Lv. 14]") or (Mon == "Dragon Crew Warrior [Lv. 1575]") or (Mon == "Dragon Crew Archer [Lv. 1600]")) and v1646:FindFirstChild("Humanoid") and v1646:FindFirstChild("HumanoidRootPart") and (v1646.Humanoid.Health > 0) and ((v1646.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220)) then
						v1646.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
						v1646.HumanoidRootPart.CFrame = PosMon;
						v1646.Humanoid:ChangeState(14);
						v1646.HumanoidRootPart.CanCollide = false;
						v1646.Head.CanCollide = false;
						if v1646.Humanoid:FindFirstChild("Animator") then
							v1646.Humanoid.Animator:Destroy();
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
					elseif (_G.Level and StartMagnet and (v1646.Name == Mon) and v1646:FindFirstChild("Humanoid") and v1646:FindFirstChild("HumanoidRootPart") and (v1646.Humanoid.Health > 0) and ((v1646.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode)) then
						v1646.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
						v1646.HumanoidRootPart.CFrame = PosMon;
						v1646.Humanoid:ChangeState(14);
						v1646.HumanoidRootPart.CanCollide = false;
						v1646.Head.CanCollide = false;
						if v1646.Humanoid:FindFirstChild("Animator") then
							v1646.Humanoid.Animator:Destroy();
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
					end
				end
			end
		end);
	end
end);
local v86 = {
	"Ít",
	"Vừa",
	"Nhiều"
};
_G.BringMode = "Ít";
v59:Dropdown("Chế Độ Gôm Quái", v86, function(v377)
	_G.BringMode = v377;
end);
spawn(function()
	while wait(0.1) do
		if _G.BringMode then
			pcall(function()
				if (_G.BringMode == "Ít") then
					_G.BringMode = 250;
				elseif (_G.BringMode == "Vừa") then
					_G.BringMode = 300;
				elseif (_G.BringMode == "Nhiều") then
					_G.BringMode = 350;
				end
			end);
		end
	end
end);
v59:Toggle("Tự Động Mở Haki", true, function(v378)
	_G.Haki = v378;
end);
spawn(function()
	while wait(0.1) do
		if _G.Haki then
			if  not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				local v1647 = {
					[1] = "Buso"
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1647));
			end
		end
	end
end);
v59:Toggle("Tự Động Nhấp chuột", false, function(v379)
	_G.Click = v379;
end);
v59:Toggle("Tắt Thông Báo", false, function(v380)
	_G.Remove_trct = v380;
end);
spawn(function()
	while wait() do
		if _G.Remove_trct then
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false;
		else
			game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true;
		end
	end
end);
v59:Toggle("Tắt Dame", true, function(v381)
	_G.KobenHeegeen = v381;
end);
spawn(function()
	while wait() do
		if _G.KobenHeegeen then
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false;
		else
			game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true;
		end
	end
end);
spawn(function()
	while wait() do
		if _G.WhiteScreen then
			for v1602, v1603 in pairs(game.Workspace['_WorldOrigin']:GetChildren()) do
				if ((v1603.Name == "CurvedRing") or (v1603.Name == "SlashHit") or (v1603.Name == "DamageCounter") or (v1603.Name == "SwordSlash") or (v1603.Name == "SlashTail") or (v1603.Name == "Sounds")) then
					v1603:Destroy();
				end
			end
		end
	end
end);
v59:Toggle("Màng Hình Trắng", _G.WhiteScreen, function(v382)
	_G.WhiteScreen = v382;
	if (_G.WhiteScreen == true) then
		game:GetService("RunService"):Set3dRenderingEnabled(false);
	elseif (_G.WhiteScreen == false) then
		game:GetService("RunService"):Set3dRenderingEnabled(true);
	end
end);
v59:Toggle("Ẩn Quái", _G.inv, function(v383)
	_G.inv = v383;
	while wait() do
		if _G.inv then
			pcall(function()
				for v1648, v1649 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
					if (v1649.ClassName == "MeshPart") then
						v1649.Transparency = 1;
					end
				end
				for v1650, v1651 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
					if (v1651.Name == "Head") then
						v1651.Transparency = 1;
					end
				end
				for v1652, v1653 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
					if (v1653.ClassName == "Accessory") then
						v1653.Handle.Transparency = 1;
					end
				end
				for v1654, v1655 in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
					if (v1655.ClassName == "Decal") then
						v1655.Transparency = 1;
					end
				end
			end);
		end
	end
end);
v59:Seperator("Cày Đặt Cày Thông Thạo");
v59:Toggle("Kỹ năng Z", true, function(v384)
	_G.SkillZ = v384;
end);
v59:Toggle("Kỹ năng X", true, function(v385)
	_G.SkillX = v385;
end);
v59:Toggle("Kỹ năng C", true, function(v386)
	_G.SkillC = v386;
end);
v59:Toggle("Kỹ năng V", true, function(v387)
	_G.SkillV = v387;
end);
if (World1 or World2) then
	v60:Seperator("World");
end
if World1 then
	v60:Toggle("Tự Động Qua Biển 2", _G.SecondSea, function(v1381)
		_G.SecondSea = v1381;
		StopTween(_G.SecondSea);
	end);
	spawn(function()
		while wait() do
			if _G.SecondSea then
				pcall(function()
					local v1700 = game:GetService("Players").LocalPlayer.Data.Level.Value;
					if ((v1700 >= 700) and World1) then
						if ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
							local v2297 = CFrame.new(4849.29883, 5.65138149, 719.611877);
							repeat
								topos(v2297);
								wait();
							until ((v2297.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.SecondSea == false)
							wait(1.1);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective");
							wait(0.5);
							EquipWeapon("Key");
							repeat
								topos(CFrame.new(1347.7124, 37.3751602, -1325.6488));
								wait();
							until ((Vector3.new(1347.7124, 37.3751602, -1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.SecondSea == false)
							wait(0.5);
						elseif ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
							if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
								for v2559, v2560 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if (v2560.Name == "Ice Admiral") then
										if ( not v2560.Humanoid.Health <= 0) then
											if (v2560:FindFirstChild("Humanoid") and v2560:FindFirstChild("HumanoidRootPart") and (v2560.Humanoid.Health > 0)) then
												OldCFrameSecond = v2560.HumanoidRootPart.CFrame;
												repeat
													task.wait();
													AutoHaki();
													EquipWeapon(_G.SelectWeapon);
													v2560.HumanoidRootPart.CanCollide = false;
													v2560.Humanoid.WalkSpeed = 0;
													v2560.Head.CanCollide = false;
													v2560.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
													v2560.HumanoidRootPart.CFrame = OldCFrameSecond;
													topos(v2560.HumanoidRootPart.CFrame * Pos );
													sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
												until  not _G.SecondSea or  not v2560.Parent or (v2560.Humanoid.Health <= 0)
											end
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
										end
									end
								end
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7) );
							end
						end
					end
				end);
			end
		end
	end);
end
if World2 then
	v60:Toggle("Tự Động Qua Biển 3", _G.ThirdSea, function(v1382)
		_G.ThirdSea = v1382;
		StopTween(_G.ThirdSea);
	end);
	spawn(function()
		while wait() do
			if _G.ThirdSea then
				pcall(function()
					if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500) and World2) then
						_G.Level = false;
						if (game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("ZQuestProgress", "General") == 0) then
							topos(CFrame.new( -1926.3221435547, 12.819851875305, 1738.3092041016));
							if ((CFrame.new( -1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
								wait(1.5);
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin");
							end
							wait(1.8);
							if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
								for v2438, v2439 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if (v2439.Name == "rip_indra") then
										OldCFrameThird = v2439.HumanoidRootPart.CFrame;
										repeat
											task.wait();
											AutoHaki();
											EquipWeapon(_G.SelectWeapon);
											topos(v2439.HumanoidRootPart.CFrame * Pos );
											v2439.HumanoidRootPart.CFrame = OldCFrameThird;
											v2439.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											v2439.HumanoidRootPart.CanCollide = false;
											v2439.Humanoid.WalkSpeed = 0;
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
											sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
										until (_G.ThirdSea == false) or (v2439.Humanoid.Health <= 0) or  not v2439.Parent
									end
								end
							elseif ( not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and ((CFrame.new( -26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000)) then
								topos(CFrame.new( -26880.93359375, 22.848554611206, 473.18951416016));
							end
						end
					end
				end);
			end
		end
	end);
end
if World2 then
	v60:Toggle("Đánh Nhà Máy", _G.Factory, function(v1383)
		_G.Factory = v1383;
		StopTween(_G.Factory);
	end);
	spawn(function()
		while wait() do
			pcall(function()
				if _G.Factory then
					if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
						for v2131, v2132 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if ((v2132.Name == "Core") and (v2132.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									topos(CFrame.new(448.46756, 199.356781, -441.389252));
								until (v2132.Humanoid.Health <= 0) or (_G.Factory == false)
							end
						end
					else
						topos(CFrame.new(448.46756, 199.356781, -441.389252));
					end
				end
			end);
		end
	end);
end
v60:Seperator("Võ");
v60:Toggle("Tự Động Superhuman", _G.Superhuman, function(v388)
	_G.Superhuman = v388;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Superhuman then
				if (game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or (game.Players.LocalPlayer.Character:FindFirstChild("Combat") and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 150000))) then
					UnEquipWeapon("Combat");
					wait(0.1);
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
				end
				if (game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman")) then
					_G.SelectWeapon = "Superhuman";
				end
				if (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")) then
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299)) then
						_G.SelectWeapon = "Black Leg";
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299)) then
						_G.SelectWeapon = "Electro";
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299)) then
						_G.SelectWeapon = "Fishman Karate";
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299)) then
						_G.SelectWeapon = "Dragon Claw";
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 300000)) then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 300000)) then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 750000)) then
						UnEquipWeapon("Electro");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and (game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 750000)) then
						UnEquipWeapon("Electro");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300) and (game:GetService("Players")['Localplayer'].Data.Fragments.Value >= 1500)) then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300) and (game:GetService("Players")['Localplayer'].Data.Fragments.Value >= 1500)) then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end
					if (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 3000000)) then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300) and (game:GetService("Players")['LocalPlayer'].Data.Beli.Value >= 3000000)) then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
					end
				end
			end
		end
	end);
end);
v60:Toggle("Tự Động Chân Đen", _G.DeathStep, function(v389)
	_G.DeathStep = v389;
end);
spawn(function()
	while wait() do
		wait();
		if _G.DeathStep then
			if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step")) then
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450)) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.SelectWeapon = "Death Step";
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450)) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.SelectWeapon = "Death Step";
				end
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449)) then
					_G.SelectWeapon = "Black Leg";
				end
			else
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
			end
		end
	end
end);
v60:Toggle("Tự Động Võ Người Cá", _G.Sharkman, function(v390)
	_G.Sharkman = v390;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Sharkman then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
				if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
					if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")) then
						topos(CFrame.new( -2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365));
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
					elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400)) then
					else
						Ms = "Tide Keeper";
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							for v2440, v2441 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2441.Name == Ms) then
									OldCFrameShark = v2441.HumanoidRootPart.CFrame;
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2441.Head.CanCollide = false;
										v2441.Humanoid.WalkSpeed = 0;
										v2441.HumanoidRootPart.CanCollide = false;
										v2441.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
										v2441.HumanoidRootPart.CFrame = OldCFrameShark;
										topos(v2441.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
										sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
									until  not v2441.Parent or (v2441.Humanoid.Health <= 0) or (_G.Sharkman == false) or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
								end
							end
						else
							topos(CFrame.new( -3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-8, 0.885206044, 4.0332897e-9, 1, 1.3534751e-8, -0.885206044, -2.7260627e-9, 0.465199202));
							wait(3);
						end
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
				end
			end
		end
	end);
end);
v60:Toggle("Tự Động Võ Điện", _G.ElectricClaw, function(v391)
	_G.ElectricClaw = v391;
	StopTween(_G.ElectricClaw);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.ElectricClaw then
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw")) then
					if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400)) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.SelectWeapon = "Electric Claw";
					end
					if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400)) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.SelectWeapon = "Electric Claw";
					end
					if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399)) then
						_G.SelectWeapon = "Electro";
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
				end
			end
			if _G.ElectricClaw then
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro")) then
					if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400)) or (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400)) then
						if (_G.Level == false) then
							repeat
								task.wait();
								topos(CFrame.new( -10371.4717, 330.764496, -10131.4199));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								topos(CFrame.new( -12550.532226563, 336.22631835938, -7510.4233398438));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10)
							wait(1);
							repeat
								task.wait();
								topos(CFrame.new( -10371.4717, 330.764496, -10131.4199));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10)
							wait(1);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
						elseif (_G.Level == true) then
							_G.Level = false;
							wait(1);
							repeat
								task.wait();
								topos(CFrame.new( -10371.4717, 330.764496, -10131.4199));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								topos(CFrame.new( -12550.532226563, 336.22631835938, -7510.4233398438));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <= 10)
							wait(1);
							repeat
								task.wait();
								topos(CFrame.new( -10371.4717, 330.764496, -10131.4199));
							until  not _G.ElectricClaw or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new( -10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10)
							wait(1);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
							_G.SelectWeapon = "Electric Claw";
							wait(0.1);
							_G.Level = true;
						end
					end
				end
			end
		end
	end);
end);
v60:Toggle("Tự Động Võ Rồng", _G.DragonTalon, function(v392)
	_G.DragonTalon = v392;
end);
spawn(function()
	while wait() do
		if _G.DragonTalon then
			if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon")) then
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400)) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.SelectWeapon = "Dragon Talon";
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400)) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.SelectWeapon = "Dragon Talon";
				end
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399)) then
					_G.SelectWeapon = "Dragon Claw";
				end
			else
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
			end
		end
	end
end);
v60:Toggle("Tự Động GodHuman", _G.God_Human, function(v393)
	_G.God_Human = v393;
end);
spawn(function()
	while task.wait() do
		if _G.God_Human then
			pcall(function()
				if (game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman")) then
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1) then
						if ((game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value >= 400)) or (game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and (game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value >= 400))) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
						end
					else
					end
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1) then
						if ((game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step").Level.Value >= 400)) or (game.Players.LocalPlayer.Character:FindFirstChild("Death Step") and (game.Players.LocalPlayer.Character:FindFirstChild("Death Step").Level.Value >= 400))) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
						end
					else
					end
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1) then
						if ((game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate").Level.Value >= 400)) or (game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") and (game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate").Level.Value >= 400))) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
						end
					else
					end
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1) then
						if ((game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw").Level.Value >= 400)) or (game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw").Level.Value >= 400))) then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
						end
					else
					end
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1) then
						if ((game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Talon").Level.Value >= 400)) or (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Talon").Level.Value >= 400))) then
							if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true), "Bring") then
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman");
							end
						end
					else
					end
				else
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
				end
			end);
		end
	end
end);
v60:Seperator("Nguyên Liệu");
if World2 then
	v60:Toggle("Cày Vật Chất Phóng Xạ", false, function(v1384)
		Radioactive = v1384;
		StopTween(Radioactive);
	end);
	local v789 = CFrame.new( -507.7895202636719, 72.99479675292969, -126.45632934570312);
	spawn(function()
		while wait() do
			if (Radioactive and World2) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Factory Staff") then
						for v2133, v2134 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2134.Name == "Factory Staff") then
								if (v2134:FindFirstChild("Humanoid") and v2134:FindFirstChild("HumanoidRootPart") and (v2134.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2134.HumanoidRootPart.CanCollide = false;
										v2134.Humanoid.WalkSpeed = 0;
										v2134.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2134.HumanoidRootPart.CFrame;
										topos(v2134.HumanoidRootPart.CFrame * Pos );
									until  not Radioactive or  not v2134.Parent or (v2134.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v789.Position).Magnitude > 3500) then
								BTP(v789);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v789.Position).Magnitude < 3500) then
								topos(v789);
							end
						else
							topos(v789);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -507.7895202636719, 72.99479675292969, -126.45632934570312));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Factory Staff").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World2 then
	v60:Toggle("Cày Giọt Nước Huyền Bí", false, function(v1385)
		_G.Makori_gay = v1385;
		StopTween(_G.Makori_gay);
	end);
	local v790 = CFrame.new( -3352.9013671875, 285.01556396484375, -10534.841796875);
	spawn(function()
		while wait() do
			if (_G.Makori_gay and World2) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
						for v2135, v2136 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2136.Name == "Water Fighter") then
								if (v2136:FindFirstChild("Humanoid") and v2136:FindFirstChild("HumanoidRootPart") and (v2136.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2136.HumanoidRootPart.CanCollide = false;
										v2136.Humanoid.WalkSpeed = 0;
										v2136.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2136.HumanoidRootPart.CFrame;
										topos(v2136.HumanoidRootPart.CFrame * Pos );
									until  not _G.Makori_gay or  not v2136.Parent or (v2136.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v790.Position).Magnitude > 3500) then
								BTP(v790);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v790.Position).Magnitude < 3500) then
								topos(v790);
							end
						else
							topos(v790);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -3352.9013671875, 285.01556396484375, -10534.841796875));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Water Fighter").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if (World1 or World2) then
	v60:Toggle("Cày Quặng Nham Thạch", _G.Makori_gay, function(v1386)
		_G.Umm = v1386;
		StopTween(_G.Umm);
	end);
	local v791 = CFrame.new( -5850.2802734375, 77.28675079345703, 8848.6748046875);
	spawn(function()
		while wait() do
			if (_G.Umm and World1) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Military Spy") then
						for v2137, v2138 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2138.Name == "Military Spy") then
								if (v2138:FindFirstChild("Humanoid") and v2138:FindFirstChild("HumanoidRootPart") and (v2138.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2138.HumanoidRootPart.CanCollide = false;
										v2138.Humanoid.WalkSpeed = 0;
										v2138.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2138.HumanoidRootPart.CFrame;
										topos(v2138.HumanoidRootPart.CFrame * Pos );
									until  not _G.Umm or  not v2138.Parent or (v2138.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v791.Position).Magnitude > 3500) then
								BTP(v791);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v791.Position).Magnitude < 3500) then
								topos(v791);
							end
						else
							topos(v791);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -5850.2802734375, 77.28675079345703, 8848.6748046875));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Military Spy").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
	local v792 = CFrame.new( -5234.60595703125, 51.953372955322266, -4732.27880859375);
	spawn(function()
		while wait() do
			if (_G.Umm and World2) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
						for v2139, v2140 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2140.Name == "Lava Pirate") then
								if (v2140:FindFirstChild("Humanoid") and v2140:FindFirstChild("HumanoidRootPart") and (v2140.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2140.HumanoidRootPart.CanCollide = false;
										v2140.Humanoid.WalkSpeed = 0;
										v2140.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2140.HumanoidRootPart.CFrame;
										topos(v2140.HumanoidRootPart.CFrame * Pos );
									until  not _G.Umm or  not v2140.Parent or (v2140.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v792.Position).Magnitude > 3500) then
								BTP(v792);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v792.Position).Magnitude < 3500) then
								topos(v792);
							end
						else
							topos(v792);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -5234.60595703125, 51.953372955322266, -4732.27880859375));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World1 then
	v60:Toggle("Cày Đôi cánh thiên thần", _G.Makori_gay, function(v1387)
		_G.Wing = v1387;
		StopTween(_G.Wing);
	end);
	local v793 = CFrame.new( -7827.15625, 5606.912109375, -1705.5833740234375);
	spawn(function()
		while wait() do
			if (_G.Wing and World1) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Royal Soldier") then
						for v2141, v2142 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2142.Name == "Royal Soldier") then
								if (v2142:FindFirstChild("Humanoid") and v2142:FindFirstChild("HumanoidRootPart") and (v2142.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2142.HumanoidRootPart.CanCollide = false;
										v2142.Humanoid.WalkSpeed = 0;
										v2142.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2142.HumanoidRootPart.CFrame;
										topos(v2142.HumanoidRootPart.CFrame * Pos );
									until  not _G.Wing or  not v2142.Parent or (v2142.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v793.Position).Magnitude > 3500) then
								BTP(v793);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v793.Position).Magnitude < 3500) then
								topos(v793);
							end
						else
							topos(v793);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -7827.15625, 5606.912109375, -1705.5833740234375));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Royal Soldier").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if (World1 or World2 or World3) then
	v60:Toggle("Cày Da", _G.Makori_gay, function(v1388)
		_G.Leather = v1388;
		StopTween(_G.Leather);
	end);
	local v794 = CFrame.new( -1211.8792724609375, 4.787090301513672, 3916.83056640625);
	spawn(function()
		while wait() do
			if (_G.Leather and World1) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Pirate") then
						for v2143, v2144 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2144.Name == "Pirate") then
								if (v2144:FindFirstChild("Humanoid") and v2144:FindFirstChild("HumanoidRootPart") and (v2144.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2144.HumanoidRootPart.CanCollide = false;
										v2144.Humanoid.WalkSpeed = 0;
										v2144.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2144.HumanoidRootPart.CFrame;
										topos(v2144.HumanoidRootPart.CFrame * Pos );
									until  not _G.Leather or  not v2144.Parent or (v2144.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v794.Position).Magnitude > 3500) then
								BTP(v794);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v794.Position).Magnitude < 3500) then
								topos(v794);
							end
						else
							topos(v794);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -1211.8792724609375, 4.787090301513672, 3916.83056640625));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
	local v795 = CFrame.new( -2010.5059814453125, 73.00115966796875, -3326.620849609375);
	spawn(function()
		while wait() do
			if (_G.Leather and World2) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Marine Captain") then
						for v2145, v2146 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2146.Name == "Marine Captain") then
								if (v2146:FindFirstChild("Humanoid") and v2146:FindFirstChild("HumanoidRootPart") and (v2146.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2146.HumanoidRootPart.CanCollide = false;
										v2146.Humanoid.WalkSpeed = 0;
										v2146.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2146.HumanoidRootPart.CFrame;
										topos(v2146.HumanoidRootPart.CFrame * Pos );
									until  not _G.Leather or  not v2146.Parent or (v2146.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v795.Position).Magnitude > 3500) then
								BTP(v795);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v795.Position).Magnitude < 3500) then
								topos(v795);
							end
						else
							topos(v795);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -2010.5059814453125, 73.00115966796875, -3326.620849609375));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Marine Captain").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
	local v796 = CFrame.new( -11975.78515625, 331.7734069824219, -10620.0302734375);
	spawn(function()
		while wait() do
			if (_G.Leather and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Jungle Pirate") then
						for v2147, v2148 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2148.Name == "Jungle Pirate") then
								if (v2148:FindFirstChild("Humanoid") and v2148:FindFirstChild("HumanoidRootPart") and (v2148.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2148.HumanoidRootPart.CanCollide = false;
										v2148.Humanoid.WalkSpeed = 0;
										v2148.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2148.HumanoidRootPart.CFrame;
										topos(v2148.HumanoidRootPart.CFrame * Pos );
									until  not _G.Leather or  not v2148.Parent or (v2148.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v796.Position).Magnitude > 3500) then
								BTP(v796);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v796.Position).Magnitude < 3500) then
								topos(v796);
							end
						else
							topos(v796);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -11975.78515625, 331.7734069824219, -10620.0302734375));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Jungle Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if (World1 or world2 or World3) then
	v60:Toggle("Cày Kim loại phế liệu", false, function(v1389)
		Scrap = v1389;
		StopTween(Scrap);
	end);
	local v797 = CFrame.new( -1132.4202880859375, 14.844913482666016, 4293.30517578125);
	spawn(function()
		while wait() do
			if (Scrap and World1) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Brute") then
						for v2149, v2150 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2150.Name == "Brute") then
								if (v2150:FindFirstChild("Humanoid") and v2150:FindFirstChild("HumanoidRootPart") and (v2150.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2150.HumanoidRootPart.CanCollide = false;
										v2150.Humanoid.WalkSpeed = 0;
										v2150.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2150.HumanoidRootPart.CFrame;
										topos(v2150.HumanoidRootPart.CFrame * Pos );
									until  not Scrap or  not v2150.Parent or (v2150.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v797.Position).Magnitude > 3500) then
								BTP(v797);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v797.Position).Magnitude < 3500) then
								topos(v797);
							end
						else
							topos(v797);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -1132.4202880859375, 14.844913482666016, 4293.30517578125));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Brute") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Brute").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
	local v798 = CFrame.new( -972.307373046875, 73.04473876953125, 1419.2901611328125);
	spawn(function()
		while wait() do
			if (Scrap and World2) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Mercenary") then
						for v2151, v2152 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2152.Name == "Mercenary") then
								if (v2152:FindFirstChild("Humanoid") and v2152:FindFirstChild("HumanoidRootPart") and (v2152.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2152.HumanoidRootPart.CanCollide = false;
										v2152.Humanoid.WalkSpeed = 0;
										v2152.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2152.HumanoidRootPart.CFrame;
										topos(v2152.HumanoidRootPart.CFrame * Pos );
									until  not Scrap or  not v2152.Parent or (v2152.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v798.Position).Magnitude > 3500) then
								BTP(v798);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v798.Position).Magnitude < 3500) then
								topos(v798);
							end
						else
							topos(v798);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -972.307373046875, 73.04473876953125, 1419.2901611328125));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mercenary").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
	local v799 = CFrame.new( -289.6311950683594, 43.8282470703125, 5583.66357421875);
	spawn(function()
		while wait() do
			if (Scrap and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Pirate Millionaire") then
						for v2153, v2154 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2154.Name == "Pirate Millionaire") then
								if (v2154:FindFirstChild("Humanoid") and v2154:FindFirstChild("HumanoidRootPart") and (v2154.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2154.HumanoidRootPart.CanCollide = false;
										v2154.Humanoid.WalkSpeed = 0;
										v2154.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2154.HumanoidRootPart.CFrame;
										topos(v2154.HumanoidRootPart.CFrame * Pos );
									until  not Scrap or  not v2154.Parent or (v2154.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v799.Position).Magnitude > 3500) then
								BTP(v799);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v799.Position).Magnitude < 3500) then
								topos(v799);
							end
						else
							topos(v799);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -289.6311950683594, 43.8282470703125, 5583.66357421875));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pirate Millionaire").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World3 then
	v60:Toggle("Cày Bột Ca cao", false, function(v1390)
		Cocoafarm = v1390;
		StopTween(Cocoafarm);
	end);
	local v800 = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375);
	spawn(function()
		while wait() do
			if (Cocoafarm and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") then
						for v2155, v2156 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2156.Name == "Chocolate Bar Battler") then
								if (v2156:FindFirstChild("Humanoid") and v2156:FindFirstChild("HumanoidRootPart") and (v2156.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2156.HumanoidRootPart.CanCollide = false;
										v2156.Humanoid.WalkSpeed = 0;
										v2156.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2156.HumanoidRootPart.CFrame;
										topos(v2156.HumanoidRootPart.CFrame * Pos );
									until  not Cocoafarm or  not v2156.Parent or (v2156.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v800.Position).Magnitude > 3500) then
								BTP(v800);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v800.Position).Magnitude < 3500) then
								topos(v800);
							end
						else
							topos(v800);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chocolate Bar Battler").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World3 then
	v60:Toggle("Cày Vảy Rồng", false, function(v1391)
		Dragon_Scale = v1391;
		StopTween(Dragon_Scale);
	end);
	local v801 = CFrame.new(6752, 565, 315);
	spawn(function()
		while wait() do
			if (Dragon_Scale and World3) then
				pcall(function()
					if (game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior")) then
						for v2157, v2158 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if ((v2158.Name == "Dragon Crew Archer") or (v2158.Name == "Dragon Crew Warrior")) then
								if (v2158:FindFirstChild("Humanoid") and v2158:FindFirstChild("HumanoidRootPart") and (v2158.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2158.HumanoidRootPart.CanCollide = false;
										v2158.Humanoid.WalkSpeed = 0;
										v2158.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2158.HumanoidRootPart.CFrame;
										topos(v2158.HumanoidRootPart.CFrame * Pos );
									until  not Dragon_Scale or  not v2158.Parent or (v2158.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v801.Position).Magnitude > 3500) then
								BTP(v801);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v801.Position).Magnitude < 3500) then
								topos(v801);
							end
						else
							topos(v801);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new(6752, 565, 315));
						if (game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer") or game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior")) then
							if game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Archer").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior") then
								topos(game:GetService("ReplicatedStorage"):FindFirstChild("Dragon Crew Warrior").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
							end
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World3 then
	v60:Toggle("Cày Thuốc Súng", false, function(v1392)
		Gunpowder = v1392;
		StopTween(Gunpowder);
	end);
	local v802 = CFrame.new( -379.6134338378906, 73.84449768066406, 5928.5263671875);
	spawn(function()
		while wait() do
			if (Gunpowder and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Pistol Billionaire") then
						for v2159, v2160 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2160.Name == "Pistol Billionaire") then
								if (v2160:FindFirstChild("Humanoid") and v2160:FindFirstChild("HumanoidRootPart") and (v2160.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2160.HumanoidRootPart.CanCollide = false;
										v2160.Humanoid.WalkSpeed = 0;
										v2160.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2160.HumanoidRootPart.CFrame;
										topos(v2160.HumanoidRootPart.CFrame * Pos );
									until  not Gunpowder or  not v2160.Parent or (v2160.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v802.Position).Magnitude > 3500) then
								BTP(v802);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v802.Position).Magnitude < 3500) then
								topos(v802);
							end
						else
							topos(v802);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -379.6134338378906, 73.84449768066406, 5928.5263671875));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Pistol Billionaire").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World3 then
	v60:Toggle("Cày Đuôi Cá", false, function(v1393)
		Fish = v1393;
		StopTween(Fish);
	end);
	local v803 = CFrame.new( -10961.0126953125, 331.7977600097656, -8914.29296875);
	spawn(function()
		while wait() do
			if (Fish and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Captain") then
						for v2161, v2162 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2162.Name == "Fishman Captain") then
								if (v2162:FindFirstChild("Humanoid") and v2162:FindFirstChild("HumanoidRootPart") and (v2162.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2162.HumanoidRootPart.CanCollide = false;
										v2162.Humanoid.WalkSpeed = 0;
										v2162.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2162.HumanoidRootPart.CFrame;
										topos(v2162.HumanoidRootPart.CFrame * Pos );
									until  not Fish or  not v2162.Parent or (v2162.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v803.Position).Magnitude > 3500) then
								BTP(v803);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v803.Position).Magnitude < 3500) then
								topos(v803);
							end
						else
							topos(v803);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -10961.0126953125, 331.7977600097656, -8914.29296875));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fishman Captain").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
if World3 then
	v60:Toggle("Cày Sừng Tê Giác", false, function(v1394)
		MiniHee = v1394;
		StopTween(MiniHee);
	end);
	local v804 = CFrame.new( -13516.0458984375, 469.8182373046875, -6899.16064453125);
	spawn(function()
		while wait() do
			if (MiniHee and World3) then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
						for v2163, v2164 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2164.Name == "Mythological Pirate") then
								if (v2164:FindFirstChild("Humanoid") and v2164:FindFirstChild("HumanoidRootPart") and (v2164.Humanoid.Health > 0)) then
									repeat
										task.wait();
										AutoHaki();
										EquipWeapon(_G.SelectWeapon);
										v2164.HumanoidRootPart.CanCollide = false;
										v2164.Humanoid.WalkSpeed = 0;
										v2164.Head.CanCollide = false;
										MakoriGayMag = true;
										PosGay = v2164.HumanoidRootPart.CFrame;
										topos(v2164.HumanoidRootPart.CFrame * Pos );
									until  not MiniHee or  not v2164.Parent or (v2164.Humanoid.Health <= 0)
									MakoriGayMag = false;
								end
							end
						end
					else
						if BypassTP then
							if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v804.Position).Magnitude > 3500) then
								BTP(v804);
							elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v804.Position).Magnitude < 3500) then
								topos(v804);
							end
						else
							topos(v804);
						end
						UnEquipWeapon(_G.SelectWeapon);
						topos(CFrame.new( -13516.0458984375, 469.8182373046875, -6899.16064453125));
						if game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate") then
							topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mythological Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
						elseif _G.StardHop then
							Hop();
						end
					end
				end);
			end
		end
	end);
end
v60:Seperator("nâng cao");
v60:Toggle("Tự động đột kích Phoenix", _G.AdvanceDungeon, function(v394)
	_G.AdvanceDungeon = v394;
	StopTween(_G.AdvanceDungeon);
end);
spawn(function()
	while wait() do
		if _G.AdvanceDungeon then
			pcall(function()
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix")) then
					if game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
						if (game.Players.LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400) then
							topos(CFrame.new( -2812.76708984375, 254.803466796875, -12595.560546875));
							if ((CFrame.new( -2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
								wait(1.5);
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Check");
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Heal");
							end
						end
					elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
						if (game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400) then
							topos(CFrame.new( -2812.76708984375, 254.803466796875, -12595.560546875));
							if ((CFrame.new( -2812.76708984375, 254.803466796875, -12595.560546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
								wait(1.5);
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Check");
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist", "Heal");
							end
						end
					end
				end
			end);
		end
	end
end);
v60:Label("Biển 1");
v60:Seperator("Saw");
v60:Toggle("Đánh Sharks saw", _G.doughking, function(v395)
	_G.saw = v395;
	StopTween(_G.saw);
end);
v60:Toggle("Đánh Shark Saw Đổi Sever", _G.doughkingHop, function(v396)
	_G.sawhop = v396;
end);
local v87 = CFrame.new( -690.33081054688, 15.09425163269, 1582.2380371094);
spawn(function()
	while wait() do
		if (_G.saw and World1) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
					for v1876, v1877 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1877.Name == "The Saw") then
							if (v1877:FindFirstChild("Humanoid") and v1877:FindFirstChild("HumanoidRootPart") and (v1877.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1877.HumanoidRootPart.CanCollide = false;
									v1877.Humanoid.WalkSpeed = 0;
									v1877.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1877.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.saw or  not v1877.Parent or (v1877.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v87.Position).Magnitude > 3500) then
							BTP(v87);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v87.Position).Magnitude < 3500) then
							topos(v87);
						end
					else
						topos(v87);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -690.33081054688, 15.09425163269, 1582.2380371094));
					if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 40, 2) );
					elseif _G.sawhop then
						Hop();
					end
				end
			end);
		end
	end
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if (_G.FarmSwanGlasses and _G.FarmSwanGlasses_Hop and World2 and  not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and  not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]")) then
				Hop();
			end
		end
	end);
end);
v60:Seperator("Thanh kiếm Waden");
v60:Toggle("Lấy kiếm Waden", _G.waden, function(v397)
	_G.waden = v397;
	StopTween(_G.waden);
end);
v60:Toggle("kiếm Waden Đổi Sever", _G.wadenhop, function(v398)
	_G.wadenhop = v398;
end);
local v88 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562);
spawn(function()
	while wait() do
		if (_G.waden and World1) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
					for v1878, v1879 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1879.Name == "Chief Warden") then
							if (v1879:FindFirstChild("Humanoid") and v1879:FindFirstChild("HumanoidRootPart") and (v1879.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1879.HumanoidRootPart.CanCollide = false;
									v1879.Humanoid.WalkSpeed = 0;
									v1879.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1879.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.waden or  not v1879.Parent or (v1879.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 3500) then
							BTP(TridentPos);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 3500) then
							topos(TridentPos);
						end
					else
						topos(TridentPos);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.wadenhop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Seperator("Râu Xám");
v60:Toggle("Đánh Râu Xám", _G.doughking, function(v399)
	_G.gay = v399;
	StopTween(_G.gay);
end);
v60:Toggle("Đánh Râu Xám Đổi Sever", _G.doughkingHop, function(v400)
	_G.gayhop = v400;
end);
local v89 = CFrame.new( -5023.38330078125, 28.65203285217285, 4332.3818359375);
spawn(function()
	while wait() do
		if (_G.gay and World1) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Greybeard") then
					for v1880, v1881 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1881.Name == "Greybeard") then
							if (v1881:FindFirstChild("Humanoid") and v1881:FindFirstChild("HumanoidRootPart") and (v1881.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1881.HumanoidRootPart.CanCollide = false;
									v1881.Humanoid.WalkSpeed = 0;
									v1881.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1881.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.gay or  not v1881.Parent or (v1881.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v89.Position).Magnitude > 3500) then
							BTP(v89);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v89.Position).Magnitude < 3500) then
							topos(v89);
						end
					else
						topos(v89);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -5023.38330078125, 28.65203285217285, 4332.3818359375));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.gayhop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Seperator("Saber");
v60:Toggle("Tự Động Lấy Saber", _G.Saber, function(v401)
	_G.Saber = v401;
	StopTween(_G.Saber);
end);
v60:Toggle("Saber Đổi Sever", _G.SaberHop, function(v402)
	_G.SaberHop = v402;
end);
spawn(function()
	while task.wait() do
		if (_G.Saber and (game.Players.LocalPlayer.Data.Level.Value >= 200)) then
			pcall(function()
				if (game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0) then
					if (game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0) then
						if ((CFrame.new( -1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, -0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, -4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100) then
							topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame;
							wait(1);
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame;
							wait(1);
						else
							topos(CFrame.new( -1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, -0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, -4.398698e-8, 0.37091279));
						end
					elseif (game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0) then
						if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch")) then
							EquipWeapon("Torch");
							topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.2879909e-9, 0.761243105, -5.706529e-10, 1, 1.2058454e-9, -0.761243105, 3.4754488e-10, -0.648466587));
						else
							topos(CFrame.new( -1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, -0.258850515, 0.965917408));
						end
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup");
						wait(0.5);
						EquipWeapon("Cup");
						wait(0.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup);
						wait(0);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan");
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0) then
						if (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader")) then
							topos(CFrame.new( -2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559));
							for v2648, v2649 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2649.Name == "Mob Leader") then
									if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
										if (v2649:FindFirstChild("Humanoid") and v2649:FindFirstChild("HumanoidRootPart") and (v2649.Humanoid.Health > 0)) then
											repeat
												task.wait();
												AutoHaki();
												EquipWeapon(_G.SelectWeapon);
												v2649.HumanoidRootPart.CanCollide = false;
												v2649.Humanoid.WalkSpeed = 0;
												v2649.HumanoidRootPart.Size = Vector3.new(80, 80, 80);
												topos(v2649.HumanoidRootPart.CFrame * Pos );
												sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
											until (v2649.Humanoid.Health <= 0) or  not _G.Saber
										end
									end
									if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
										topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode );
									end
								end
							end
						end
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
						wait(0.5);
						EquipWeapon("Relic");
						wait(0.5);
						topos(CFrame.new( -1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, -5.799956e-8, -0.481375456, 6.3057264e-8, 0.876514494));
					end
				elseif (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert")) then
					for v2165, v2166 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v2166:FindFirstChild("Humanoid") and v2166:FindFirstChild("HumanoidRootPart") and (v2166.Humanoid.Health > 0)) then
							if (v2166.Name == "Saber Expert") then
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2166.HumanoidRootPart.CFrame * Pos );
									v2166.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
									v2166.HumanoidRootPart.Transparency = 1;
									v2166.Humanoid.JumpPower = 0;
									v2166.Humanoid.WalkSpeed = 0;
									v2166.HumanoidRootPart.CanCollide = false;
									FarmPos = v2166.HumanoidRootPart.CFrame;
									MonFarm = v2166.Name;
								until (v2166.Humanoid.Health <= 0) or  not _G.Saber
								if (v2166.Humanoid.Health <= 0) then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic");
								end
							end
						end
					end
				end
			end);
		end
	end
end);
v60:Seperator("Lôi Thể");
v60:Toggle("Lấy Gậy Lôi Thể v1", _G.doughking, function(v403)
	_G.pole = v403;
	StopTween(_G.pole);
end);
v60:Toggle("Gậy Lôi Thể Đổi Sever", _G.doughkingHop, function(v404)
	_G.polehop = v404;
end);
local v90 = CFrame.new( -7748.0185546875, 5606.80615234375, -2305.898681640625);
spawn(function()
	while wait() do
		if (_G.pole and World1) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
					for v1882, v1883 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1883.Name == "Thunder God") then
							if (v1883:FindFirstChild("Humanoid") and v1883:FindFirstChild("HumanoidRootPart") and (v1883.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1883.HumanoidRootPart.CanCollide = false;
									v1883.Humanoid.WalkSpeed = 0;
									v1883.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1883.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.pole or  not v1883.Parent or (v1883.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v90.Position).Magnitude > 3500) then
							BTP(v90);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v90.Position).Magnitude < 3500) then
							topos(v90);
						end
					else
						topos(TridentPos);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -7748.0185546875, 5606.80615234375, -2305.898681640625));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.polehop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Label("Biển 2");
v60:Seperator("Kiếm Huyền Thoại");
v60:Toggle("Mua Kiếm Huyền Thoại", _G.BuyLegendarySword, function(v405)
	_G.BuyLegendarySword = v405;
end);
spawn(function()
	while wait() do
		if _G.BuyLegendarySword then
			pcall(function()
				local v1604 = {
					[1] = "LegendarySwordDealer",
					[2] = "1"
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1604));
				local v1604 = {
					[1] = "LegendarySwordDealer",
					[2] = "2"
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1604));
				local v1604 = {
					[1] = "LegendarySwordDealer",
					[2] = "3"
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1604));
				if (_G.BuyLegendarySword_Hop and _G.BuyLegendarySword and World2) then
					wait(10);
					Hop();
				end
			end);
		end
	end
end);
v60:Toggle("Kiếm Huyền Thoại Đổi Sever", _G.BuyLegendarySword_Hop, function(v406)
	_G.BuyLegendarySword_Hop = v406;
end);
v60:Seperator("Haki Màu");
local v91 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1");
v60:Toggle("Mua Haki Màu", _G.BuyEnchancementColour, function(v407)
	_G.BuyEnchancementColour = v407;
end);
v60:Toggle("Haki Màu Đổi Sever", _G.BuyEnchancementColour_Hop, function(v408)
	_G.BuyEnchancementColour_Hop = v408;
end);
spawn(function()
	while wait() do
		if _G.BuyEnchancementColour then
			local v1516 = {
				[1] = "ColorsDealer",
				[2] = "2"
			};
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1516));
			if (_G.BuyEnchancementColour_Hop and _G.BuyEnchancementColour and  not World1) then
				wait(10);
				Hop();
			end
		end
	end
end);
v60:Seperator("Bartlio");
v60:Toggle("Làm Nhiệm Vụ Bartlio", _G.Bartilo, function(v409)
	_G.Bartilo = v409;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.Bartilo then
				if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0)) then
					if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
						if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
							Ms = "Swan Pirate";
							for v2328, v2329 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2329.Name == Ms) then
									pcall(function()
										repeat
											task.wait();
											sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											v2329.HumanoidRootPart.Transparency = 1;
											v2329.HumanoidRootPart.CanCollide = false;
											v2329.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											topos(v2329.HumanoidRootPart.CFrame * Pos );
											PosMonBarto = v2329.HumanoidRootPart.CFrame;
											AutoBartiloBring = true;
										until  not v2329.Parent or (v2329.Humanoid.Health <= 0) or (_G.Bartilo == false) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
										AutoBartiloBring = false;
									end);
								end
							end
						else
							repeat
								topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.5513712e-8, -0.230443969, 2.6702471e-8, 1, 8.474911e-8, 0.230443969, 7.631471e-8, -0.973085582));
								wait();
							until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.5513712e-8, -0.230443969, 2.6702471e-8, 1, 8.474911e-8, 0.230443969, 7.631471e-8, -0.973085582)).Magnitude <= 10)
						end
					else
						repeat
							topos(CFrame.new( -456.28952, 73.0200958, 299.895966));
							wait();
						until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -456.28952, 73.0200958, 299.895966)).Magnitude <= 10)
						wait(1.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1);
					end
				elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1)) then
					if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
						Ms = "Jeremy";
						for v2330, v2331 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2331.Name == Ms) then
								OldCFrameBartlio = v2331.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
									EquipWeapon(_G.SelectWeapon);
									AutoHaki();
									v2331.HumanoidRootPart.Transparency = 1;
									v2331.HumanoidRootPart.CanCollide = false;
									v2331.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									v2331.HumanoidRootPart.CFrame = OldCFrameBartlio;
									topos(v2331.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until  not v2331.Parent or (v2331.Humanoid.Health <= 0) or (_G.Bartilo == false)
							end
						end
					elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
						repeat
							topos(CFrame.new( -456.28952, 73.0200958, 299.895966));
							wait();
						until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -456.28952, 73.0200958, 299.895966)).Magnitude <= 10)
						wait(1.1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo");
						wait(1);
						repeat
							topos(CFrame.new(2099.88159, 448.931, 648.997375));
							wait();
						until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10)
						wait(2);
					else
						repeat
							topos(CFrame.new(2099.88159, 448.931, 648.997375));
							wait();
						until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10)
					end
				elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2)) then
					repeat
						topos(CFrame.new( -1850.49329, 13.1789551, 1750.89685));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1858.87305, 19.3777466, 1712.01807));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1803.94324, 16.5789185, 1750.89685));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1858.55835, 16.8604317, 1724.79541));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1869.54224, 15.987854, 1681.00659));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1869.54224, 15.987854, 1681.00659)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1800.0979, 16.4978027, 1684.52368));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1819.26343, 14.795166, 1717.90625));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1819.26343, 14.795166, 1717.90625)).Magnitude <= 10)
					wait(1);
					repeat
						topos(CFrame.new( -1813.51843, 14.8604736, 1724.79541));
						wait();
					until  not _G.Bartilo or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10)
				end
			end
		end
	end);
end);
v60:Seperator("Kính Thiên Nga");
v60:Toggle("Lấy Kính Thiên Nga", _G.FarmSwanGlasses, function(v410)
	_G.FarmSwanGlasses = v410;
	StopTween(_G.FarmSwanGlasses);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.FarmSwanGlasses then
				if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
					for v1884, v1885 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if ((v1885.Name == "Don Swan") and (v1885.Humanoid.Health > 0) and v1885:IsA("Model") and v1885:FindFirstChild("Humanoid") and v1885:FindFirstChild("HumanoidRootPart")) then
							repeat
								task.wait();
								pcall(function()
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1885.HumanoidRootPart.CanCollide = false;
									v1885.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1885.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								end);
							until (_G.FarmSwanGlasses == false) or (v1885.Humanoid.Health <= 0)
						end
					end
				else
					repeat
						task.wait();
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625));
					until ((CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) or (_G.FarmSwanGlasses == false)
				end
			end
		end
	end);
end);
v60:Toggle("Kính Thiên Nga Đổi Sever", _G.FarmSwanGlasses_Hop, function(v411)
	_G.FarmSwanGlasses_Hop = v411;
end);
v60:Toggle("Tự Động Nâng Tộc V2", _G.EvoRace, function(v412)
	_G.EvoRace = v412;
	StopTween(_G.EvoRace);
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.EvoRace then
				if  not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
					if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0) then
						topos(CFrame.new( -2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.390141e-8, -0.68292886, 3.5996322e-8, 1, 5.5066703e-8, 0.68292886, 1.5642467e-8, -0.730484903));
						if ((Vector3.new( -2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
							wait(1.3);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2");
						end
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1) then
						pcall(function()
							if ( not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and  not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
								topos(game:GetService("Workspace").Flower1.CFrame);
							elseif ( not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and  not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
								topos(game:GetService("Workspace").Flower2.CFrame);
							elseif ( not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and  not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
								if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
									for v2664, v2665 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if (v2665.Name == "Zombie") then
											repeat
												task.wait();
												AutoHaki();
												EquipWeapon(_G.SelectWeapon);
												topos(v2665.HumanoidRootPart.CFrame * Pos );
												v2665.HumanoidRootPart.CanCollide = false;
												v2665.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
												PosMonEvo = v2665.HumanoidRootPart.CFrame;
												StartEvoMagnet = true;
											until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or  not v2665.Parent or (v2665.Humanoid.Health <= 0) or (_G.EvoRace == false)
											StartEvoMagnet = false;
										end
									end
								else
									StartEvoMagnet = false;
									topos(CFrame.new( -5685.9233398438, 48.480125427246, -853.23724365234));
								end
							end
						end);
					elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3");
					end
				end
			end
		end
	end);
end);
v60:Seperator("Vật Chất Kì Dị");
v60:Toggle("Cày Vật Chất Kì Dị", _G.Ectoplasm, function(v413)
	_G.Ectoplasm = v413;
	StopTween(_G.Ectoplasm);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Ectoplasm then
				if (game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer")) then
					for v1886, v1887 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if ((v1887.Name == "Ship Deckhand") or (v1887.Name == "Ship Engineer") or (v1887.Name == "Ship Steward") or (v1887.Name == "Ship Officer")) then
							repeat
								task.wait();
								EquipWeapon(_G.SelectWeapon);
								AutoHaki();
								if string.find(v1887.Name, "Ship") then
									v1887.HumanoidRootPart.CanCollide = false;
									v1887.Head.CanCollide = false;
									v1887.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1887.HumanoidRootPart.CFrame * Pos );
									EctoplasmMon = v1887.HumanoidRootPart.CFrame;
									StartEctoplasmMagnet = true;
								else
									StartEctoplasmMagnet = false;
									topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625));
								end
							until (_G.Ectoplasm == false) or  not v1887.Parent or (v1887.Humanoid.Health <= 0)
						end
					end
				else
					topos(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					StartEctoplasmMagnet = false;
					local v1701 = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
					if (v1701 > 18000) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
					end
					topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625));
				end
			end
		end
	end);
end);
v60:Seperator("Rengoku");
v60:Toggle("Lấy Rengoku", _G.Rengoku, function(v414)
	_G.Rengoku = v414;
	StopTween(_G.Rengoku);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Rengoku then
				if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key")) then
					EquipWeapon("Hidden Key");
					topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875));
				elseif (game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior")) then
					for v2167, v2168 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (((v2168.Name == "Snow Lurker") or (v2168.Name == "Arctic Warrior")) and (v2168.Humanoid.Health > 0)) then
							repeat
								task.wait();
								EquipWeapon(_G.SelectWeapon);
								AutoHaki();
								v2168.HumanoidRootPart.CanCollide = false;
								v2168.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								RengokuMon = v2168.HumanoidRootPart.CFrame;
								topos(v2168.HumanoidRootPart.CFrame * Pos );
								StartRengokuMagnet = true;
							until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (_G.Rengoku == false) or  not v2168.Parent or (v2168.Humanoid.Health <= 0)
							StartRengokuMagnet = false;
						end
					end
				else
					StartRengokuMagnet = false;
					topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188));
				end
			end
		end
	end);
end);
v60:Seperator("Trident");
v60:Toggle("Lấy Dragon Trident", _G.Dragon_Trident, function(v415)
	_G.Dragon_Trident = v415;
	StopTween(_G.Dragon_Trident);
end);
v60:Toggle("Lấy Dragon Trident Đổi Sever", _G.Dragon_Trident_Hop, function(v416)
	_G.Dragon_Trident_Hop = v416;
end);
local v92 = CFrame.new( -3914.830322265625, 123.29389190673828, -11516.8642578125);
spawn(function()
	while wait() do
		if (_G.Dragon_Trident and World2) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
					for v1888, v1889 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1889.Name == "Tide Keeper") then
							if (v1889:FindFirstChild("Humanoid") and v1889:FindFirstChild("HumanoidRootPart") and (v1889.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1889.HumanoidRootPart.CanCollide = false;
									v1889.Humanoid.WalkSpeed = 0;
									v1889.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.Dragon_Trident or  not v1889.Parent or (v1889.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v92.Position).Magnitude > 3500) then
							BTP(v92);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v92.Position).Magnitude < 3500) then
							topos(v92);
						end
					else
						topos(v92);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -3914.830322265625, 123.29389190673828, -11516.8642578125));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.Dragon_Trident_Hop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Label("Biển 3");
v60:Seperator("Rip Indra");
v60:Toggle("Đánh Rip_Indra True", _G.DarkDagger, function(v417)
	_G.DarkDagger = v417;
	StopTween(_G.DarkDagger);
end);
local v93 = CFrame.new( -5344.822265625, 423.98541259766, -2725.0930175781);
spawn(function()
	pcall(function()
		while wait() do
			if _G.DarkDagger then
				if (game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) then
					for v1890, v1891 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if ((v1891.Name == ("rip_indra True Form" or (v1891.Name == "rip_indra"))) and (v1891.Humanoid.Health > 0) and v1891:IsA("Model") and v1891:FindFirstChild("Humanoid") and v1891:FindFirstChild("HumanoidRootPart")) then
							repeat
								task.wait();
								pcall(function()
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1891.HumanoidRootPart.CanCollide = false;
									v1891.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1891.HumanoidRootPart.CFrame * Pos );
								end);
							until (_G.DarkDagger == false) or (v1891.Humanoid.Health <= 0)
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v93.Position).Magnitude > 3500) then
							BTP(v93);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v93.Position).Magnitude < 3500) then
							topos(v93);
						end
					else
						topos(v93);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -5344.822265625, 423.98541259766, -2725.0930175781));
				end
			end
		end
	end);
end);
v60:Toggle("Rip_Indra True Đổi Sever", _G.DarkDagger_Hop, function(v418)
	_G.DarkDagger_Hop = v418;
end);
spawn(function()
	pcall(function()
		while wait() do
			if (_G.DarkDagger_Hop and _G.DarkDagger and World3 and  not game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") and  not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")) then
				Hop();
			end
		end
	end);
end);
v60:Toggle("Tự động nhấn nút Haki", _G.Ob_Color, function(v419)
	Open_Color_Haki = v419;
	StopTween(Open_Color_Haki);
end);
spawn(function()
	while wait(0.3) do
		pcall(function()
			if Open_Color_Haki then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky");
				wait(0.5);
				repeat
					topos(CFrame.new( -5420.16602, 1084.9657, -2666.8208));
					wait();
				until (_G.StopTween == true) or (Open_Color_Haki == false) or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10)
				wait(0.5);
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red");
				wait(0.5);
				repeat
					topos(CFrame.new( -5414.41357, 309.865753, -2212.45776));
					wait();
				until (_G.StopTween == true) or (Open_Color_Haki == false) or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -5414.41357, 309.865753, -2212.45776)).Magnitude <= 10)
				wait(0.5);
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White");
				wait(0.5);
				repeat
					topos(CFrame.new( -4971.47559, 331.565765, -3720.02954));
					wait();
				until (_G.StopTween == true) or (Open_Color_Haki == false) or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -4971.47559, 331.565765, -3720.02954)).Magnitude <= 10)
				wait(0.5);
				game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600));
				wait(3);
				game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 600));
			end
		end);
	end
end);
function EquipAllWeapon()
	pcall(function()
		for v1395, v1396 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if (v1396:IsA("Tool") and  not ((v1396.Name == "Summon Sea Beast") or (v1396.Name == "Water Body") or (v1396.Name == "Awakening"))) then
				local v1605 = game.Players.LocalPlayer.Backpack:FindFirstChild(v1396.Name);
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1605);
				wait(1);
			end
		end
	end);
end
v60:Seperator("Yama");
v60:Toggle("Lấy Yama", _G.Yama, function(v420)
	_G.Yama = v420;
	StopTween(_G.Yama);
end);
spawn(function()
	while wait() do
		if _G.Yama then
			if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30) then
				repeat
					wait(0.1);
					fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector);
				until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or  not _G.Yama
			end
		end
	end
end);
v60:Seperator("Musketeer");
v60:Toggle("Lấy Musketeer Hat", _G.MusketeerHat, function(v421)
	_G.MusketeerHat = v421;
	StopTween(_G.MusketeerHat);
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.MusketeerHat then
				if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false)) then
					if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
						if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
							for v2336, v2337 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2337.Name == "Forest Pirate") then
									repeat
										task.wait();
										pcall(function()
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											v2337.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											topos(v2337.HumanoidRootPart.CFrame * Pos );
											v2337.HumanoidRootPart.CanCollide = false;
											MusketeerHatMon = v2337.HumanoidRootPart.CFrame;
											StartMagnetMusketeerhat = true;
										end);
									until (_G.MusketeerHat == false) or  not v2337.Parent or (v2337.Humanoid.Health <= 0) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
									StartMagnetMusketeerhat = false;
								end
							end
						else
							StartMagnetMusketeerhat = false;
							topos(CFrame.new( -13206.452148438, 425.89199829102, -7964.5537109375));
						end
					else
						topos(CFrame.new( -12443.8671875, 332.40396118164, -7675.4892578125));
						if ((Vector3.new( -12443.8671875, 332.40396118164, -7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
							wait(1.5);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1);
						end
					end
				elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false)) then
					if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
						if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
							for v2443, v2444 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if (v2444.Name == "Captain Elephant") then
									OldCFrameElephant = v2444.HumanoidRootPart.CFrame;
									repeat
										task.wait();
										pcall(function()
											EquipWeapon(_G.SelectWeapon);
											AutoHaki();
											v2444.HumanoidRootPart.CanCollide = false;
											v2444.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
											topos(v2444.HumanoidRootPart.CFrame * Pos );
											v2444.HumanoidRootPart.CanCollide = false;
											v2444.HumanoidRootPart.CFrame = OldCFrameElephant;
											sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
										end);
									until (_G.MusketeerHat == false) or (v2444.Humanoid.Health <= 0) or  not v2444.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
								end
							end
						else
							topos(CFrame.new( -13374.889648438, 421.27752685547, -8225.208984375));
						end
					else
						topos(CFrame.new( -12443.8671875, 332.40396118164, -7675.4892578125));
						if ((CFrame.new( -12443.8671875, 332.40396118164, -7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
							wait(1.5);
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
						end
					end
				elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2)) then
					topos(CFrame.new( -12512.138671875, 340.39279174805, -9872.8203125));
				end
			end
		end
	end);
end);
v60:Seperator("Twin Hook");
v60:Toggle("Lấy Twin Hook", _G.TwinHook, function(v422)
	_G.TwinHook = v422;
	StopTween(_G.TwinHook);
end);
v60:Toggle("Lấy Twin Hook Đổi Sever", _G.TwinHook_Hop, function(v423)
	_G.TwinHook_Hop = v423;
end);
local v94 = CFrame.new( -13348.0654296875, 405.8904113769531, -8570.62890625);
spawn(function()
	while wait() do
		if (_G.TwinHook and World3) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
					for v1892, v1893 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1893.Name == "Captain Elephant") then
							if (v1893:FindFirstChild("Humanoid") and v1893:FindFirstChild("HumanoidRootPart") and (v1893.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1893.HumanoidRootPart.CanCollide = false;
									v1893.Humanoid.WalkSpeed = 0;
									v1893.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1893.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.TwinHook or  not v1893.Parent or (v1893.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v94.Position).Magnitude > 3500) then
							BTP(v94);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v94.Position).Magnitude < 3500) then
							topos(v94);
						end
					else
						topos(v94);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -13348.0654296875, 405.8904113769531, -8570.62890625));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.TwinHook_Hop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Seperator("Haki");
v60:Toggle("Lấy Haki Màu", _G.Rainbow_Haki, function(v424)
	_G.Rainbow_Haki = v424;
	StopTween(_G.Rainbow_Haki);
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.Rainbow_Haki then
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
					topos(CFrame.new( -11892.0703125, 930.57672119141, -8760.1591796875));
					if ((Vector3.new( -11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
						wait(1.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
					end
				elseif ((game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")) then
					if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
						for v2338, v2339 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2339.Name == "Stone") then
								OldCFrameRainbow = v2339.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2339.HumanoidRootPart.CFrame * Pos );
									v2339.HumanoidRootPart.CanCollide = false;
									v2339.HumanoidRootPart.CFrame = OldCFrameRainbow;
									v2339.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until (_G.Rainbow_Haki == false) or (v2339.Humanoid.Health <= 0) or  not v2339.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
							end
						end
					else
						topos(CFrame.new( -1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 0.000020325184, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199));
					end
				elseif ((game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress")) then
					if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
						for v2446, v2447 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2447.Name == "Island Empress") then
								OldCFrameRainbow = v2447.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2447.HumanoidRootPart.CFrame * Pos );
									v2447.HumanoidRootPart.CanCollide = false;
									v2447.HumanoidRootPart.CFrame = OldCFrameRainbow;
									v2447.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until (_G.Rainbow_Haki == false) or (v2447.Humanoid.Health <= 0) or  not v2447.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
							end
						end
					else
						topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, "-0", -0.994878292, "-0", 1, "-0", 0.994878292, 0, -0.101080291));
					end
				elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
					if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
						for v2572, v2573 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2573.Name == "Kilo Admiral") then
								OldCFrameRainbow = v2573.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2573.HumanoidRootPart.CFrame * Pos );
									v2573.HumanoidRootPart.CanCollide = false;
									v2573.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									v2573.HumanoidRootPart.CFrame = OldCFrameRainbow;
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until (_G.Rainbow_Haki == false) or (v2573.Humanoid.Health <= 0) or  not v2573.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
							end
						end
					else
						topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, "-0", -0.143904909, "-0", 1.00000012, "-0", 0.143904924, 0, -0.989591479));
					end
				elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
					if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
						for v2612, v2613 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2613.Name == "Captain Elephant") then
								OldCFrameRainbow = v2613.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2613.HumanoidRootPart.CFrame * Pos );
									v2613.HumanoidRootPart.CanCollide = false;
									v2613.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									v2613.HumanoidRootPart.CFrame = OldCFrameRainbow;
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until (_G.Rainbow_Haki == false) or (v2613.Humanoid.Health <= 0) or  not v2613.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
							end
						end
					else
						topos(CFrame.new( -13485.0283, 331.709259, -8012.4873, 0.714521289, 7.988499e-8, 0.69961375, -1.0206575e-7, 1, -9.943831e-9, -0.69961375, -6.4301524e-8, 0.714521289));
					end
				elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
					if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
						for v2651, v2652 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if (v2652.Name == "Beautiful Pirate") then
								OldCFrameRainbow = v2652.HumanoidRootPart.CFrame;
								repeat
									task.wait();
									EquipWeapon(_G.SelectWeapon);
									topos(v2652.HumanoidRootPart.CFrame * Pos );
									v2652.HumanoidRootPart.CanCollide = false;
									v2652.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									v2652.HumanoidRootPart.CFrame = OldCFrameRainbow;
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
								until (_G.Rainbow_Haki == false) or (v2652.Humanoid.Health <= 0) or  not v2652.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
							end
						end
					else
						topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359));
					end
				else
					topos(CFrame.new( -11892.0703125, 930.57672119141, -8760.1591796875));
					if ((Vector3.new( -11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
						wait(1.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
					end
				end
			end
		end
	end);
end);
v60:Toggle("Lấy Haki Quan Sát V2", _G.Observationv2, function(v425)
	_G.Observationv2 = v425;
	StopTween(_G.Observationv2);
end);
spawn(function()
	while wait() do
		pcall(function()
			if _G.Observationv2 then
				if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3) then
					_G.MusketeerHat = false;
					if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
						repeat
							topos(CFrame.new( -12444.78515625, 332.40396118164, -7673.1806640625));
							wait();
						until  not _G.Observationv2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10)
						wait(0.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
					elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl")) then
						repeat
							topos(CFrame.new( -10920.125, 624.20275878906, -10266.995117188));
							wait();
						until  not _G.Observationv2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new( -10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10)
						wait(0.5);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start");
						wait(1);
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy");
					else
						for v2340, v2341 in pairs(game:GetService("Workspace"):GetDescendants()) do
							if ((v2341.Name == "Apple") or (v2341.Name == "Banana") or (v2341.Name == "Pineapple")) then
								v2341.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10) ;
								wait();
								firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v2341.Handle, 0);
								wait();
							end
						end
					end
				else
					_G.MusketeerHat = true;
				end
			end
		end);
	end
end);
v60:Seperator("Carvander");
v60:Toggle("Lấy Cavander", _G.Carvender, function(v426)
	_G.Carvender = v426;
	StopTween(_G.Carvender);
end);
v60:Toggle("Lấy Carvander Đổi Sever", _G.Carvenderhop, function(v427)
	_G.Carvenderhop = v427;
end);
local v95 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875);
spawn(function()
	while wait() do
		if (_G.Carvender and World3) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
					for v1894, v1895 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1895.Name == "Beautiful Pirate") then
							if (v1895:FindFirstChild("Humanoid") and v1895:FindFirstChild("HumanoidRootPart") and (v1895.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1895.HumanoidRootPart.CanCollide = false;
									v1895.Humanoid.WalkSpeed = 0;
									v1895.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1895.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.Carvender or  not v1895.Parent or (v1895.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v95.Position).Magnitude > 3500) then
							BTP(v95);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v95.Position).Magnitude < 3500) then
							topos(v95);
						end
					else
						topos(v95);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.Cavanderhop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Seperator("Tushita");
v60:Toggle("Lấy Tushita", _G.tushita, function(v428)
	_G.tushita = v428;
	StopTween(_G.tushita);
end);
v60:Toggle("Lấy Tushita Đổi Sever", _G.tushitahop, function(v429)
	_G.tushitahop = v429;
end);
local v96 = CFrame.new( -10238.875976563, 389.7912902832, -9549.7939453125);
spawn(function()
	while wait() do
		if (_G.tushita and World3) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
					for v1896, v1897 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1897.Name == "Longma") then
							if (v1897:FindFirstChild("Humanoid") and v1897:FindFirstChild("HumanoidRootPart") and (v1897.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1897.HumanoidRootPart.CanCollide = false;
									v1897.Humanoid.WalkSpeed = 0;
									v1897.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1897.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.tushita or  not v1897.Parent or (v1897.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v96.Position).Magnitude > 3500) then
							BTP(v96);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v96.Position).Magnitude < 3500) then
							topos(v96);
						end
					else
						topos(v96);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -10238.875976563, 389.7912902832, -9549.7939453125));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.tushitahop then
						Hop();
					end
				end
			end);
		end
	end
end);
v60:Seperator("Hallow Scythe");
v60:Toggle("Lấy Lưỡi Hái", _G.FarmBossHallow, function(v430)
	_G.FarmBossHallow = v430;
	StopTween(_G.FarmBossHallow);
end);
v60:Toggle("Lưỡi Hái Đổi Sever", _G.FarmBossHallowHop, function(v431)
	_G.FarmBossHallowHop = v431;
end);
spawn(function()
	while wait() do
		if _G.FarmBossHallow then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
					for v1898, v1899 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if string.find(v1899.Name, "Soul Reaper") then
							repeat
								task.wait();
								EquipWeapon(_G.SelectWeapon);
								AutoHaki();
								v1899.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								topos(v1899.HumanoidRootPart.CFrame * Pos );
								v1899.HumanoidRootPart.Transparency = 1;
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
							until (v1899.Humanoid.Health <= 0) or (_G.FarmBossHallow == false)
						end
					end
				elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence")) then
					repeat
						topos(CFrame.new( -8932.322265625, 146.83154296875, 6062.55078125));
						wait();
					until (CFrame.new( -8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
					EquipWeapon("Hallow Essence");
				elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
					topos(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
				elseif _G.FarmBossHallowHop then
					Hop();
				end
			end);
		end
	end
end);
v60:Seperator("Buddy Sword");
v60:Toggle("Lấy Kiếm Buddy", _G.BudySword, function(v432)
	_G.BudySword = v432;
	StopTween(_G.BudySword);
end);
v60:Toggle("Kiếm Buddy Đổi Sever", _G.BudySwordHop, function(v433)
	_G.BudySwordHop = v433;
end);
local v97 = CFrame.new( -731.2034301757812, 381.5658874511719, -11198.4951171875);
spawn(function()
	while wait() do
		if (_G.BudySword and World3) then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
					for v1900, v1901 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1901.Name == "Cake Queen") then
							if (v1901:FindFirstChild("Humanoid") and v1901:FindFirstChild("HumanoidRootPart") and (v1901.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1901.HumanoidRootPart.CanCollide = false;
									v1901.Humanoid.WalkSpeed = 0;
									v1901.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1901.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.BudySword or  not v1901.Parent or (v1901.Humanoid.Health <= 0)
							end
						end
					end
				else
					if BypassTP then
						if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v97.Position).Magnitude > 3500) then
							BTP(v97);
						elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v97.Position).Magnitude < 3500) then
							topos(v97);
						end
					else
						topos(v97);
					end
					UnEquipWeapon(_G.SelectWeapon);
					topos(CFrame.new( -731.2034301757812, 381.5658874511719, -11198.4951171875));
					if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
						topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
					elseif _G.BudySwordHop then
						Hop();
					end
				end
			end);
		end
	end
end);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.BringMonster then
				CheckQuest();
				for v1656, v1657 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if (_G.Level and StartMagnet and (v1657.Name == Mon) and ((Mon == "Factory Staff") or (Mon == "Monkey") or (Mon == "Dragon Crew Warrior") or (Mon == "Dragon Crew Archer")) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0) and ((v1657.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250)) then
						v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
						v1657.HumanoidRootPart.CFrame = PosMon;
						v1657.Humanoid:ChangeState(14);
						v1657.HumanoidRootPart.CanCollide = false;
						v1657.Head.CanCollide = false;
						if v1657.Humanoid:FindFirstChild("Animator") then
							v1657.Humanoid.Animator:Destroy();
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
					elseif (_G.Level and StartMagnet and (v1657.Name == Mon) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0) and ((v1657.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode)) then
						v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
						v1657.HumanoidRootPart.CFrame = PosMon;
						v1657.Humanoid:ChangeState(14);
						v1657.HumanoidRootPart.CanCollide = false;
						v1657.Head.CanCollide = false;
						if v1657.Humanoid:FindFirstChild("Animator") then
							v1657.Humanoid.Animator:Destroy();
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
					end
					if (_G.Ectoplasm and StartEctoplasmMagnet) then
						if (string.find(v1657.Name, "Ship") and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0) and ((v1657.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= _G.BringMode)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.HumanoidRootPart.CFrame = EctoplasmMon;
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.Rengoku and StartRengokuMagnet) then
						if (((v1657.Name == "Snow Lurker") or (v1657.Name == "Arctic Warrior")) and ((v1657.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(1500, 1500, 1500);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = RengokuMon;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.MusketeerHat and StartMagnetMusketeerhat) then
						if ((v1657.Name == "Forest Pirate") and ((v1657.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = MusketeerHatMon;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.ObservationHakiV2 and Mangnetcitzenmon) then
						if ((v1657.Name == "Forest Pirate") and ((v1657.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosHee;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.EvoRace and StartEvoMagnet) then
						if ((v1657.Name == "Zombie") and ((v1657.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosMonEvo;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.Bartilo and AutoBartiloBring) then
						if ((v1657.Name == "Swan Pirate") and ((v1657.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosMonBarto;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.FarmFruitMastery and StartMasteryFruitMagnet) then
						if (v1657.Name == "Monkey") then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryFruit;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						elseif (v1657.Name == "Factory Staff") then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryFruit;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						elseif (v1657.Name == Mon) then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryFruit;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						end
					end
					if (_G.FarmGunMastery and StartMasteryGunMagnet) then
						if (v1657.Name == "Monkey") then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryGun;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						elseif (v1657.Name == "Factory Staff") then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryGun;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						elseif (v1657.Name == Mon) then
							if (((v1657.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
								v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
								v1657.Humanoid:ChangeState(14);
								v1657.HumanoidRootPart.CanCollide = false;
								v1657.Head.CanCollide = false;
								v1657.HumanoidRootPart.CFrame = PosMonMasteryGun;
								if v1657.Humanoid:FindFirstChild("Animator") then
									v1657.Humanoid.Animator:Destroy();
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
							end
						end
					end
					if (_G.Bone and StartMagnetBoneMon) then
						if (((v1657.Name == "Reborn Skeleton") or (v1657.Name == "Living Zombie") or (v1657.Name == "Demonic Soul") or (v1657.Name == "Posessed Mummy")) and ((v1657.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosMonBone;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.FarmCandy and StartCandyMagnet) then
						if (((v1657.Name == "Ice Cream Chef") or (v1657.Name == "Ice Cream Commander")) and ((v1657.HumanoidRootPart.Position - CandyMon.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = CandyMon;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (StardFarm and FarmMag) then
						if (((v1657.Name == "Cocoa Warrior") or (v1657.Name == "Chocolate Bar Battler") or (v1657.Name == "Sweet Thief") or (v1657.Name == "Candy Rebel")) and ((v1657.HumanoidRootPart.Position - PosGG.Position).Magnitude <= 250) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosGG;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.Farmfast and StardMag) then
						if (((v1657.Name == "Shanda") or (v1657.Name == "Shanda")) and ((v1657.HumanoidRootPart.Position - FastMon.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = FastMon;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
					if (_G.DoughtBoss and MagnetDought) then
						if (((v1657.Name == "Cookie Crafter") or (v1657.Name == "Cake Guard") or (v1657.Name == "Baking Staff") or (v1657.Name == "Head Baker")) and ((v1657.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= _G.BringMode) and v1657:FindFirstChild("Humanoid") and v1657:FindFirstChild("HumanoidRootPart") and (v1657.Humanoid.Health > 0)) then
							v1657.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
							v1657.Humanoid:ChangeState(14);
							v1657.HumanoidRootPart.CanCollide = false;
							v1657.Head.CanCollide = false;
							v1657.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor;
							if v1657.Humanoid:FindFirstChild("Animator") then
								v1657.Humanoid.Animator:Destroy();
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
						end
					end
				end
			end
		end);
	end
end);
task.spawn(function()
	while true do
		wait();
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true);
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
		end
	end
end);
function InMyNetWork(v434)
	if isnetworkowner then
		return isnetworkowner(v434);
	else
		if ((v434.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode) then
			return true;
		end
		return false;
	end
end
task.spawn(function()
	while task.wait() do
		pcall(function()
			if (MakoriGayMag and _G.BringMonster) then
				for v1658, v1659 in pairs(game.Workspace.Enemies:GetChildren()) do
					if ( not string.find(v1659.Name, "Boss") and ((v1659.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode)) then
						if InMyNetWork(v1659.HumanoidRootPart) then
							v1659.HumanoidRootPart.CFrame = PosGay;
							v1659.Humanoid.JumpPower = 0;
							v1659.Humanoid.WalkSpeed = 0;
							v1659.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
							v1659.HumanoidRootPart.Transparency = 1;
							v1659.HumanoidRootPart.CanCollide = false;
							v1659.Head.CanCollide = false;
							if v1659.Humanoid:FindFirstChild("Animator") then
								v1659.Humanoid.Animator:Destroy();
							end
							v1659.Humanoid:ChangeState(11);
							v1659.Humanoid:ChangeState(14);
						end
					end
				end
			end
		end);
	end
end);
task.spawn(function()
	while task.wait() do
		pcall(function()
			if (Anchor and _G.BringMonster) then
				for v1660, v1661 in pairs(game.Workspace.Enemies:GetChildren()) do
					if ( not string.find(v1661.Name, "Boss") and ((v1661.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode)) then
						if InMyNetWork(v1661.HumanoidRootPart) then
							v1661.HumanoidRootPart.CFrame = PosNarathiwat;
							v1661.Humanoid.JumpPower = 0;
							v1661.Humanoid.WalkSpeed = 0;
							v1661.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
							v1661.HumanoidRootPart.Transparency = 1;
							v1661.HumanoidRootPart.CanCollide = false;
							v1661.Head.CanCollide = false;
							if v1661.Humanoid:FindFirstChild("Animator") then
								v1661.Humanoid.Animator:Destroy();
							end
							v1661.Humanoid:ChangeState(11);
							v1661.Humanoid:ChangeState(14);
						end
					end
				end
			end
		end);
	end
end);
task.spawn(function()
	while task.wait() do
		pcall(function()
			if ((_G.FarmNearest and AutoFarmNearestMagnet) or (SelectMag and _G.BringMonster)) then
				for v1662, v1663 in pairs(game.Workspace.Enemies:GetChildren()) do
					if ( not string.find(v1663.Name, "Boss") and ((v1663.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode)) then
						if InMyNetWork(v1663.HumanoidRootPart) then
							v1663.HumanoidRootPart.CFrame = PosMon;
							v1663.Humanoid.JumpPower = 0;
							v1663.Humanoid.WalkSpeed = 0;
							v1663.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
							v1663.HumanoidRootPart.Transparency = 1;
							v1663.HumanoidRootPart.CanCollide = false;
							v1663.Head.CanCollide = false;
							if v1663.Humanoid:FindFirstChild("Animator") then
								v1663.Humanoid.Animator:Destroy();
							end
							v1663.Humanoid:ChangeState(11);
							v1663.Humanoid:ChangeState(14);
						end
					end
				end
			end
		end);
	end
end);
if (World1 or World2) then
	v61:Label("Hãy Qua Sea 3");
end
if World3 then
	v61:Seperator("Đảo Bí Ẩn");
	v61:Toggle("Bay Lại Đảo Bí Ẩn", _G.MysticIsland, function(v1397)
		_G.MysticIsland = v1397;
		StopTween(_G.MysticIsland);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if _G.MysticIsland then
					local v1702 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland");
					if v1702 then
						local v2091 = v1702.WorldPivot.Position;
						topos(CFrame.new(v2091.X, 500, v2091.Z));
					end
				end
			end
		end);
	end);
	v61:Toggle("Bay Đến Chổ Bán Trái", _G.TPNPC, function(v1398)
		_G.Miragenpc = v1398;
		StopTween(_G.Miragenpc);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Miragenpc then
					if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
						topos(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position));
					end
				end
			end
		end);
	end);
	v61:Button("Đến Chổ Bán Trái", function()
		TweenNpc();
	end);
	function TweenNpc()
		repeat
			wait();
		until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
		if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
			AllNPCS = getnilinstances();
			for v1664, v1665 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
				table.insert(AllNPCS, v1665);
			end
			for v1666, v1667 in pairs(AllNPCS) do
				if (v1667.Name == "Advanced Fruit Dealer") then
					topos(v1667.HumanoidRootPart.CFrame);
				end
			end
		end
	end
	v61:Toggle("Bay Đến Bánh Răng", _G.TweenMGear, function(v1399)
		_G.TweenMGear = v1399;
		StopTween(_G.TweenMGear);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if _G.TweenMGear then
					if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
						for v2238, v2239 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
							if v2239:IsA("MeshPart") then
								if (v2239.Material == Enum.Material.Neon) then
									topos(v2239.CFrame);
								end
							end
						end
					end
				end
			end
		end);
	end);
end
if World3 then
	v61:Seperator("Tộc V4");
	v61:Button("Bay Đến Đỉnh Cay Đại Thụ", function()
		topos(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625));
	end);
	v61:Button("Dịch chuyển đến đền Thờ thời gian", function()
		Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
	end);
	v61:Button("Bay Đến Cần Gạt", function()
		topos(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734));
	end);
	v61:Button("Bay Đến Chỗ Bán Bánh Răng", function()
		topos(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375));
	end);
	v61:Button("Truy cập đồng hồ", function()
		game:GetService("Workspace").Map["Temple of Time"].DoNotEnter:Remove();
		game:GetService("Workspace").Map["Temple of Time"].ClockRoomExit:Remove();
	end);
	v61:Toggle("Mua Bánh Răng", _G.Bone4, function(v1401)
		_G.Bone4 = v1401;
		StopTween(_G.Bone4);
	end);
	spawn(function()
		pcall(function()
			while wait(0.1) do
				if _G.Bone4 then
					local v1703 = {
						[1] = true
					};
					local v1703 = {
						[1] = "UpgradeRace",
						[2] = "Buy"
					};
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(v1703));
				end
			end
		end);
	end);
	v61:Button("Bay Đến Tộc Của Bạn", function()
		Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
		wait(0.1);
		Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
		wait(0.1);
		Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
		wait(0.1);
		Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
		if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922));
		elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938));
		elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406));
		elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188));
		elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719));
		elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
			Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286, 14897, 103);
			wait(0.6);
			topos(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969));
		end
	end);
	v61:Button("Bay Đến Đồng Hồ", function()
		topos(CFrame.new(29551.9941, 15069.002, -85.5179291));
	end);
	v61:Toggle("Tự Động Hoàng Thành Ải", false, function(v1403)
		_G.QuestRace = v1403;
		StopTween(_G.QuestRace);
	end);
	spawn(function()
		pcall(function()
			while wait() do
				if _G.QuestRace then
					if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
						for v2240, v2241 in pairs(game.Workspace.Enemies:GetDescendants()) do
							if (v2241:FindFirstChild("Humanoid") and v2241:FindFirstChild("HumanoidRootPart") and (v2241.Humanoid.Health > 0)) then
								pcall(function()
									repeat
										wait(0.1);
										v2241.Humanoid.Health = 0;
										v2241.HumanoidRootPart.CanCollide = false;
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
									until  not _G.QuestRace or  not v2241.Parent or (v2241.Humanoid.Health <= 0)
								end);
							end
						end
					elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
						for v2350, v2351 in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
							if (v2351.Name == "snowisland_Cylinder.081") then
								topos(v2351.CFrame * CFrame.new(0, 0, 0) );
							end
						end
					elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
						for v2459, v2460 in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
							if (v2460.Name == "HumanoidRootPart") then
								topos(v2460.CFrame * CFrame.new(PosX, PosY, PosZ) );
								for v2597, v2598 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
									if v2598:IsA("Tool") then
										if (v2598.ToolTip == "Melee") then
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(v2598);
										end
									end
								end
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								for v2599, v2600 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
									if v2600:IsA("Tool") then
										if (v2600.ToolTip == "Blox Fruit") then
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(v2600);
										end
									end
								end
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.5);
								for v2601, v2602 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
									if v2602:IsA("Tool") then
										if (v2602.ToolTip == "Sword") then
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(v2602);
										end
									end
								end
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.5);
								for v2603, v2604 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
									if v2604:IsA("Tool") then
										if (v2604.ToolTip == "Gun") then
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(v2604);
										end
									end
								end
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								wait(0.2);
								game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
							end
						end
					elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
						topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1));
					elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
						for v2614, v2615 in pairs(game.Workspace.Enemies:GetDescendants()) do
							if (v2615:FindFirstChild("Humanoid") and v2615:FindFirstChild("HumanoidRootPart") and (v2615.Humanoid.Health > 0)) then
								pcall(function()
									repeat
										wait(0.1);
										v2615.Humanoid.Health = 0;
										v2615.HumanoidRootPart.CanCollide = false;
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
									until  not _G.QuestRace or  not v2615.Parent or (v2615.Humanoid.Health <= 0)
								end);
							end
						end
					elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
						for v2653, v2654 in pairs(game:GetService("Workspace"):GetDescendants()) do
							if (v2654.Name == "StartPoint") then
								topos(v2654.CFrame * CFrame.new(0, 10, 0) );
							end
						end
					end
				end
			end
		end);
	end);
	v61:Toggle("Tự Động Cày Và Bậc V4", false, function(v1404)
		_G.Bone = v1404;
		_G.Bone4 = v1404;
		_G.ActiveV4 = v1404;
		StopTween(_G.Bone);
	end);
	v61:Toggle("Giết Người Chơi Trial", false, function(v1405)
		_G.KillAfterTrials = v1405;
		_G.Click = v1405;
		_G.TurnKen = v1405;
		_G.AimNearest = v1405;
		_G.Aimbot_Skill = v1405;
		StopTween(_G.KillAfterTrials);
	end);
	spawn(function()
		while wait() do
			pcall(function()
				if _G.KillAfterTrials then
					for v1906, v1907 in pairs(game:GetService("Workspace").Characters:GetChildren()) do
						if ((v1907.Name ~= game.Players.LocalPlayer.Name) and ((v1907.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100)) then
							if (v1907.Humanoid.Health > 0) then
								repeat
									wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									NameTarget = v1907.Name;
									TP1(v1907.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5) );
									v1907.HumanoidRootPart.CanCollide = false;
									v1907.Head.CanCollide = false;
									v1907.HumanoidRootPart.Size = Vector3.new(100, 100, 100);
									Click();
								until  not _G.KillAfterTrials or  not v1907.Parent or (v1907.Humanoid.Health <= 0)
							end
						end
					end
				end
			end);
		end
	end);
	spawn(function()
		while wait() do
			pcall(function()
				if _G.TurnKen then
					repeat
						task.wait();
						if  not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
							game:GetService("VirtualUser"):CaptureController();
							game:GetService("VirtualUser"):SetKeyDown("0x65");
							wait(2);
							game:GetService("VirtualUser"):SetKeyUp("0x65");
						end
					until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or  not _G.Observation
				end
			end);
		end
	end);
	v61:Toggle("Tự động khóa mặt trăng", _G.LockCamToMoon, function(v1406)
		_G.LockCamToMoon = v1406;
	end);
	function CamToMoon()
		workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position );
	end
	spawn(function()
		pcall(function()
			while wait() do
				if _G.LockCamToMoon then
					CamToMoon();
				end
			end
		end);
	end);
	v61:Button("Mua nhiệm vụ cổ đại", function(v1408)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
	end);
end
v63:Seperator("Định Vị");
v63:Toggle("Định Vị Người Chơi", false, function(v435)
	ESPPlayer = v435;
	UpdatePlayerChams();
end);
v63:Toggle("Định Vị Đảo Kitsune", false, function(v436)
	IslandESP = v436;
	while IslandESP do
		wait();
		UpdateIslandESPKitsune();
	end
end);
function UpdateIslandESPKitsune()
	for v805, v806 in pairs(game:GetService("Workspace").Map.KitsuneIsland.ShrineActive:GetChildren()) do
		pcall(function()
			if IslandESP then
				if (v806.Name ~= "NeonShrinePart") then
					if  not v806:FindFirstChild("IslandESP") then
						local v2093 = Instance.new("BillboardGui", v806);
						v2093.Name = "IslandESP";
						v2093.ExtentsOffset = Vector3.new(0, 1, 0);
						v2093.Size = UDim2.new(1, 200, 1, 30);
						v2093.Adornee = v806;
						v2093.AlwaysOnTop = true;
						local v2099 = Instance.new("TextLabel", v2093);
						v2099.Font = "Code";
						v2099.FontSize = "Size14";
						v2099.TextWrapped = true;
						v2099.Size = UDim2.new(1, 0, 1, 0);
						v2099.TextYAlignment = "Top";
						v2099.BackgroundTransparency = 1;
						v2099.TextStrokeTransparency = 0.5;
						v2099.TextColor3 = Color3.fromRGB(80, 245, 245);
						v2099.Text = "Kitsune Island";
					else
						v806['IslandESP'].TextLabel.Text = "Kitsune Island";
					end
				end
			elseif v806:FindFirstChild("IslandESP") then
				v806:FindFirstChild("IslandESP"):Destroy();
			end
		end);
	end
end
v63:Toggle("Định Vị Rương", false, function(v437)
	ChestESP = v437;
	UpdateChestChams();
end);
v63:Toggle("Định Vị Trái Ác Quỷ", false, function(v438)
	DevilFruitESP = v438;
	while DevilFruitESP do
		wait();
		UpdateDevilChams();
	end
end);
v63:Toggle("Định Vị Trái Cây", RealFruitESP, function(v439)
	RealFruitESP = v439;
	UpdateRealFruitChams();
end);
v63:Toggle("Định Vị Hoa", false, function(v440)
	FlowerESP = v440;
	UpdateFlowerChams();
end);
spawn(function()
	while wait() do
		if FlowerESP then
			UpdateFlowerChams();
		end
		if DevilFruitESP then
			UpdateDevilChams();
		end
		if ChestESP then
			UpdateChestChams();
		end
		if ESPPlayer then
			UpdatePlayerChams();
		end
		if RealFruitESP then
			UpdateRealFruitChams();
		end
	end
end);
v63:Toggle("Định Vị Đảo", IslandESP, function(v441)
	IslandESP = v441;
	while IslandESP do
		wait();
		UpdateIslandESP();
	end
end);
v63:Toggle("Định Vị Đảo Bí Ẩn", false, function(v442)
	MirageIslandESP = v442;
	while MirageIslandESP do
		wait();
		UpdateIslandMirageESP();
	end
end);
v63:Seperator("Chơi khăm");
v63:Button("Mưa Trái", function()
	for v807, v808 in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
		v808.Parent = game.Workspace.Map;
		v808:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random( -50, 50), 100, math.random( -50, 50)) );
		if v808.Fruit:FindFirstChild("AnimationController") then
			v808.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v808.Fruit:FindFirstChild("Idle")):Play();
		end
		v808.Handle.Touched:Connect(function(v1409)
			if (v1409.Parent == game.Players.LocalPlayer.Character) then
				v808.Parent = game.Players.LocalPlayer.Backpack;
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v808);
			end
		end);
	end
end);
v63:Button("Làm Giả Cấp/Beli/Kinh Nghiệm", function()
	local v443 = game:GetService("Players").LocalPlayer;
	local v444 = require(game:GetService("ReplicatedStorage").Notification);
	local v445 = v443:WaitForChild("Data");
	local v446 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"));
	local v447 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp);
	local v448 = require(game:GetService("ReplicatedStorage").Util.Sound);
	local v449 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp") ;
	function v129(v811)
		local v812 = v811;
		while true do
			local v1410, v1411 = string.gsub(v812, "^(-?%d+)(%d%d%d)", "%1,%2");
			v812 = v1410;
			if (v1411 == 0) then
				break;
			end
		end
		return v812;
	end
	v444.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display();
	v444.new("Earned <Color=Yellow>9,999,999,999,999 Exp.<Color=/> (+ None)"):Display();
	v444.new("Earned <Color=Green>$9,999,999,999,999<Color=/>"):Display();
	v443.Data.Exp.Value = 999999999999;
	v443.Data.Beli.Value = v443.Data.Beli.Value + 999999999999 ;
	delay = 0;
	count = 0;
	while (v443.Data.Exp.Value - v446(v445.Level.Value)) > 0  do
		v443.Data.Exp.Value = v443.Data.Exp.Value - v446(v445.Level.Value) ;
		v443.Data.Level.Value = v443.Data.Level.Value + 1 ;
		v443.Data.Points.Value = v443.Data.Points.Value + 3 ;
		v447({
			v443
		});
		v448.Play(v448, v449.Value);
		v444.new("<Color=Green>LEVEL UP!<Color=/> ("   .. v443.Data.Level.Value   .. ")" ):Display();
		count = count + 1 ;
		if (count >= 5) then
			delay = tick();
			count = 0;
			wait(2);
		end
	end
end);
v63:Textbox("Làm Giả Cấp", true, function(v452)
	game:GetService("Players").LocalPlayer.Data.Level.Value = v452;
end);
v63:Textbox("Làm Giả Kinh Nghiệm", true, function(v454)
	game:GetService("Players").LocalPlayer.Data.Exp.Value = v454;
end);
v63:Textbox("Làm Giả Tiền", true, function(v456)
	game:GetService("Players").LocalPlayer.Data.Beli.Value = v456;
end);
v63:Textbox("Làm Giả Điểm Tím", true, function(v458)
	game:GetService("Players").LocalPlayer.Data.Fragments.Value = v458;
end);
v63:Textbox("Làm Giả Điểm", true, function(v460)
	game:GetService("Players").LocalPlayer.Data.Points.Value = v460;
end);
v63:Textbox("Làm Giả Tiền Thưởng", true, function(v462)
	game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value = v462;
end);
v63:Seperator("Điểm nổi bật");
v63:Toggle("Hiển thị trò chuyện", _G.chat, function(v464)
	_G.chat = v464;
	if (_G.chat == true) then
		local v1412 = game:GetService("StarterGui");
		v1412:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
	elseif (_G.chat == false) then
		local v1609 = game:GetService("StarterGui");
		v1609:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
	end
end);
v63:Toggle("Hiển thị bảng xếp hạng", _G.leaderboard, function(v465)
	_G.leaderboard = v465;
	if (_G.leaderboard == true) then
		local v1413 = game:GetService("StarterGui");
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	elseif (_G.leaderboard == false) then
		local v1610 = game:GetService("StarterGui");
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
	end
end);
v63:Seperator("Gian lận");
v63:Button("Mở khóa Buso", function()
	local v466 = "Buso";
	if (type(v466) == "string") then
		game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v466);
	elseif (type(v466) == "table") then
		for v1668, v1669 in next, v466 do
			game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v1669);
		end
	end
end);
v63:Button("Mở Khoá Soru", function()
	local v467 = "Soru";
	if (type(v467) == "string") then
		game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v467);
	elseif (type(v467) == "table") then
		for v1670, v1671 in next, v467 do
			game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v1671);
		end
	end
end);
v63:Button("Mở Khoá Geppo", function()
	local v468 = "Geppo";
	if (type(v468) == "string") then
		game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v468);
	elseif (type(v468) == "table") then
		for v1672, v1673 in next, v468 do
			game:GetService("CollectionService"):AddTag(game.Players.LocalPlayer.Character, v1673);
		end
	end
end);
v63:Button("Thu phóng tối đa", function()
	while wait() do
		game.Players.LocalPlayer.CameraMaxZoomDistance = 9223372036854718;
	end
end);
v63:Button("Hiển Thị Tài Khoản", function(v469)
	local v470 = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.UIController.Inventory);
	local v471 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory");
	local v472 = {};
	local v473 = {
		"Mythical",
		"Legendary",
		"Rare",
		"Uncommon",
		"Common"
	};
	local v474 = {
		Common = Color3.fromRGB(179, 179, 179),
		Uncommon = Color3.fromRGB(92, 140, 211),
		Rare = Color3.fromRGB(140, 82, 255),
		Legendary = Color3.fromRGB(213, 43, 228),
		Mythical = Color3.fromRGB(238, 47, 50)
	};
	function GetRaity(v817)
		for v1414, v1415 in pairs(v474) do
			if (v1415 == v817) then
				return v1414;
			end
		end
	end
	for v818, v819 in pairs(v471) do
		v472[v819.Name] = v819;
	end
	local v475 = #getupvalue(v470.UpdateRender, 4);
	local v476 = {};
	local v477 = {};
	local v478 = 0;
	while v478 < v475  do
		local v821 = 0;
		while (v821 < 25000) and (v478 < v475)  do
			game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0, v821);
			for v1517, v1518 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren()) do
				if (v1518:IsA("Frame") and  not v476[v1518.ItemName.Text] and (v1518.ItemName.Visible == true)) then
					local v1674 = GetRaity(v1518.Background.BackgroundColor3);
					if v1674 then
						print("Rac");
						if  not v477[v1674] then
							v477[v1674] = {};
						end
						table.insert(v477[v1674], v1518:Clone());
					end
					v478 = v478 + 1 ;
					v476[v1518.ItemName.Text] = true;
				end
			end
			v821 = v821 + 20 ;
		end
		wait();
	end
	function GetXY(v822)
		return v822 * 100 ;
	end
	local v479 = Instance.new("UIListLayout");
	v479.FillDirection = Enum.FillDirection.Vertical;
	v479.SortOrder = 2;
	v479.Padding = UDim.new(0, 10);
	local v484 = Instance.new("Frame", game.Players.LocalPlayer.PlayerGui.BubbleChat);
	v484.BackgroundTransparency = 1;
	v484.Size = UDim2.new(0.5, 0, 1, 0);
	v479.Parent = v484;
	local v488 = Instance.new("Frame", game.Players.LocalPlayer.PlayerGui.BubbleChat);
	v488.BackgroundTransparency = 1;
	v488.Size = UDim2.new(0.5, 0, 1, 0);
	v488.Position = UDim2.new(0.6, 0, 0, 0);
	v479:Clone().Parent = v488;
	for v823, v824 in pairs(v477) do
		local v825 = Instance.new("Frame", v484);
		v825.BackgroundTransparency = 1;
		v825.Size = UDim2.new(1, 0, 0, 0);
		v825.LayoutOrder = table.find(v473, v823);
		local v829 = Instance.new("Frame", v488);
		v829.BackgroundTransparency = 1;
		v829.Size = UDim2.new(1, 0, 0, 0);
		v829.LayoutOrder = table.find(v473, v823);
		local v833 = Instance.new("UIGridLayout", v825);
		v833.CellPadding = UDim2.new(0.005, 0, 0.005, 0);
		v833.CellSize = UDim2.new(0, 70, 0, 70);
		v833.FillDirectionMaxCells = 100;
		v833.FillDirection = Enum.FillDirection.Horizontal;
		local v839 = v833:Clone();
		v839.Parent = v829;
		for v1417, v1418 in pairs(v824) do
			if (v472[v1418.ItemName.Text] and v472[v1418.ItemName.Text].Mastery) then
				if (v1418.ItemLine2.Text ~= "Accessory") then
					local v1705 = v1418.ItemName:Clone();
					v1705.BackgroundTransparency = 1;
					v1705.TextSize = 10;
					v1705.TextXAlignment = 2;
					v1705.TextYAlignment = 2;
					v1705.ZIndex = 5;
					v1705.Text = v472[v1418.ItemName.Text].Mastery;
					v1705.Size = UDim2.new(0.5, 0, 0.5, 0);
					v1705.Position = UDim2.new(0.5, 0, 0.5, 0);
					v1705.Parent = v1418;
				end
				v1418.Parent = v825;
			elseif (v1418.ItemLine2.Text == "Blox Fruit") then
				v1418.Parent = v829;
			end
		end
		v825.AutomaticSize = 2;
		v829.AutomaticSize = 2;
	end
	local v493 = {
		Superhuman = Vector2.new(3, 2),
		GodHuman = Vector2.new(3, 2),
		DeathStep = Vector2.new(4, 3),
		ElectricClaw = Vector2.new(2, 0),
		SharkmanKarate = Vector2.new(0, 0),
		DragonTalon = Vector2.new(1, 5)
	};
	local v494 = Instance.new("Frame", v484);
	v494.BackgroundTransparency = 1;
	v494.Size = UDim2.new(1, 0, 0, 0);
	v494.LayoutOrder = table.find(v473, k);
	v494.AutomaticSize = 2;
	v494.LayoutOrder = 100;
	local v479 = Instance.new("UIGridLayout", v494);
	v479.CellPadding = UDim2.new(0.005, 0, 0.005, 0);
	v479.CellSize = UDim2.new(0, 70, 0, 70);
	v479.FillDirectionMaxCells = 100;
	v479.FillDirection = Enum.FillDirection.Horizontal;
	local v470 = {
		"Superhuman",
		"ElectricClaw",
		"DragonTalon",
		"SharkmanKarate",
		"DeathStep",
		"GodHuman"
	};
	for v843, v844 in pairs(v470) do
		if (v493[v844] and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"   .. v844 , true) == 1)) then
			local v1519 = Instance.new("ImageLabel", v494);
			v1519.Image = "rbxassetid://9945562382";
			v1519.ImageRectSize = Vector2.new(100, 100);
			v1519.ImageRectOffset = v493[v844] * 100 ;
		end
	end
	function formatNumber(v845)
		return tostring(v845):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
	end
	game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0, 800, 0, 500);
	game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0, 800, 0, 550);
	local v505 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone();
	v505.Parent = game:GetService("Players").LocalPlayer.PlayerGui.BubbleChat;
	v505.Position = UDim2.new(0, 800, 0.63, 0);
	local v509 = formatNumber(game.Players.LocalPlayer.Data.Fragments.Value);
	v505.Text = "Ã†â€™"   .. v509 ;
	print("Done");
	pcall(function()
		game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton:Destroy();
	end);
	pcall(function()
		game:GetService("Players").LocalPlayer.PlayerGui.Main.HP:Destroy();
	end);
	pcall(function()
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Energy:Destroy();
	end);
	for v846, v847 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main:GetChildren()) do
		if v847:IsA("ImageButton") then
			v847:Destroy();
		end
	end
	pcall(function()
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass:Destroy();
	end);
end);
v63:Seperator("Đồ Hoạ");
v63:Button("Xoá Sương Mù ( Biển 3 )", function(v511)
	game:GetService("Lighting").LightingLayers:Destroy();
	game:GetService("Lighting").Sky:Destroy();
end);
v63:Toggle("Xoá Sương Mù", RemoveFog, function(v512)
	RemoveFog = v512;
	if  not RemoveFog then
		return;
	end
	while RemoveFog do
		wait();
		game.Lighting.FogEnd = 8999999488;
		if  not RemoveFog then
			game.Lighting.FogEnd = 2500;
		end
	end
end);
v63:Toggle("Loại Bỏ Thiệt Hại", true, function()
	for v849, v850 in pairs(game.Workspace:GetDescendants()) do
		if (v850.Name == "DamageCounter") then
			v850:Destroy();
		end
	end
	for v851, v852 in pairs(game.ReplicatedStorage:GetDescendants()) do
		if (v852.Name == "DamageCounter") then
			v852:Destroy();
		end
	end
end);
v63:Button("Mở Khoá FPS", function()
	setfpscap(9999999);
end);
v63:Button("Giảm Lag", function()
	for v853, v854 in pairs(game.Workspace.Map:GetDescendants()) do
		if ((v854.Name == "Tavern") or (v854.Name == "SmileFactory") or (v854.Name == "Tree") or (v854.Name == "Rocks") or (v854.Name == "PartHouse") or (v854.Name == "Hotel") or (v854.Name == "WallPiece") or (v854.Name == "MiddlePillars") or (v854.Name == "Cloud") or (v854.Name == "PluginGrass") or (v854.Name == "BigHouse") or (v854.Name == "SmallHouse") or (v854.Name == "Detail")) then
			v854:Destroy();
		end
	end
	for v855, v856 in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
		if ((v856.Name == "Tavern") or (v856.Name == "SmileFactory") or (v856.Name == "Tree") or (v856.Name == "Rocks") or (v856.Name == "PartHouse") or (v856.Name == "Hotel") or (v856.Name == "WallPiece") or (v856.Name == "MiddlePillars") or (v856.Name == "Cloud") or (v856.Name == "PluginGrass") or (v856.Name == "BigHouse") or (v856.Name == "SmallHouse") or (v856.Name == "Detail")) then
			v856:Destroy();
		end
	end
	for v857, v858 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if (v858:IsA("Accessory") or (v858.Name == "Pants") or (v858.Name == "Shirt")) then
			v858:Destroy();
		end
	end
	local v513 = true;
	local v514 = game;
	local v515 = v514.Workspace;
	local v516 = v514.Lighting;
	local v517 = v515.Terrain;
	v517.WaterWaveSize = 0;
	v517.WaterWaveSpeed = 0;
	v517.WaterReflectance = 0;
	v517.WaterTransparency = 0;
	v516.GlobalShadows = false;
	v516.FogEnd = 8999999488;
	v516.Brightness = 0;
	settings().Rendering.QualityLevel = "Level01";
	for v859, v860 in pairs(v514:GetDescendants()) do
		if (v860:IsA("Part") or v860:IsA("Union") or v860:IsA("CornerWedgePart") or v860:IsA("TrussPart")) then
			v860.Material = "Plastic";
			v860.Reflectance = 0;
		elseif (v860:IsA("Decal") or (v860:IsA("Texture") and v513)) then
			v860.Transparency = 1;
		elseif (v860:IsA("ParticleEmitter") or v860:IsA("Trail")) then
			v860.Lifetime = NumberRange.new(0);
		elseif v860:IsA("Explosion") then
			v860.BlastPressure = 1;
			v860.BlastRadius = 1;
		elseif (v860:IsA("Fire") or v860:IsA("SpotLight") or v860:IsA("Smoke") or v860:IsA("Sparkles")) then
			v860.Enabled = false;
		elseif v860:IsA("MeshPart") then
			v860.Material = "Plastic";
			v860.Reflectance = 0;
			v860.TextureID = 10385902758728956;
		end
	end
	for v861, v862 in pairs(v516:GetChildren()) do
		if (v862:IsA("BlurEffect") or v862:IsA("SunRaysEffect") or v862:IsA("ColorCorrectionEffect") or v862:IsA("BloomEffect") or v862:IsA("DepthOfFieldEffect")) then
			v862.Enabled = false;
		end
	end
end);
v63:Seperator("Khả năng");
v63:Toggle("Né tránh không có thời gian hồi chiêu", false, function(v526)
	nododgecool = v526;
	NoDodgeCool();
end);
v63:Toggle("Năng lượng vô hạn", false, function(v527)
	InfiniteEnergy = v527;
	v51 = v50.Character.Energy.Value;
end);
v63:Toggle("Tự Động Bậc V3", _G.ActiveV3, function(v529)
	_G.ActiveV3 = v529;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.ActiveV3 then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
			end
		end
	end);
end);
v63:Toggle("Tự Động Bậc V4", _G.ActiveV4, function(v530)
	_G.ActiveV4 = v530;
end);
spawn(function()
	while wait() do
		pcall(function()
			if _G.ActiveV4 then
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game);
			end
		end);
	end
end);
v63:Toggle("Khả năng vô hạn", false, function(v531)
	InfAbility = v531;
	if (value == false) then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy();
	end
end);
spawn(function()
	while wait() do
		if InfAbility then
			InfAb();
		end
	end
end);
v63:Toggle("Phạm vi quan sát vô hạn", getgenv().InfiniteObRange, function(v532)
	getgenv().InfiniteObRange = v532;
	local v534 = game:GetService("Players").LocalPlayer.VisionRadius.Value;
	while getgenv().InfiniteObRange do
		wait();
		local v863 = game:GetService("Players").LocalPlayer;
		local v864 = v863.Character;
		local v865 = v863.VisionRadius;
		if v863 then
			if (v864.Humanoid.Health <= 0) then
				wait(5);
			end
			v865.Value = math.huge;
		elseif ((getgenv().InfiniteObRange == false) and v863) then
			v865.Value = v534;
		end
	end
end);
v63:Toggle("Geppo vô hạn", getgenv().InfGeppo, function(v535)
	getgenv().InfGeppo = v535;
end);
spawn(function()
	while wait() do
		pcall(function()
			if getgenv().InfGeppo then
				for v1678, v1679 in next, getgc() do
					if game:GetService("Players").LocalPlayer.Character.Geppo then
						if ((typeof(v1679) == "function") and (getfenv(v1679).script == game:GetService("Players").LocalPlayer.Character.Geppo)) then
							for v2307, v2308 in next, getupvalues(v1679) do
								if (tostring(v2307) == "9") then
									repeat
										wait(0.1);
										setupvalue(v1679, v2307, 0);
									until  not getgenv().InfGeppo or (game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0)
								end
							end
						end
					end
				end
			end
		end);
	end
end);
v63:Toggle("vô hạn Soru", _G.Infsoru, function(v537)
	_G.Infsoru = v537;
end);
spawn(function()
	while wait() do
		pcall(function()
			if (_G.Infsoru and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil)) then
				for v1680, v1681 in next, getgc() do
					if game:GetService("Players").LocalPlayer.Character.Soru then
						if ((typeof(v1681) == "function") and (getfenv(v1681).script == game:GetService("Players").LocalPlayer.Character.Soru)) then
							for v2309, v2310 in next, getupvalues(v1681) do
								if (typeof(v2310) == "table") then
									repeat
										wait(0.1);
										v2310.LastUse = 0;
									until  not _G.Infsoru or (game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0)
								end
							end
						end
					end
				end
			end
		end);
	end
end);
v63:Toggle("Đi Trên Nước", true, function(v538)
	_G.WalkWater = v538;
end);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.WalkWater then
				game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000);
			else
				game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000);
			end
		end);
	end
end);
v63:Toggle("Xuyên Tường", _G.NoClip, function(v539)
	_G.NoClip = v539;
end);
spawn(function()
	while wait() do
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 100);
		end
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true);
			game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge , (((((((((math.huge * math.huge * 0) / 0) * 0) / 0) * 0) / 0) * 0) / 0) * 0) / 0 ;
		end
	end
end);
v63:Button("Xoá Dung Nham", function()
	for v866, v867 in pairs(game.Workspace:GetDescendants()) do
		if (v867.Name == "Lava") then
			v867:Destroy();
		end
	end
	for v868, v869 in pairs(game.ReplicatedStorage:GetDescendants()) do
		if (v869.Name == "Lava") then
			v869:Destroy();
		end
	end
end);
local v98 = v62:Label("Người Chơi");
spawn(function()
	while wait() do
		pcall(function()
			for v1530, v1531 in pairs(game:GetService("Players"):GetPlayers()) do
				if (v1530 == 12) then
					v98:Set("Players:"   .. " "   .. v1530   .. " "   .. "/"   .. " "   .. "12"   .. " "   .. "(Max)" );
				elseif (v1530 == 1) then
					v98:Set("Player:"   .. " "   .. v1530   .. " "   .. "/"   .. " "   .. "12" );
				else
					v98:Set("Players:"   .. " "   .. v1530   .. " "   .. "/"   .. " "   .. "12" );
				end
			end
		end);
	end
end);
Playerslist = {};
for v540, v541 in pairs(game:GetService("Players"):GetChildren()) do
	table.insert(Playerslist, v541.Name);
end
local v99 = v62:Dropdown("Chọn Người Chơi", Playerslist, function(v542)
	_G.SelectPly = v542;
end);
v62:Button("Làm Mới Người Chơi", function()
	Playerslist = {};
	v99:Clear();
	for v870, v871 in pairs(game:GetService("Players"):GetChildren()) do
		v99:Add(v871.Name);
	end
end);
v62:Toggle("Quan Sát Người Chơi", false, function(v543)
	SpectatePlys = v543;
	local v544 = game:GetService("Players").LocalPlayer.Character.Humanoid;
	local v545 = game:GetService("Players"):FindFirstChild(_G.SelectPly);
	repeat
		wait(0.1);
		game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid;
	until SpectatePlys == false
	game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid;
end);
v62:Toggle("Bay Đến Người Chơi", false, function(v548)
	_G.TeleportPly = v548;
	pcall(function()
		if _G.TeleportPly then
			repeat
				topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame);
				wait();
			until _G.TeleportPly == false
		end
		StopTween(_G.TeleportPly);
	end);
end);
v62:Toggle("Bay Đến Người Chơi Bypass", false, function(v549)
	_G.Teleport = v549;
	if (_G.Teleport == false) then
		game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1);
	end
	while _G.Teleport do
		task.wait();
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0) ;
		game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
		game:GetService("VirtualUser"):CaptureController();
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
	end
end);
v62:Seperator("Nhiệm Vụ");
v62:Button("Nhận Nhiệm Vụ Thợ Săn", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter");
end);
v62:Toggle("Giết Người Chơi Nhận Nhiệm Vụ", _G.PlayerHunter, function(v550)
	_G.PlayerHunter = v550;
	StopTween(_G.PlayerHunter);
end);
spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.PlayerHunter then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11);
				end
			end
		end);
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.PlayerHunter then
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp");
				end
			end
		end
	end);
end);
spawn(function()
	while wait() do
		if _G.PlayerHunter then
			if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
				wait(0.5);
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter");
			else
				for v1717, v1718 in pairs(game:GetService("Workspace").Characters:GetChildren()) do
					if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v1718.Name) then
						repeat
							wait();
							if  not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
								local v2353 = {
									[1] = "Buso"
								};
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v2353));
							end
							EquipWeapon(_G.SelectWeapon);
							Useskill = true;
							topos(v1718.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3) );
							v1718.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
							game:GetService("VirtualUser"):CaptureController();
							game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
						until (_G.PlayerHunter == false) or (v1718.Humanoid.Health <= 0)
						Useskill = false;
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
					end
				end
			end
		end
	end
end);
spawn(function()
	while wait() do
		pcall(function()
			if Useskill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game);
				wait(0.1);
				game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game);
			end
		end);
	end
end);
v62:Seperator("PvP");
v62:Toggle("Aimbot gần nhất", false, function(v551)
	_G.AimNearest = v551;
end);
local v4 = game:GetService("Players");
local v50 = v4.LocalPlayer;
local v100 = game:GetService("RunService");
local function v101()
	local v552 = nil;
	local v553 = math.huge;
	for v876, v877 in pairs(v4:GetPlayers()) do
		if ((v877 ~= v50) and v877.Character and v877.Character:FindFirstChild("HumanoidRootPart")) then
			if ((v877.Team ~= v50.Team) and (v877.Team.Name ~= "Marines")) then
				local v1682 = v877.Character.HumanoidRootPart.Position;
				local v1683 = (v50.Character.HumanoidRootPart.Position - v1682).Magnitude;
				if (v1683 < v553) then
					v552 = v877;
					v553 = v1683;
				end
			end
		end
	end
	return v552;
end
v100.RenderStepped:Connect(function()
	if _G.AimNearest then
		local v1420 = v101();
		if v1420 then
			_G.Aim_Players = v1420;
		end
	end
end);
local v102 = getrawmetatable(game);
local v103 = v102.__namecall;
setreadonly(v102, false);
v102.__namecall = newcclosure(function(...)
	local v554 = getnamecallmethod();
	local v555 = {
		...
	};
	if (tostring(v554) == "FireServer") then
		if (tostring(v555[1]) == "RemoteEvent") then
			if ((tostring(v555[2]) ~= "true") and (tostring(v555[2]) ~= "false")) then
				if (_G.AimNearest and _G.Aim_Players) then
					v555[2] = _G.Aim_Players.Character.HumanoidRootPart.Position;
					return v103(unpack(v555));
				end
			end
		end
	end
	return v103(...);
end);
setreadonly(v102, true);
v62:Toggle("Enabled PvP", false, function(v556)
	_G.EnabledPvP = v556;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.EnabledPvP then
				if (game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp");
				end
			end
		end
	end);
end);
v62:Button("Đặt vị trí Hồi Sinh", function()
	_G.Pos_Spawn = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
	Com();
end);
v62:Toggle("Chế độ an toàn", false, function(v558)
	_G.Safe_Mode = v558;
	StopTween(_G.Safe_Mode);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Safe_Mode then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame;
			end
		end
	end);
end);
v62:Button("hồi sinh", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
	wait();
end);
v62:Seperator("Thống kê");
local v105 = v62:Label("Điểm chỉ số");
spawn(function()
	while wait() do
		pcall(function()
			v105:Set("Điểm chỉ số: "   .. tostring(game:GetService("Players")['LocalPlayer'].Data.Points.Value) );
		end);
	end
end);
local v106 = v62:Label("Võ: ");
local v107 = v62:Label("Phòng Thủ: ");
local v108 = v62:Label("Kiếm: ");
local v109 = v62:Label("Súng: ");
local v110 = v62:Label("Trái: ");
spawn(function()
	while wait() do
		pcall(function()
			v106:Set("Võ: "   .. game.Players.localPlayer.Data.Stats.Melee.Level.Value );
		end);
	end
end);
spawn(function()
	while wait() do
		pcall(function()
			v107:Set("Phòng Thủ: "   .. game.Players.localPlayer.Data.Stats.Defense.Level.Value );
		end);
	end
end);
spawn(function()
	while wait() do
		pcall(function()
			v108:Set("Kiếm: "   .. game.Players.localPlayer.Data.Stats.Sword.Level.Value );
		end);
	end
end);
spawn(function()
	while wait() do
		pcall(function()
			v109:Set("Súng: "   .. game.Players.localPlayer.Data.Stats.Gun.Level.Value );
		end);
	end
end);
spawn(function()
	while wait() do
		pcall(function()
			v110:Set("Trái: "   .. game.Players.localPlayer.Data.Stats["Demon Fruit"].Level.Value );
		end);
	end
end);
v62:Toggle("Tự Động Nâng Chỉ Số", _G.Stats_Kaitun, function(v559)
	_G.Stats_Kaitun = v559;
end);
spawn(function()
	while wait() do
		pcall(function()
			if _G.Stats_Kaitun then
				if World1 then
					local v1719 = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = _G.Point
					};
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1719));
				elseif World2 then
					local v2111 = {
						[1] = "AddPoint",
						[2] = "Melee",
						[3] = _G.Point
					};
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v2111));
					local v2111 = {
						[1] = "AddPoint",
						[2] = "Defense",
						[3] = _G.Point
					};
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v2111));
				end
			end
		end);
	end
end);
v62:Toggle("Võ", false, function(v560)
	melee = v560;
end);
v62:Toggle("Phòng Thủ", false, function(v561)
	defense = v561;
end);
v62:Toggle("Kiếm", false, function(v562)
	sword = v562;
end);
v62:Toggle("Súng", false, function(v563)
	gun = v563;
end);
v62:Toggle("Trái Ác Quỷ", false, function(v564)
	demonfruit = v564;
end);
PointStats = 100;
spawn(function()
	while wait() do
		if (game.Players.localPlayer.Data.Points.Value >= PointStats) then
			if melee then
				local v1684 = {
					[1] = "AddPoint",
					[2] = "Võ",
					[3] = PointStats
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1684));
			end
			if defense then
				local v1685 = {
					[1] = "AddPoint",
					[2] = "Phòng Thủ",
					[3] = PointStats
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1685));
			end
			if sword then
				local v1686 = {
					[1] = "AddPoint",
					[2] = "Kiếm",
					[3] = PointStats
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1686));
			end
			if gun then
				local v1687 = {
					[1] = "AddPoint",
					[2] = "Súng",
					[3] = PointStats
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1687));
			end
			if demonfruit then
				local v1688 = {
					[1] = "AddPoint",
					[2] = "Trái Ác Quỷ",
					[3] = PointStats
				};
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1688));
			end
		end
	end
end);
v64:Seperator("Tập Kích");
_G.SelectChip = selectraids or "" ;
Raidslist = {};
RaidsModule = require(game.ReplicatedStorage.Raids);
for v565, v566 in pairs(RaidsModule.raids) do
	table.insert(Raidslist, v566);
end
for v567, v568 in pairs(RaidsModule.advancedRaids) do
	table.insert(Raidslist, v568);
end
v64:Dropdown("Chọn Chip", Raidslist, function(v569)
	_G.SelectChip = v569;
end);
v64:Toggle("Tự động chọn Đột Kích", _G.SelectDungeon, function(v570)
	_G.SelectDungeon = v570;
end);
spawn(function()
	while wait() do
		if _G.SelectDungeon then
			pcall(function()
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame")) then
					_G.SelectChip = "Flame";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice")) then
					_G.SelectChip = "Ice";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake")) then
					_G.SelectChip = "Quake";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light")) then
					_G.SelectChip = "Light";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark")) then
					_G.SelectChip = "Dark";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String")) then
					_G.SelectChip = "String";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble")) then
					_G.SelectChip = "Rumble";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma")) then
					_G.SelectChip = "Magma";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit")) then
					_G.SelectChip = "Human: Buddha";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand")) then
					_G.SelectChip = "Sand";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix")) then
					_G.SelectChip = "Bird: Phoenix";
				elseif (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough")) then
					_G.SelectChip = "Dough";
				else
					_G.SelectChip = "Flame";
				end
			end);
		end
	end
end);
v64:Toggle("Mua Chip Tự Động", _G.BuyChip, function(v571)
	_G.BuyChip = v571;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.BuyChip then
				if ( not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
					if  not game:GetService("Workspace")['_WorldOrigin'].Locations:FindFirstChild("Island 1") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip);
					end
				end
			end
		end
	end);
end);
v64:Button("Mua Chip Đã Chọn", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip);
end);
v64:Toggle("Tự Động Bắt Đầu Đột Kích", _G.StartRaid, function(v572)
	_G.StartRaid = v572;
end);
spawn(function()
	while wait(0.1) do
		pcall(function()
			if _G.StartRaid then
				if (game:GetService("Players")['LocalPlayer'].PlayerGui.Main.Timer.Visible == false) then
					if (( not game:GetService("Workspace")['_WorldOrigin'].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip")) or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
						if World2 then
							fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
						elseif World3 then
							fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
						end
					end
				end
			end
		end);
	end
end);
v64:Button("Bắt Đầu Đột Kích", function()
	if World2 then
		fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
	elseif World3 then
		fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
	end
end);
v64:Toggle("Tự Động Đảo Tiếp Theo", _G.Dungeon, function(v573)
	_G.Dungeon = v573;
	StopTween(_G.Dungeon);
end);
function IsIslandRaid(v574)
	if game:GetService("Workspace")['_WorldOrigin'].Locations:FindFirstChild("Island "   .. v574 ) then
		min = 4500;
		for v1532, v1533 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
			if ((v1533.Name == ("Island "   .. v574)) and ((v1533.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min)) then
				min = (v1533.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
			end
		end
		for v1534, v1535 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
			if ((v1535.Name == ("Island "   .. v574)) and ((v1535.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min)) then
				return v1535;
			end
		end
	end
end
function getNextIsland()
	TableIslandsRaid = {
		5,
		4,
		3,
		2,
		1
	};
	for v878, v879 in pairs(TableIslandsRaid) do
		if (IsIslandRaid(v879) and ((IsIslandRaid(v879).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500)) then
			return IsIslandRaid(v879);
		end
	end
end
spawn(function()
	while wait() do
		if _G.Dungeon then
			if getNextIsland() then
				spawn(topos(getNextIsland().CFrame * CFrame.new(0, 60, 0) ), 1);
			end
		end
	end
end);
v64:Toggle("Giết Quái Xung Quanh", nil, function(v575)
	_G.Kill_Aura = v575;
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.Kill_Aura then
				local v1615 = game:GetService("Players").LocalPlayer;
				local v1616 = game:GetService("Workspace").Enemies:GetChildren();
				local v1617 = v1615.Character and v1615.Character:FindFirstChild("HumanoidRootPart") and v1615.Character.HumanoidRootPart.Position ;
				if v1617 then
					for v1909, v1910 in pairs(v1616) do
						if (v1910:FindFirstChild("Humanoid") and v1910:FindFirstChild("HumanoidRootPart") and (v1910.Humanoid.Health > 0)) then
							local v2246 = (v1910.HumanoidRootPart.Position - v1617).Magnitude;
							if (v2246 <= 1000) then
								pcall(function()
									repeat
										wait();
										sethiddenproperty(v1615, "SimulationRadius", math.huge);
										v1910.Humanoid.Health = 0;
										v1910.HumanoidRootPart.CanCollide = false;
									until  not _G.Kill_Aura or  not v1910.Parent or (v1910.Humanoid.Health <= 0)
								end);
							end
						end
					end
				end
			end
		end
	end);
end);
v64:Toggle("Tự động thức Tỉnh", _G.Awakener, function(v576)
	_G.Awakener = v576;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.Awakener then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken");
			end
		end
	end);
end);
if World2 then
	v64:Button("Dịch chuyển đến phòng thí nghiệm", function()
		topos(CFrame.new( -6438.73535, 250.645355, -4501.50684));
	end);
elseif World3 then
	v64:Button("Dịch chuyển đến phòng thí nghiệm", function()
		topos(CFrame.new( -5017.40869, 314.844055, -2823.0127, -0.925743818, 4.482175e-8, -0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, -0.925743818));
	end);
end
if World2 then
	v64:Button("Phòng thức tỉnh", function()
		topos(CFrame.new(266.227783, 1.39509034, 1857.00732));
	end);
elseif World3 then
	v64:Button("Phòng thức tỉnh", function()
		topos(CFrame.new( -11571.440429688, 49.172668457031, -7574.7368164062));
	end);
end
v64:Seperator("Kiếm KoKo");
v64:Toggle("Đánh Law", _G.OderSword, function(v577)
	_G.OderSword = v577;
	StopTween(_G.OderSword);
end);
v64:Toggle("Đánh Law Đổi Sever", _G.OderSwordHop, function(v578)
	_G.OderSwordHop = v578;
end);
spawn(function()
	while wait() do
		if _G.OderSword then
			pcall(function()
				if game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
					for v1911, v1912 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if (v1912.Name == "Order [Lv. 1250] [Raid Boss]") then
							if (v1912:FindFirstChild("Humanoid") and v1912:FindFirstChild("HumanoidRootPart") and (v1912.Humanoid.Health > 0)) then
								repeat
									task.wait();
									AutoHaki();
									EquipWeapon(_G.SelectWeapon);
									v1912.HumanoidRootPart.CanCollide = false;
									v1912.Humanoid.WalkSpeed = 0;
									v1912.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
									topos(v1912.HumanoidRootPart.CFrame * Pos );
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
								until  not _G.OderSword or  not v1912.Parent or (v1912.Humanoid.Health <= 0)
							end
						end
					end
				elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") then
					topos(game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2) );
				elseif _G.OderSwordHop then
					Hop();
				end
			end);
		end
	end
end);
v64:Button("Mua Chip Law", function()
	local v579 = {
		[1] = "BlackbeardReward",
		[2] = "Microchip",
		[3] = "2"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v579));
end);
v64:Button("Bắt Đầu Vào Đánh", function()
	if World2 then
		fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector);
	end
end);
v65:Seperator("Thế Giới");
v65:Button("Dịch chuyển đến Biển 1", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain");
end);
v65:Button("Dịch chuyển đến Biển 2", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
end);
v65:Button("Dịch chuyển đến Biển 3", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
end);
v65:Seperator("Dịch chuyển nhanh");
if World1 then
	v65:Dropdown("Chọn Đảo", {
		"Đảo Trời 1",
		"Đảo Trời 2",
		"Đảo dưới nước",
		"Lối vào Đảo Dưới Nước"
	}, function(v1421)
		_G.SelectFast = v1421;
	end);
end
if World2 then
	v65:Dropdown("Chọn Đảo", {
		"Biệt thự Flamingo",
		"Phòng Flamingo",
		"Con tàu bị nguyền rủa",
		"Đảo thây ma"
	}, function(v1422)
		_G.SelectFast = v1422;
	end);
end
if World3 then
	v65:Dropdown("Chọn Đảo", {
		"Dinh Thự",
		"Đảo Hydra",
		"Pháo đài trên biển",
		"Đảo rùa",
		"Cướp biển xinh đẹp"
	}, function(v1423)
		_G.SelectFast = v1423;
	end);
end
v65:Toggle("Dịch Chuyển Đến Đảo Đã Chỉ Định", false, function(v580)
	_G.TeleFast = v580;
	if (_G.TeleFast == true) then
		repeat
			wait();
			if (_G.SelectFast == "Đảo Trời 1") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -4652, 873, -1754));
			elseif (_G.SelectFast == "Đảo Trời 2") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -7895, 5547, -380));
			elseif (_G.SelectFast == "Đảo dưới nước") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61164, 5, 1820));
			elseif (_G.SelectFast == "Lối vào Đảo Dưới Nước") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3865, 5, -1926));
			elseif (_G.SelectFast == "Biệt thự Flamingo") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -317, 331, 597));
			elseif (_G.SelectFast == "Phòng Flamingo") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2283, 15, 867));
			elseif (_G.SelectFast == "Con tàu bị nguyền rủa") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923, 125, 32853));
			elseif (_G.SelectFast == "Đảo thây ma") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -6509, 83, -133));
			elseif (_G.SelectFast == "Dinh Thự") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -12471, 374, -7551));
			elseif (_G.SelectFast == "Đảo Hydra") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5756, 610, -282));
			elseif (_G.SelectFast == "Pháo đài trên biển") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -5092, 315, -3130));
			elseif (_G.SelectFast == "Đảo rùa") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new( -12001, 332, -8861));
			elseif (_G.SelectFast == "Cướp biển xinh đẹp") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5319, 23, -93));
			end
		until  not _G.TeleFast
	end
end);
v65:Seperator("đảo");
if World1 then
	v65:Dropdown("Chọn Đảo", {
		"Cối xay gió",
		"Hàng hải",
		"Trung tâm thị trấn",
		"Rừng",
		"Làng cướp biển",
		"Sa mạc",
		"Đảo Tuyết",
		"Ford hàng hải",
		"Đấu trường La Mã",
		"Đảo Trời 1",
		"Đảo Trời 2",
		"Đảo Trời 3",
		"Nhà tù",
		"Làng Magma",
		"Đảo dưới nước",
		"Thành phố đài phun nước"
	}, function(v1424)
		_G.SelectIsland = v1424;
	end);
end
if World2 then
	v65:Dropdown("Chọn Đảo", {
		"Quán cà phê",
		"Đốm đầu tiên",
		"Đảo Râu Đen",
		"Biệt thự Flamingo",
		"Phòng Flamingo",
		"Khu vực xanh",
		"Đảo thây ma",
		"Hai ngọn núi tuyết",
		"Punk nguy hiểm",
		"Con tàu bị nguyền rủa",
		"Lâu đài băng",
		"Đảo bị lãng quên",
		"Đảo Ussop"
	}, function(v1425)
		_G.SelectIsland = v1425;
	end);
end
if World3 then
	v65:Dropdown("Chọn Đảo", {
		"Dinh Thự",
		"Cảng",
		"Cây lớn",
		"Pháo đài trên biển",
		"Đảo Hydra",
		"Đảo rùa",
		"Đảo Xương",
		"Đảo kem",
		"Đảo Đậu Phộng",
		"Đảo Bánh",
		"Đảo kẹo mía",
		"Doanh Trại Tiki"
	}, function(v1426)
		_G.SelectIsland = v1426;
	end);
end
v65:Toggle("Bay Đến Đảo Đã Chọn", false, function(v581)
	_G.TeleportIsland = v581;
	if (_G.TeleportIsland == true) then
		repeat
			wait();
			if (_G.SelectIsland == "Trung tâm thị trấn") then
				topos(CFrame.new( -688, 15, 1585));
			elseif (_G.SelectIsland == "Ford hàng hải") then
				topos(CFrame.new( -4810, 21, 4359));
			elseif (_G.SelectIsland == "Hàng hải") then
				topos(CFrame.new( -2728, 25, 2056));
			elseif (_G.SelectIsland == "Cối xay gió") then
				topos(CFrame.new(889, 17, 1434));
			elseif (_G.SelectIsland == "Sa mạc") then
				topos(CFrame.new(945, 21, 4375));
			elseif (_G.SelectIsland == "Đảo Tuyết") then
				topos(CFrame.new(1298, 87, -1344));
			elseif (_G.SelectIsland == "Làng cướp biển") then
				topos(CFrame.new( -1173, 45, 3837));
			elseif (_G.SelectIsland == "Rừng") then
				topos(CFrame.new( -1614, 37, 146));
			elseif (_G.SelectIsland == "Nhà tù") then
				topos(CFrame.new(4870, 6, 736));
			elseif (_G.SelectIsland == "Đảo dưới nước") then
				topos(CFrame.new(61164, 5, 1820));
			elseif (_G.SelectIsland == "Đấu trường La Mã") then
				topos(CFrame.new( -1535, 7, -3014));
			elseif (_G.SelectIsland == "Làng Magma") then
				topos(CFrame.new( -5290, 9, 8349));
			elseif (_G.SelectIsland == "Đảo Trời 1") then
				topos(CFrame.new( -4814, 718, -2551));
			elseif (_G.SelectIsland == "Đảo Trời 2") then
				topos(CFrame.new( -4652, 873, -1754));
			elseif (_G.SelectIsland == "Đảo trời 3") then
				topos(CFrame.new( -7895, 5547, -380));
			elseif (_G.SelectIsland == "Thành phố đài phun nước") then
				topos(CFrame.new(5128, 60, 4106));
			elseif (_G.SelectIsland == "Quán cà phê") then
				topos(CFrame.new( -382, 73, 290));
			elseif (_G.SelectIsland == "Đốm đầu tiên") then
				topos(CFrame.new( -11, 29, 2771));
			elseif (_G.SelectIsland == "Đảo Râu Đen") then
				topos(CFrame.new(3494, 13, -3259));
			elseif (_G.SelectIsland == "Biệt thự Flamingo") then
				topos(CFrame.new( -317, 331, 597));
			elseif (_G.SelectIsland == "Phòng Flamingo") then
				topos(CFrame.new(2285, 15, 905));
			elseif (_G.SelectIsland == "Khu vực xanh") then
				topos(CFrame.new( -2258, 73, -2696));
			elseif (_G.SelectIsland == "Đảo thây ma") then
				topos(CFrame.new( -5552, 194, -776));
			elseif (_G.SelectIsland == "Hai ngọn núi tuyết") then
				topos(CFrame.new(752, 408, -5277));
			elseif (_G.SelectIsland == "Punk nguy hiểm") then
				topos(CFrame.new( -5897, 18, -5096));
			elseif (_G.SelectIsland == "Con tàu bị nguyền rủa") then
				topos(CFrame.new(919, 125, 32869));
			elseif (_G.SelectIsland == "Lâu đài băng") then
				topos(CFrame.new(5505, 40, -6178));
			elseif (_G.SelectIsland == "Đảo bị lãng quên") then
				topos(CFrame.new( -3050, 240, -10178));
			elseif (_G.SelectIsland == "Đảo Ussop") then
				topos(CFrame.new(4816, 8, 2863));
			elseif (_G.SelectIsland == "Dinh Thự") then
				topos(CFrame.new( -12471, 374, -7551));
			elseif (_G.SelectIsland == "Cảng") then
				topos(CFrame.new( -334, 7, 5300));
			elseif (_G.SelectIsland == "Pháo đài trên biển") then
				topos(CFrame.new( -5073, 315, -3153));
			elseif (_G.SelectIsland == "Đảo Hydra") then
				topos(CFrame.new(5756, 610, -282));
			elseif (_G.SelectIsland == "Cây lớn") then
				topos(CFrame.new(2681, 1682, -7190));
			elseif (_G.SelectIsland == "Đảo rùa") then
				topos(CFrame.new( -12528, 332, -8658));
			elseif (_G.SelectIsland == "Đảo Xương") then
				topos(CFrame.new( -9517, 142, 5528));
			elseif (_G.SelectIsland == "Đảo kem") then
				topos(CFrame.new( -902, 79, -10988));
			elseif (_G.SelectIsland == "Đảo Đậu Phộng") then
				topos(CFrame.new( -2062, 50, -10232));
			elseif (_G.SelectIsland == "Đảo Bánh") then
				topos(CFrame.new( -1897, 14, -11576));
			elseif (_G.SelectIsland == "Đảo kẹo mía") then
				topos(CFrame.new( -1038, 10, -14076));
			elseif (_G.SelectIsland == "Doanh Trại Tiki") then
				topos(CFrame.new( -16224, 9, 439));
			end
		until  not _G.TeleportIsland
	end
	StopTween(_G.TeleportIsland);
end);
v66:Seperator("Khả năng");
v66:Button("Mua Geppo [ 10,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
end);
v66:Button("Mua Haki Vũ Trang [ 25,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
end);
v66:Button("Mua Soru [ 25,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
end);
v66:Button("Mua Haki Quan Sát [ 750,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy");
end);
v66:Toggle("Mua Tất Cả Những Thứ Ở Trên", false, function(v582)
	Abilities = v582;
	while Abilities do
		wait(0.1);
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
	end
end);
v66:Seperator("Phong cách chiến đấu");
v66:Button("Mua Chân Đen V1 [ 150,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
end);
v66:Button("Mua Võ Điện V1 [ 550,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
end);
v66:Button("Mua Võ Người Cá V1 [ 750,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
end);
v66:Button("Mua Hơi Thở Rồng V1 [ 1,500 Fragments ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
end);
v66:Button("Mua Superhuman [ 3,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
end);
v66:Button("Mua Chân Đen V2 [ 5,000 Fragments 5,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
end);
v66:Button("Mua Võ Cá V2 [ 5,000 Fragments 2,500,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
end);
v66:Button("Mua Võ Điện V2 [ 5,000 Fragments 3,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
end);
v66:Button("Mua Võ Rồng V2 [ 5,000 Fragments 3,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
end);
v66:Button("Mua God Human [ 5,000 Fragments 5,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman");
end);
v66:Button("Mua Huyết Quỷ [ 5,000 Fragments $5,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true);
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt");
end);
v66:Seperator(" Kiếm ");
v66:Button("Cutlass [ 1,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
end);
v66:Button("Katana [ 1,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana");
end);
v66:Button("Iron Mace [ 25,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
end);
v66:Button("Dual Katana [ 12,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana");
end);
v66:Button("Triple Katana [ 60,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
end);
v66:Button("Pipe [ 100,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
end);
v66:Button("Dual-Headed Blade [ 400,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
end);
v66:Button("Bisento [ 1,200,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
end);
v66:Button("Soul Cane [ 750,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
end);
v66:Button("Pole v.2 [ 5,000 Fragments ]", function()
	game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk");
end);
v66:Toggle("Yama Sword [ Elite Hunter 30 ]", _G.Yama, function(v583)
	_G.Yama = v583;
end);
spawn(function()
	while wait() do
		if _G.Yama then
			if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30) then
				repeat
					wait(0.1);
					fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector);
				until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or  not _G.Yama
			end
		end
	end
end);
v66:Seperator(" Súng ");
v66:Button("Slingshot [ 5,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot");
end);
v66:Button("Musket [ 8,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket");
end);
v66:Button("Flintlock [ 10,500 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock");
end);
v66:Button("Refined Slingshot [ 30,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock");
end);
v66:Button("Refined Flintlock [ 65,000 Beli ]", function()
	local v584 = {
		[1] = "BuyItem",
		[2] = "Refined Flintlock"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v584));
end);
v66:Button("Cannon [ 100,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon");
end);
v66:Button("Kabucha [ 1,500 Fragments]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1");
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2");
end);
v66:Button("Bizarre Rifle [ 250 Ectoplasm ]", function()
	local v585 = "Ectoplasm";
	local v586 = "Buy";
	local v587 = 1;
	local v588 = game:GetService("ReplicatedStorage").Remotes['CommF_'];
	v588:InvokeServer(v585, v586, v587);
	local v585 = "Ectoplasm";
	local v586 = "Buy";
	local v587 = 1;
	local v588 = game:GetService("ReplicatedStorage").Remotes['CommF_'];
	v588:InvokeServer(v585, v586, v587);
end);
v66:Seperator(" Fragments ");
v66:Button("Đặt lại Chỉ Số ( 2.5K F )", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
end);
v66:Button("Đổi Tộc ( 3K F )", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
end);
v66:Seperator(" Phụ kiện ");
v66:Button("Black Cape [ 50,000 Beli ]", function()
	local v589 = {
		[1] = "BuyItem",
		[2] = "Black Cape"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v589));
end);
v66:Button("Swordsman Hat [ 150k Beli ]", function()
	local v590 = {
		[1] = "BuyItem",
		[2] = "Swordsman Hat"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v590));
end);
v66:Button("Tomoe Ring [ 500k Beli ]", function()
	local v591 = {
		[1] = "BuyItem",
		[2] = "Tomoe Ring"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v591));
end);
v67:Seperator("Trái");
FruitList = {
	"Bomb-Bomb",
	"Spike-Spike",
	"Chop-Chop",
	"Spring-Spring",
	"Kilo-Kilo",
	"Spin-Spin",
	"Bird: Falcon",
	"Smoke-Smoke",
	"Flame-Flame",
	"Ice-Ice",
	"Sand-Sand",
	"Dark-Dark",
	"Revive-Revive",
	"Diamond-Diamond",
	"Light-Light",
	"Love-Love",
	"Rubber-Rubber",
	"Barrier-Barrier",
	"Magma-Magma",
	"Door-Door",
	"Quake-Quake",
	"Human-Human: Buddha",
	"String-String",
	"Bird-Bird: Phoenix",
	"Rumble-Rumble",
	"Paw-Paw",
	"Gravity-Gravity",
	"Dough-Dough",
	"Venom-Venom",
	"Shadow-Shadow",
	"Control-Control",
	"Soul-Soul",
	"Dragon-Dragon",
	"Leopard-Leopard"
};
local v111 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {};
ShopDevilSell = {};
for v592, v593 in next, v111 do
	table.insert(Table_DevilFruitSniper, v593.Name);
	if v593.OnSale then
		table.insert(ShopDevilSell, v593.Name);
	end
end
_G.SelectFruit = "";
v67:Dropdown("Chọn Trái", Table_DevilFruitSniper, function(v594)
	_G.SelectFruit = v594;
end);
v67:Toggle("Mua Trái Đã Chọn", _G.BuyFruitSniper, function(v595)
	_G.BuyFruitSniper = v595;
end);
v67:Seperator("khác");
v67:Dropdown("Chọn Trái", Table_DevilFruitSniper, function(v596)
	_G.SelectFruitEat = v596;
end);
v67:Toggle("Ăn Trái Đã Chọn", _G.EatFruit, function(v597)
	_G.EatFruit = v597;
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.EatFruit then
				game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer();
			end
		end
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.1) do
			if _G.BuyFruitSniper then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits");
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", "_G.SelectFruit", false);
			end
		end
	end);
end);
v67:Button("Quay Trái Ác Quỷ", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy");
end);
v67:Button("Mở Shop Trái", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits");
	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true;
end);
v67:Toggle("Tự Động Lưu Trái", _G.StoreFruit, function(v599)
	_G.StoreFruit = v599;
end);
spawn(function()
	while wait() do
		if _G.StoreFruit then
			pcall(function()
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Kilo-Kilo", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Falcon", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Revive-Revive", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Door Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Human-Human: Buddha", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "String-String", game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Phoenix", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Paw-Paw", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") );
				end
				if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") );
				end
			end);
		end
	end
end);
v67:Toggle("Dịch Chuyển Đến Trái", _G.Grabfruit, function(v600)
	_G.Grabfruit = v600;
end);
spawn(function()
	while wait(0.1) do
		if _G.Grabfruit then
			for v1618, v1619 in pairs(game.Workspace:GetChildren()) do
				if v1619:IsA("Tool") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1619.Handle.CFrame;
				end
			end
		end
	end
end);
v67:Toggle("Bay Đến Trái", _G.Tweenfruit, function(v601)
	_G.Tweenfruit = v601;
	StopTween(_G.Tweenfruit);
end);
spawn(function()
	while wait() do
		if _G.Tweenfruit then
			for v1620, v1621 in pairs(game.Workspace:GetChildren()) do
				if v1621:IsA("Tool") then
					topos(v1621.Handle.CFrame);
				end
			end
		end
	end
end);
v68:Seperator("Máy Chủ");
v68:Button("Vào Lại Máy Chủ", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
end);
v68:Button("Đổi Máy Chủ", function()
	Hop();
end);
v68:Button("Đổi Máy Chủ Ít Người", function()
	getgenv().AutoTeleport = true;
	getgenv().DontTeleportTheSameNumber = true;
	getgenv().CopytoClipboard = false;
	if  not game:IsLoaded() then
		print("Game is loading waiting...");
	end
	local v605 = math.huge;
	local v606;
	local v607;
	local v608 = "https://games.roblox.com/v1/games/"   .. game.PlaceId   .. "/servers/Public?sortOrder=Asc&limit=100" ;
	function serversearch()
		for v1427, v1428 in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(v608)).data) do
			if ((type(v1428) == "table") and (v1428.playing ~= nil) and (v605 > v1428.playing)) then
				v606 = v1428.maxPlayers;
				v605 = v1428.playing;
				v607 = v1428.id;
			end
		end
	end
	function getservers()
		serversearch();
		for v1429, v1430 in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(v608))) do
			if (v1429 == "nextPageCursor") then
				if v608:find("&cursor=") then
					local v1722 = v608:find("&cursor=");
					local v1723 = v608:sub(v1722);
					v608 = v608:gsub(v1723, "");
				end
				v608 = v608   .. "&cursor="   .. v1430 ;
				getservers();
			end
		end
	end
	getservers();
	if AutoTeleport then
		if DontTeleportTheSameNumber then
			if (( #game:GetService("Players"):GetPlayers() - 4) == v605) then
				return warn("It has same number of players (except you)");
			elseif (v607 == game.JobId) then
				return warn("Your current server is the most empty server atm");
			end
		end
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v607);
	end
end);
v68:Button("Sao chép Id Máy Chủ", function()
	setclipboard(tostring(game.JobId));
end);
v68:Textbox("Nhập Id Máy Chủ", true, function(v609)
	_G.Job = v609;
end);
v68:Button("Vào Máy Chủ Đã Nhập Id", function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer);
end);
v68:Seperator("linh tinh");
v68:Button("Mở Tilte", function()
	local v610 = {
		[1] = "getTitles"
	};
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v610));
	game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true;
end);
v68:Button("Mở Haki Màu", function()
	game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true;
end);
v68:Seperator("Đội");
v68:Button("Tham gia đội Hải Tặc", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
end);
v68:Button("Tham gia đội Thủy quân lục chiến", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
end);
v68:Toggle("Chống AFK", true, function()
	local v613 = game:GetService("VirtualUser");
	repeat
		wait();
	until game:IsLoaded()
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new());
		v613:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
		wait(1);
		v613:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	end);
end);
v68:Seperator("Mã");
local v112 = {
	"KITTGAMING",
	"ENYU_IS_PRO",
	"FUDD10",
	"BIGNEWS",
	"THEGREATACE",
	"SUB2GAMERROBOT_EXP1",
	"STRAWHATMAIME",
	"SUB2OFFICIALNOOBIE",
	"SUB2NOOBMASTER123",
	"SUB2DAIGROCK",
	"AXIORE",
	"TANTAIGAMIMG",
	"STRAWHATMAINE",
	"JCWK",
	"FUDD10_V2",
	"SUB2FER999",
	"MAGICBIS",
	"TY_FOR_WATCHING",
	"STARCODEHEO"
};
v68:Button("Nhập Tất Cả Mã", function()
	function RedeemCode(v880)
		game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v880);
	end
	for v881, v882 in pairs(v112) do
		RedeemCode(v882);
	end
end);
v68:Dropdown("Chọn Mã Reset Chỉ Số", {
	"NOOB_REFUND",
	"SUB2GAMERROBOT_RESET1",
	"Sub2UncleKizaru"
}, function(v614)
	_G.CodeSelect = v614;
end);
v68:Button("Nhập Mã Đã Chọn", function()
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeSelect);
end);
v68:Seperator("Tình trạng");
v68:Dropdown("Chọn trạng thái Haki", {
	"Tình trạng 0",
	"Tình trạng 1",
	"Tình trạng 2",
	"Tình trạng 3",
	"Tình trạng 4",
	"Tình trạng 5"
}, function(v615)
	_G.SelectStateHaki = v615;
end);
v68:Button("Thay đổi trạng thái Haki", function()
	if (_G.SelectStateHaki == "Tình trạng 0") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 0);
	elseif (_G.SelectStateHaki == "Tình trạng 1") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 1);
	elseif (_G.SelectStateHaki == "Tình trạng 2") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 2);
	elseif (_G.SelectStateHaki == "Tình trạng 3") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 3);
	elseif (_G.SelectStateHaki == "Tình trạng 4") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 4);
	elseif (_G.SelectStateHaki == "Tình trạng 5") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 5);
	end
end);
local v113 = require(game.ReplicatedStorage.Util.CameraShaker);
v113:Stop();
local v114 = game:GetService("Players");
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Trẩu Roblox",
	Text = "Đã tải xong",
	Icon = "rbxthumb://type=Asset&id=138689078158833&w=150&h=150",
	Duration = 10
});
