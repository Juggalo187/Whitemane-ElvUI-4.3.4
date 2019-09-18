local E, L, V, P, G = unpack(select(2, ...))
local NP = E:GetModule("NamePlates")
local LSM = E.Libs.LSM

local CreateFrame = CreateFrame

--[[
Target Glow Style Option Variables
	style1 - Border
	style2 - Background
	style3 - Top Arrow Only
	style4 - Side Arrows Only
	style5 - Border + Top Arrow
	style6 - Background + Top Arrow
	style7 - Border + Side Arrows
	style8 - Background + Side Arrows
]]

function NP:UpdatePoisiton_Arrow(frame, shouldShow)
	if frame.TopArrow and (shouldShow ~= 2) and (NP.db.targetGlow == "style3" or NP.db.targetGlow == "style5" or NP.db.targetGlow == "style6") then -- top arrow
		local topArrowSpace = -3
		if NP.db.units[frame.UnitType].showName and (frame.Name:GetText() ~= nil and frame.Name:GetText() ~= "") then
			topArrowSpace = NP.db.fontSize + topArrowSpace
		end
		frame.TopArrow:Point("BOTTOM", frame.HealthBar, "TOP", 0, topArrowSpace)

		if shouldShow then
			frame.TopArrow:Show()
		end
	end

	if (frame.LeftArrow and frame.RightArrow) and (shouldShow ~= 2) and (NP.db.targetGlow == "style4" or NP.db.targetGlow == "style7" or NP.db.targetGlow == "style8") then -- side arrows
		frame.RightArrow:Point("RIGHT", frame.HealthBar, "LEFT", 3, 0)
		frame.LeftArrow:Point("LEFT", frame.HealthBar, "RIGHT", -3, 0)

		if shouldShow then
			frame.RightArrow:Show()
			frame.LeftArrow:Show()
		end
	end
end

function NP:UpdatePosition_Glow(frame, shouldShow)
	local castBar = frame.CastBar and frame.CastBar:IsShown() and frame.CastBar
	local iconPosition = castBar and (castBar.Icon and castBar.Icon:IsShown()) and (frame.UnitType and NP.db.units[frame.UnitType].castbar.iconPosition)

	if frame.Glow and (NP.db.targetGlow == "style1" or NP.db.targetGlow == "style5" or NP.db.targetGlow == "style7") then -- original glow
		local offset = E:Scale(E.PixelMode and 6 or 8) -- edgeSize is 6 (not attached to the backdrop needs +1 for pixel mode or +3 for non pixel mode)
		if NP.db.units[frame.UnitType].castbar.offset < 4 then
			frame.Glow:SetOutside((iconPosition == "LEFT" and castBar.Icon) or frame.HealthBar, offset, offset, (iconPosition == "RIGHT" and castBar.Icon) or castBar)
		else
			frame.Glow:SetOutside(frame.HealthBar, offset, offset)
		end

		if shouldShow then
			frame.Glow:Show()
		end
	end

	if frame.Glow2 and (NP.db.targetGlow == "style2" or NP.db.targetGlow == "style6" or NP.db.targetGlow == "style8") then -- new background glow
		local scale = 1
		if NP.db.useTargetScale then
			if NP.db.targetScale >= 0.75 then
				scale = NP.db.targetScale
			else
				scale = 0.75
			end
		end

		local size = (E.Border+14+(castBar and 3 or 0))*scale
		frame.Glow2:Point("TOPLEFT", (iconPosition == "LEFT" and castBar.Icon) or frame.HealthBar, "TOPLEFT", -(size*2), size)
		frame.Glow2:Point("BOTTOMRIGHT", (iconPosition == "RIGHT" and castBar.Icon) or castBar or frame.HealthBar, "BOTTOMRIGHT", size*2, -size)

		if shouldShow then
			frame.Glow2:Show()
		end
	end
end

function NP:UpdateElement_Glow(frame)
	if frame.TopArrow:IsShown() then frame.TopArrow:Hide() end
	if frame.LeftArrow:IsShown() then frame.LeftArrow:Hide() end
	if frame.RightArrow:IsShown() then frame.RightArrow:Hide() end
	if frame.Glow2:IsShown() then frame.Glow2:Hide() end
	if frame.Glow:IsShown() then frame.Glow:Hide() end
	if not frame.HealthBar:IsShown() then return end

	local shouldShow, r, g, b, a = 0
	if frame.isTarget and NP.db.targetGlow ~= "none" then
		r, g, b, a = NP.db.glowColor.r, NP.db.glowColor.g, NP.db.glowColor.b, NP.db.glowColor.a
		shouldShow = 1
	elseif NP.db.lowHealthThreshold > 0 then
		local health = frame.oldHealthBar:GetValue()
		local _, maxHealth = frame.oldHealthBar:GetMinMaxValues()
		local perc = health / maxHealth
		if perc <= NP.db.lowHealthThreshold then
			if perc <= NP.db.lowHealthThreshold / 2 then
				r, g, b, a = 1, 0, 0, 1
			else
				r, g, b, a = 1, 1, 0, 1
			end

			shouldShow = 2
		end
	end

	if shouldShow ~= 0 then
		NP:UpdatePosition_Glow(frame, shouldShow)
		NP:UpdatePoisiton_Arrow(frame, shouldShow)

		if frame.Glow and (r ~= frame.Glow.r or g ~= frame.Glow.g or b ~= frame.Glow.b or a ~= frame.Glow.a) then
			frame.Glow:SetBackdropBorderColor(r, g, b, a)
			frame.Glow2:SetVertexColor(r, g, b, a)

			frame.TopArrow:SetVertexColor(r, g, b, a)
			frame.TopArrow:SetRotation(3.14)

			frame.LeftArrow:SetVertexColor(r, g, b, a)
			frame.LeftArrow:SetRotation(1.57)

			frame.RightArrow:SetVertexColor(r, g, b, a)
			frame.RightArrow:SetRotation(-1.57)

			frame.Glow.r, frame.Glow.g, frame.Glow.b, frame.Glow.a = r, g, b, a
		end
	end
end

function NP:ConfigureElement_Glow(frame)

end

function NP:ConstructElement_Glow(frame)
	local f = CreateFrame("Frame", "$parentGlow", frame)
	f:SetFrameLevel(frame.HealthBar:GetFrameLevel() - 1)
	f:SetBackdrop({edgeFile = LSM:Fetch("border", "ElvUI GlowBorder"), edgeSize = E:Scale(6)})
	f:Hide()

	local glow = frame:CreateTexture(nil, "BACKGROUND")
	glow:SetTexture(E.Media.Textures.Spark)
	glow:Hide()
	frame.Glow2 = glow

	local top = frame:CreateTexture(nil, "BACKGROUND")
	top:SetTexture(E.Media.Textures.ArrowUp)
	top:Hide()
	frame.TopArrow = top

	local left = frame:CreateTexture(nil, "BACKGROUND")
	left:SetTexture(E.Media.Textures.ArrowUp)
	left:Hide()
	frame.LeftArrow = left

	local right = frame:CreateTexture(nil, "BACKGROUND")
	right:SetTexture(E.Media.Textures.ArrowUp)
	right:Hide()
	frame.RightArrow = right

	return f
end