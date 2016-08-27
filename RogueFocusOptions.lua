----------------------------------------------------------------------------------------------------
-- Rogue Focus: Options
----------------------------------------------------------------------------------------------------
RogueFocusOptions = { };

local _G = getfenv(0);

----------------------------------------------------------------------------------------------------
-- Widgets Handlers
----------------------------------------------------------------------------------------------------
function RogueFocusOptions:Handler()
	if(RogueFocusOptionsFrame:IsVisible()) then
		HideUIPanel(RogueFocusOptionsFrame);
	else
		ShowUIPanel(RogueFocusOptionsFrame);
	end
end

----------------------------------------------------------------------------------------------------
-- Scaling
----------------------------------------------------------------------------------------------------
local function RogueFocusOptionsScaleSlider_Init()
	if(not RogueFocusOptions.scaleSliderLoaded) then
		local Text, Low, Full;
		Text = _G[this:GetName().."Text"];
		Low = _G[this:GetName().."Low"];
		High = _G[this:GetName().."High"];
		
		Text:SetText(ROGUEFOCUS_SCALE);
		Low:SetText(ROGUEFOCUS_LOW);
		High:SetText(ROGUEFOCUS_HIGH);
		
		this:SetMinMaxValues(1.0, 2.0);
		this:SetValueStep(.1);
		
		RogueFocusOptions.scaleSliderLoaded = true;
	end
	local value = format("%.1f", RogueFocusConfig.Scale);
	_G[this:GetName().."Value"]:SetText(value);
	RogueFocusFrame:SetScale(RogueFocusConfig.Scale);
end

function RogueFocusOptions:ScaleSlider_OnShow()
	RogueFocusOptionsScaleSlider_Init();
	this:SetValue(RogueFocusConfig.Scale);
end

function RogueFocusOptions:ScaleSlider_OnValueChanged()
	RogueFocusConfig.Scale = this:GetValue();
	RogueFocusOptionsScaleSlider_Init();
end

----------------------------------------------------------------------------------------------------
-- Combat
----------------------------------------------------------------------------------------------------
function RogueFocusOptions:CombatCheckButton_OnShow()
	this:SetChecked(RogueFocusConfig.InCombat);
end

function RogueFocusOptions:StealthCheckButton_OnShow()
	this:SetChecked(RogueFocusConfig.InStealth);
end

function RogueFocusOptions:OtherCheckButton_OnShow()
	this:SetChecked(RogueFocusConfig.InOther);
end

function RogueFocusOptions:CombatCheckButton_OnClick()
	if(1 == this:GetChecked()) then
		RogueFocusConfig.InCombat = true;
	else
		RogueFocusConfig.InCombat = false;
	end
	RogueFocus:Toggle();
end

function RogueFocusOptions:StealthCheckButton_OnClick()
	if(1 == this:GetChecked()) then
		RogueFocusConfig.InStealth = true;
	else
		RogueFocusConfig.InStealth = false;
	end
	RogueFocus:Toggle();
end

function RogueFocusOptions:OtherCheckButton_OnClick()
	if(1 == this:GetChecked()) then
		RogueFocusConfig.InOther = true;
	else
		RogueFocusConfig.InOther = false;
	end
	RogueFocus:Toggle();
end

----------------------------------------------------------------------------------------------------
-- Audio & Locking
----------------------------------------------------------------------------------------------------

function RogueFocusOptions:AudioCheckButton_OnShow()
	this:SetChecked(RogueFocusConfig.Audible);
end

function RogueFocusOptions:AudioCheckButton_OnClick()
	if(1 == this:GetChecked()) then
		RogueFocusConfig.Audible = true;
	else
		RogueFocusConfig.Audible = false;
	end
	RogueFocus:Toggle();
end

function RogueFocusOptions:LockCheckButton_OnShow()
	this:SetChecked(RogueFocusConfig.Locked);
end

function RogueFocusOptions:LockCheckButton_OnClick()
	if(1 == this:GetChecked()) then
		RogueFocusConfig.Locked = true;
	else
		RogueFocusConfig.Locked = false;
	end
	RogueFocus:Toggle();
end
