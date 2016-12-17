local E, L, V, P, G = unpack(select(2, ...));
local S = E:GetModule("Skins")

local _G = _G
local select, unpack, pairs = select, unpack, pairs

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.guild ~= true then return end

	GuildFrame:StripTextures(true)
	GuildFrame:SetTemplate("Transparent")

	GuildFrameInset:StripTextures()
	GuildFrameBottomInset:StripTextures()

	GuildLevelFrame:Kill()

	S:HandleCloseButton(GuildFrameCloseButton)

	--Bottom Tabs
	for i = 1, 5 do
		S:HandleTab(_G["GuildFrameTab"..i])
	end

	--XP Bar
	GuildXPFrame:ClearAllPoints()
	GuildXPFrame:Point("TOP", GuildFrame, "TOP", 0, -40)

	GuildXPBarLeft:Kill()
	GuildXPBarRight:Kill()
	GuildXPBarMiddle:Kill()
	GuildXPBarBG:Kill()
	GuildXPBarShadow:Kill()
	GuildXPBarCap:Kill()
	GuildXPBarCapMarker:Kill()

	for i = 1, 4 do
		_G["GuildXPBarDivider"..i]:Kill()
	end

	GuildXPBar:CreateBackdrop("Default")
	GuildXPBar.backdrop:Point("TOPLEFT", GuildXPBar.progress, "TOPLEFT", -1, 1)
	GuildXPBar.backdrop:Point("BOTTOMRIGHT", GuildXPBar, "BOTTOMRIGHT", -2, 5)
	GuildXPBar.progress:SetTexture(E["media"].normTex)

	--Faction Bar
	GuildFactionBar:StripTextures()
	GuildFactionBar:CreateBackdrop("Default")
	GuildFactionBar.backdrop:Point("TOPLEFT", GuildFactionBar.progress, "TOPLEFT", -1, 1)
	GuildFactionBar.backdrop:Point("BOTTOMRIGHT", GuildFactionBar, "BOTTOMRIGHT", -2, 1)
	GuildFactionBar.progress:SetTexture(E["media"].normTex)

	--Guild Latest/Next Perks/Updates
	GuildNewPerksFrame:StripTextures()
	GuildAllPerksFrame:StripTextures()

	GuildPerksToggleButton:StripTextures()
	S:HandleButton(GuildPerksToggleButton)

	S:HandleScrollBar(GuildPerksContainerScrollBar, 4)

	if(GuildLatestPerkButton) then
		GuildLatestPerkButton:StripTextures()
		GuildLatestPerkButton:CreateBackdrop("Default")
		GuildLatestPerkButton.backdrop:SetOutside(GuildLatestPerkButtonIconTexture)
		GuildLatestPerkButtonIconTexture:SetTexCoord(unpack(E.TexCoords))
		GuildLatestPerkButtonIconTexture:Point("TOPLEFT", 2, -2)
	end

	if(GuildNextPerkButton) then
		GuildNextPerkButton:StripTextures()
		GuildNextPerkButton:CreateBackdrop("Default")
		GuildNextPerkButton.backdrop:SetOutside(GuildNextPerkButtonIconTexture)
		GuildNextPerkButtonIconTexture:SetTexCoord(unpack(E.TexCoords))
		GuildNextPerkButtonIconTexture:Point("TOPLEFT", 2, -3)
	end

	for i = 1, 7 do
		_G["GuildUpdatesButton"..i]:StyleButton()
	end

	--Perks/Rewards
	GuildRewardsFrame:StripTextures()

	GuildRewardsFrameVisitText:ClearAllPoints()
	GuildRewardsFrameVisitText:Point("TOP", GuildRewardsFrame, "TOP", 0, 30)

	S:HandleScrollBar(GuildRewardsContainerScrollBar, 5)

	for _, Object in pairs({"Rewards", "Perks"}) do
		for i = 1, 8 do
			local Button = _G["Guild"..Object.."ContainerButton"..i];

			Button:StripTextures();
			Button:CreateBackdrop("Default");
			Button.backdrop:SetOutside(Button.icon);

			Button:StyleButton(nil, true);

			Button.icon:SetTexCoord(unpack(E.TexCoords));
			Button.icon:Point("TOPLEFT", 2, -2);
			Button.icon:Size(43);
			Button.icon:SetParent(Button.backdrop);

			if(Object == "Rewards") then
				Button.backdrop:SetScript("OnUpdate", function(self)
					local _, itemID = GetGuildRewardInfo(Button.index);
					if(itemID) then
						local quality = select(3, GetItemInfo(itemID));
						if(quality and quality > 1) then
							self:SetBackdropBorderColor(GetItemQualityColor(quality));
						else
							self:SetBackdropBorderColor(unpack(E["media"].bordercolor));
						end
					end
				end);
			end
		end
	end

	--Roster
	local VIEW;
	local function viewChanged(view)
		VIEW = view;
	end
	hooksecurefunc("GuildRoster_SetView", viewChanged)

	local function update()
		VIEW = VIEW or GetCVar("guildRosterView");
		local playerArea = GetRealZoneText();
		local buttons = GuildRosterContainer.buttons;

		for i, button in ipairs(buttons) do
			if(button:IsShown() and button.online and button.guildIndex) then
				if(VIEW == "tradeskill") then
					local _, _, _, headerName, _, _, _, playerName, _, _, zone = GetGuildTradeSkillInfo(button.guildIndex);
					if(not headerName and playerName) then
						if(zone == playerArea) then
							button.string2:SetText("|cff00ff00"..zone);
						end
					end
				else
					local _, _, _, level, _, zone = GetGuildRosterInfo(button.guildIndex);
					local levelTextColor = GetQuestDifficultyColor(level);

					if(VIEW == "playerStatus") then
						button.string1:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b);
						if(zone == playerArea) then
							button.string3:SetText("|cff00ff00"..zone);
						end
					elseif(VIEW == "achievement") then
						button.string1:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b);
					elseif(VIEW == "weeklyxp" or VIEW == "totalxp") then
						button.string1:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b);
					end
				end
			end
		end
	end
	hooksecurefunc("GuildRoster_Update", update)
	hooksecurefunc(GuildRosterContainer, "update", update)

	for i = 1, 4 do
		_G["GuildRosterColumnButton"..i]:StripTextures(true)
		_G["GuildRosterColumnButton"..i]:StyleButton()
	end

	for i = 1, 14 do
		_G["GuildRosterContainerButton"..i]:StyleButton()
		_G["GuildRosterContainerButton"..i.."BarTexture"]:SetTexture(E["media"].normTex)
		_G["GuildRosterContainerButton"..i.."Icon"]:SetTexture("Interface\\WorldStateFrame\\Icons-Classes");
		_G["GuildRosterContainerButton"..i.."Icon"]:Size(20);

		S:HandleButton(_G["GuildRosterContainerButton"..i.."HeaderButton"], true)
	end

	S:HandleDropDownBox(GuildRosterViewDropdown, 200)

	S:HandleScrollBar(GuildRosterContainerScrollBar, 5)

	S:HandleCheckBox(GuildRosterShowOfflineButton)

	--Guild Member
	GuildMemberNoteBackground:StripTextures()
	GuildMemberNoteBackground:SetTemplate("Transparent")

	GuildMemberOfficerNoteBackground:StripTextures()
	GuildMemberOfficerNoteBackground:SetTemplate("Transparent")

	GuildMemberRankDropdown:SetFrameLevel(GuildMemberRankDropdown:GetFrameLevel() + 5)
	GuildMemberRankDropdown:ClearAllPoints()
	GuildMemberRankDropdown:Point("CENTER", GuildMemberDetailFrame, "CENTER", 8, 42)

	S:HandleButton(GuildMemberGroupInviteButton)

	S:HandleButton(GuildMemberRemoveButton)
	GuildMemberRemoveButton:Point("BOTTOMLEFT", 9, 4)

	S:HandleDropDownBox(GuildMemberRankDropdown, 175)

	--Guild Member Detail
	GuildMemberDetailFrame:StripTextures()
	GuildMemberDetailFrame:SetTemplate("Transparent")
	GuildMemberDetailFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 1, 0)

	S:HandleCloseButton(GuildMemberDetailCloseButton)
	GuildMemberDetailCloseButton:Point("TOPRIGHT", 2, 2)

	--Guild News
	GuildNewsFrame:StripTextures()

	GuildNewsContainer:SetTemplate("Transparent")

	GuildNewsBossModel:StripTextures()
	GuildNewsBossModel:CreateBackdrop("Transparent")
	GuildNewsBossModel:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 4, -43)

	GuildNewsBossModelTextFrame:StripTextures()
	GuildNewsBossModelTextFrame:CreateBackdrop("Default")
	GuildNewsBossModelTextFrame.backdrop:Point("TOPLEFT", GuildNewsBossModel.backdrop, "BOTTOMLEFT", 0, -1)

	for i = 1, 17 do
		if _G["GuildNewsContainerButton"..i] then
			_G["GuildNewsContainerButton"..i].header:Kill()
			_G["GuildNewsContainerButton"..i]:StyleButton()
		end
	end

	S:HandleScrollBar(GuildNewsContainerScrollBar, 4)

	--Guild News Filter
	GuildNewsFiltersFrame:StripTextures()
	GuildNewsFiltersFrame:SetTemplate("Transparent")
	GuildNewsFiltersFrame:Point("TOPLEFT", GuildFrame, "TOPRIGHT", 1, 0)

	for i = 1, 7 do
		S:HandleCheckBox(_G["GuildNewsFilterButton"..i])
	end

	S:HandleCloseButton(GuildNewsFiltersFrameCloseButton)
	GuildNewsFiltersFrameCloseButton:Point("TOPRIGHT", 2, 2)

	--Guild Info
	GuildInfoFrameInfo:StripTextures()
	GuildInfoFrameApplicants:StripTextures()
	GuildInfoFrameApplicantsContainer:StripTextures()

	S:HandleScrollBar(GuildInfoDetailsFrameScrollBar, 4)
	S:HandleScrollBar(GuildInfoFrameApplicantsContainerScrollBar)

	GuildInfoFrameTab1:Point("TOPLEFT", 55, 33)

	S:HandleButton(GuildViewLogButton)
	S:HandleButton(GuildControlButton)
	S:HandleButton(GuildAddMemberButton)

	for _, button in next, GuildInfoFrameApplicantsContainer.buttons do
		button.selectedTex:SetTexture(1, 1, 1, 0.2)
		button:GetHighlightTexture():Kill()
		button:SetBackdrop(nil)
		button:StyleButton()
		button:SetTemplate("Transparent")
	end

	for i = 1, 5 do
		_G["GuildInfoFrameApplicantsContainerButton"..i.."Ring"]:SetAlpha(0)
		_G["GuildInfoFrameApplicantsContainerButton"..i.."LevelRing"]:SetAlpha(0)
		_G["GuildInfoFrameApplicantsContainerButton"..i.."LevelRing"]:Point("TOPLEFT", -42, 33)
	end

	for i = 1, 3 do
		local headerTab = _G["GuildInfoFrameTab"..i]
		headerTab:StripTextures()
		headerTab.backdrop = CreateFrame("Frame", nil, headerTab)
		headerTab.backdrop:SetTemplate("Default", true)
		headerTab.backdrop:Point("TOPLEFT", 3, -7)
		headerTab.backdrop:Point("BOTTOMRIGHT", -2, -1)
		headerTab.backdrop:SetFrameLevel(headerTab:GetFrameLevel() - 1)

		headerTab:HookScript("OnEnter", S.SetModifiedBackdrop);
		headerTab:HookScript("OnLeave", S.SetOriginalBackdrop);
	end

	local backdrop1 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop1:SetTemplate("Default")
	backdrop1:Point("TOPLEFT", 2, -22)
	backdrop1:Point("BOTTOMRIGHT", 0, 200)
	backdrop1:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)

	local backdrop2 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop2:SetTemplate("Default")
	backdrop2:Point("TOPLEFT", 2, -158)
	backdrop2:Point("BOTTOMRIGHT", 0, 118)
	backdrop2:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)

	local backdrop3 = CreateFrame("Frame", nil, GuildInfoFrameInfo)
	backdrop3:SetTemplate("Default")
	backdrop3:Point("TOPLEFT", 2, -233)
	backdrop3:Point("BOTTOMRIGHT", 0, 3)
	backdrop3:SetFrameLevel(GuildInfoFrameInfo:GetFrameLevel() - 1)

	--Text Edit Frame
	GuildTextEditFrame:StripTextures()
	GuildTextEditFrame:SetTemplate("Transparent")

	GuildTextEditContainer:StripTextures()
	GuildTextEditContainer:SetTemplate("Transparent")

	S:HandleButton(GuildTextEditFrameAcceptButton)

	S:HandleScrollBar(GuildTextEditScrollFrameScrollBar, 5)

	for i = 1, GuildTextEditFrame:GetNumChildren() do
		local child = select(i, GuildTextEditFrame:GetChildren())
		if(child:GetName() == "GuildTextEditFrameCloseButton" and child:GetWidth() < 33) then
			S:HandleCloseButton(child)
		elseif(child:GetName() == "GuildTextEditFrameCloseButton") then
			S:HandleButton(child, true)
		end
	end

	--Guild Log
	S:HandleScrollBar(GuildLogScrollFrameScrollBar, 4)

	GuildLogFrame:StripTextures()
	GuildLogFrame:SetTemplate("Transparent")

	GuildLogContainer:StripTextures()

	GuildLogScrollFrame:SetTemplate("Transparent")

	for i = 1, GuildLogFrame:GetNumChildren() do
		local child = select(i, GuildLogFrame:GetChildren())
		if(child:GetName() == "GuildLogFrameCloseButton" and child:GetWidth() < 33) then
			S:HandleCloseButton(child)
		elseif(child:GetName() == "GuildLogFrameCloseButton") then
			S:HandleButton(child, true)
		end
	end

	-- Guild Recruitment
	GuildRecruitmentRolesFrame:StripTextures()
	GuildRecruitmentLevelFrame:StripTextures()
	GuildRecruitmentCommentFrame:StripTextures()
	GuildRecruitmentInterestFrame:StripTextures()
	GuildRecruitmentAvailabilityFrame:StripTextures()

	GuildRecruitmentCommentInputFrame:StripTextures()
	GuildRecruitmentCommentInputFrame:SetTemplate("Default")

	S:HandleScrollBar(GuildRecruitmentCommentInputFrameScrollFrameScrollBar)

	S:HandleButton(GuildRecruitmentInviteButton)
	S:HandleButton(GuildRecruitmentMessageButton)
	S:HandleButton(GuildRecruitmentDeclineButton)
	S:HandleButton(GuildRecruitmentListGuildButton)

	S:HandleCheckBox(GuildRecruitmentQuestButton)
	S:HandleCheckBox(GuildRecruitmentDungeonButton)
	S:HandleCheckBox(GuildRecruitmentRaidButton)
	S:HandleCheckBox(GuildRecruitmentPvPButton)
	S:HandleCheckBox(GuildRecruitmentRPButton)
	S:HandleCheckBox(GuildRecruitmentWeekdaysButton)
	S:HandleCheckBox(GuildRecruitmentWeekendsButton)
	S:HandleCheckBox(GuildRecruitmentLevelAnyButton)
	S:HandleCheckBox(GuildRecruitmentLevelMaxButton)

	S:HandleCheckBox(GuildRecruitmentTankButton:GetChildren())
	GuildRecruitmentTankButton:GetChildren():SetFrameLevel(GuildRecruitmentTankButton:GetChildren():GetFrameLevel() + 2);

	S:HandleCheckBox(GuildRecruitmentHealerButton:GetChildren())
	GuildRecruitmentHealerButton:GetChildren():SetFrameLevel(GuildRecruitmentHealerButton:GetChildren():GetFrameLevel() + 2);

	S:HandleCheckBox(GuildRecruitmentDamagerButton:GetChildren())
	GuildRecruitmentDamagerButton:GetChildren():SetFrameLevel(GuildRecruitmentDamagerButton:GetChildren():GetFrameLevel() + 2);

	GuildRecruitmentTankButton:StripTextures()
	GuildRecruitmentTankButton:CreateBackdrop();
	GuildRecruitmentTankButton.backdrop:Point("TOPLEFT", 2, -2)
	GuildRecruitmentTankButton.backdrop:Point("BOTTOMRIGHT", -2, 2)
	GuildRecruitmentTankButton.icon = GuildRecruitmentTankButton:CreateTexture(nil, "OVERLAY");
	GuildRecruitmentTankButton.icon:SetTexture("Interface\\Icons\\Ability_Defend");
	GuildRecruitmentTankButton.icon:SetTexCoord(unpack(E.TexCoords))
	GuildRecruitmentTankButton.icon:SetInside(GuildRecruitmentTankButton.backdrop)

	GuildRecruitmentHealerButton:StripTextures()
	GuildRecruitmentHealerButton:CreateBackdrop();
	GuildRecruitmentHealerButton.backdrop:Point("TOPLEFT", 2, -2)
	GuildRecruitmentHealerButton.backdrop:Point("BOTTOMRIGHT", -2, 2)
	GuildRecruitmentHealerButton.icon = GuildRecruitmentHealerButton:CreateTexture(nil, "OVERLAY");
	GuildRecruitmentHealerButton.icon:SetTexture("Interface\\Icons\\SPELL_NATURE_HEALINGTOUCH");
	GuildRecruitmentHealerButton.icon:SetTexCoord(unpack(E.TexCoords))
	GuildRecruitmentHealerButton.icon:SetInside(GuildRecruitmentHealerButton.backdrop)

	GuildRecruitmentDamagerButton:StripTextures()
	GuildRecruitmentDamagerButton:CreateBackdrop();
	GuildRecruitmentDamagerButton.backdrop:Point("TOPLEFT", 2, -2)
	GuildRecruitmentDamagerButton.backdrop:Point("BOTTOMRIGHT", -2, 2)
	GuildRecruitmentDamagerButton.icon = GuildRecruitmentDamagerButton:CreateTexture(nil, "OVERLAY");
	GuildRecruitmentDamagerButton.icon:SetTexture("Interface\\Icons\\INV_Knife_1H_Common_B_01");
	GuildRecruitmentDamagerButton.icon:SetTexCoord(unpack(E.TexCoords))
	GuildRecruitmentDamagerButton.icon:SetInside(GuildRecruitmentDamagerButton.backdrop)
end

S:AddCallbackForAddon("Blizzard_GuildUI", "Guild", LoadSkin);