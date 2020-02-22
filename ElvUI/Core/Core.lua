﻿local ElvUI = select(2, ...)
ElvUI[2] = ElvUI[1].Libs.ACL:GetLocale("ElvUI", ElvUI[1]:GetLocale()) -- Locale doesn't exist yet, make it exist.
local E, L, V, P, G = unpack(ElvUI)
local LSM = E.Libs.LSM

local _G = _G
local tonumber, pairs, ipairs, error, unpack, select, tostring = tonumber, pairs, ipairs, error, unpack, select, tostring
local assert, type = assert, type
local twipe, tinsert, tremove, next = table.wipe, tinsert, tremove, next
local format, find, match, strrep, strlen, sub, gsub, strjoin = string.format, string.find, string.match, strrep, strlen, string.sub, string.gsub, strjoin

local UnitGUID = UnitGUID
local CreateFrame = CreateFrame
local GetCVar = GetCVar
local IsAddOnLoaded = IsAddOnLoaded
local IsInGuild = IsInGuild
local IsInInstance, GetNumPartyMembers, GetNumRaidMembers = IsInInstance, GetNumPartyMembers, GetNumRaidMembers
local SendAddonMessage = SendAddonMessage
local InCombatLockdown = InCombatLockdown
local ERR_NOT_IN_COMBAT = ERR_NOT_IN_COMBAT
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

--Modules
local ActionBars = E:GetModule("ActionBars")
local AFK = E:GetModule("AFK")
local Auras = E:GetModule("Auras")
local Bags = E:GetModule("Bags")
local Blizzard = E:GetModule("Blizzard")
local Chat = E:GetModule("Chat")
local DataBars = E:GetModule("DataBars")
local DataTexts = E:GetModule("DataTexts")
local Layout = E:GetModule("Layout")
local Minimap = E:GetModule("Minimap")
local NamePlates = E:GetModule("NamePlates")
local Threat = E:GetModule("Threat")
local Tooltip = E:GetModule("Tooltip")
local Totems = E:GetModule("Totems")
local ReminderBuffs = E:GetModule("ReminderBuffs")
local UnitFrames = E:GetModule("UnitFrames")

--Constants
E.noop = function() end
E.title = format("|cffff7000E|r|cffe5e3e3lvUI|r")
E.myfaction, E.myLocalizedFaction = UnitFactionGroup("player")
E.mylevel = UnitLevel("player")
E.myLocalizedClass, E.myclass, E.myClassID = UnitClass("player")
E.myLocalizedRace, E.myrace = UnitRace("player")
E.myname = UnitName("player")
E.myrealm = GetRealmName()
E.version = tonumber(GetAddOnMetadata("ElvUI", "Version"))
E.wowpatch, E.wowbuild = GetBuildInfo()
E.wowbuild = tonumber(E.wowbuild)
E.resolution = GetCVar("gxResolution")
E.screenwidth, E.screenheight = tonumber(match(E.resolution, "(%d+)x+%d")), tonumber(match(E.resolution, "%d+x(%d+)"))
E.isMacClient = IsMacClient()
E.InfoColor = "|cfffe7b2c"

-- oUF Defines
E.oUF.Tags.Vars.E = E
E.oUF.Tags.Vars.L = L

--Tables
E.media = {}
E.frames = {}
E.unitFrameElements = {}
E.statusBars = {}
E.texts = {}
E.snapBars = {}
E.RegisteredModules = {}
E.RegisteredInitialModules = {}
E.ModuleCallbacks = {["CallPriority"] = {}}
E.InitialModuleCallbacks = {["CallPriority"] = {}}
E.valueColorUpdateFuncs = {}
E.TexCoords = {0, 1, 0, 1}
E.VehicleLocks = {}
E.CreditsList = {}
E.UserList = {}

E.InversePoints = {
	TOP = "BOTTOM",
	BOTTOM = "TOP",
	TOPLEFT = "BOTTOMLEFT",
	TOPRIGHT = "BOTTOMRIGHT",
	LEFT = "RIGHT",
	RIGHT = "LEFT",
	BOTTOMLEFT = "TOPLEFT",
	BOTTOMRIGHT = "TOPRIGHT",
	CENTER = "CENTER"
}

E.HealingClasses = {
	PALADIN = 1,
	SHAMAN = 3,
	DRUID = 3,
	PRIEST = {1, 2}
}

E.ClassRole = {
	PALADIN = {
		[1] = "Caster",
		[2] = "Tank",
		[3] = "Melee"
	},
	PRIEST = "Caster",
	WARLOCK = "Caster",
	WARRIOR = {
		[1] = "Melee",
		[2] = "Melee",
		[3] = "Tank"
	},
	HUNTER = "Melee",
	SHAMAN = {
		[1] = "Caster",
		[2] = "Melee",
		[3] = "Caster"
	},
	ROGUE = "Melee",
	MAGE = "Caster",
	DEATHKNIGHT = {
		[1] = "Tank",
		[2] = "Melee",
		[3] = "Melee"
	},
	DRUID = {
		[1] = "Caster",
		[2] = "Melee",
		[3] = "Caster"
	}
}

E.DispelClasses = {
	PRIEST = {Magic = true, Disease = true},
	SHAMAN = {Magic = false, Curse = true},
	PALADIN = {Poison = true, Magic = false, Disease = true},
	MAGE = {Curse = true},
	DRUID = {Magic = false, Curse = true, Poison = true}
}

E.BadDispels = {
	[30108] = "Unstable Affliction", --silences
	[34914] = "Vampiric Touch" --horrifies
}

--Workaround for people wanting to use white and it reverting to their class color.
E.PriestColors = {r = 0.99, g = 0.99, b = 0.99, colorStr = "fffcfcfc"}

--This frame everything in ElvUI should be anchored to for Eyefinity support.
E.UIParent = CreateFrame("Frame", "ElvUIParent", UIParent)
E.UIParent:SetFrameLevel(UIParent:GetFrameLevel())
E.UIParent:SetPoint("CENTER", UIParent, "CENTER")
E.UIParent:SetSize(UIParent:GetSize())
E.snapBars[#E.snapBars + 1] = E.UIParent

E.HiddenFrame = CreateFrame("Frame")
E.HiddenFrame:Hide()

do -- used in optionsUI
	E.DEFAULT_FILTER = {}
	for filter, tbl in pairs(G.unitframe.aurafilters) do
		E.DEFAULT_FILTER[filter] = tbl.type
	end
end

local colorizedName
function E:ColorizedName(name, arg2)
	local length = strlen(name)
	for i = 1, length do
		local letter = sub(name, i, i)
		if i == 1 then
			colorizedName = format("|cffff7000%s", letter)
		elseif i == 2 then
			colorizedName = format("%s|r|cffC4C4C4%s", colorizedName, letter)
		elseif i == length and arg2 then
			colorizedName = format("%s%s|r|cffff7000:|r", colorizedName, letter)
		else
			colorizedName = colorizedName..letter
		end
	end
	return colorizedName
end

function E:Print(...)
	(_G[self.db.general.messageRedirect] or DEFAULT_CHAT_FRAME):AddMessage(strjoin("", E:ColorizedName("ElvUI", true), ...)) -- I put DEFAULT_CHAT_FRAME as a fail safe.
end

local delayedTimer
local delayedFuncs = {}
function E:ShapeshiftDelayedUpdate(func, ...)
	delayedFuncs[func] = {...}

	if delayedTimer then return end

	delayedTimer = E:ScheduleTimer(function()
		for f in pairs(delayedFuncs) do
			f(unpack(delayedFuncs[f]))
		end

		twipe(delayedFuncs)
		delayedTimer = nil
	end, 0.05)
end

function E:GrabColorPickerValues(r, g, b)
	-- we must block the execution path to `ColorCallback` in `AceGUIWidget-ColorPicker-ElvUI`
	-- in order to prevent an infinite loop from `OnValueChanged` when passing into `E.UpdateMedia` which eventually leads here again.
	ColorPickerFrame.noColorCallback = true

	-- grab old values
	local oldR, oldG, oldB = ColorPickerFrame:GetColorRGB()

	-- set and define the new values
	ColorPickerFrame:SetColorRGB(r, g, b)
	r, g, b = ColorPickerFrame:GetColorRGB()

	-- swap back to the old values
	if oldR then ColorPickerFrame:SetColorRGB(oldR, oldG, oldB) end

	-- free it up..
	ColorPickerFrame.noColorCallback = nil

	return r, g, b
end

--Basically check if another class border is being used on a class that doesn't match. And then return true if a match is found.
function E:CheckClassColor(r, g, b)
	r, g, b = E:GrabColorPickerValues(r, g, b)
	local matchFound = false
	for class in pairs(RAID_CLASS_COLORS) do
		if class ~= E.myclass then
			local colorTable = E:ClassColor(class, true)
			local red, green, blue = E:GrabColorPickerValues(colorTable.r, colorTable.g, colorTable.b)
			if red == r and green == g and blue == b then
				matchFound = true
			end
		end
	end

	return matchFound
end

function E:SetColorTable(t, data)
	if not data.r or not data.g or not data.b then
		error("SetColorTable: Could not unpack color values.")
	end

	if t and (type(t) == "table") then
		t[1], t[2], t[3], t[4] = E:UpdateColorTable(data)
	else
		t = E:GetColorTable(data)
	end

	return t
end

function E:UpdateColorTable(data)
	if not data.r or not data.g or not data.b then
		error("UpdateColorTable: Could not unpack color values.")
	end

	if (data.r > 1 or data.r < 0) then data.r = 1 end
	if (data.g > 1 or data.g < 0) then data.g = 1 end
	if (data.b > 1 or data.b < 0) then data.b = 1 end
	if data.a and (data.a > 1 or data.a < 0) then data.a = 1 end

	if data.a then
		return data.r, data.g, data.b, data.a
	else
		return data.r, data.g, data.b
	end
end

function E:GetColorTable(data)
	if not data.r or not data.g or not data.b then
		error("GetColorTable: Could not unpack color values.")
	end

	if (data.r > 1 or data.r < 0) then data.r = 1 end
	if (data.g > 1 or data.g < 0) then data.g = 1 end
	if (data.b > 1 or data.b < 0) then data.b = 1 end
	if data.a and (data.a > 1 or data.a < 0) then data.a = 1 end

	if data.a then
		return {data.r, data.g, data.b, data.a}
	else
		return {data.r, data.g, data.b}
	end
end

function E:UpdateMedia()
	if not self.db.general or not self.private.general then return end --Prevent rare nil value errors

	-- Fonts
	self.media.normFont = LSM:Fetch("font", self.db.general.font)
	self.media.combatFont = LSM:Fetch("font", self.private.general.dmgfont)

	-- Textures
	self.media.blankTex = LSM:Fetch("background", "ElvUI Blank")
	self.media.normTex = LSM:Fetch("statusbar", self.private.general.normTex)
	self.media.glossTex = LSM:Fetch("statusbar", self.private.general.glossTex)

	-- Border Color
	local border = E.db.general.bordercolor
	if self:CheckClassColor(border.r, border.g, border.b) then
		local classColor = E:ClassColor(E.myclass, true)
		E.db.general.bordercolor.r = classColor.r
		E.db.general.bordercolor.g = classColor.g
		E.db.general.bordercolor.b = classColor.b
	end

	self.media.bordercolor = {border.r, border.g, border.b}

	-- UnitFrame Border Color
	border = E.db.unitframe.colors.borderColor
	if self:CheckClassColor(border.r, border.g, border.b) then
		local classColor = E:ClassColor(E.myclass, true)
		E.db.unitframe.colors.borderColor.r = classColor.r
		E.db.unitframe.colors.borderColor.g = classColor.g
		E.db.unitframe.colors.borderColor.b = classColor.b
	end
	self.media.unitframeBorderColor = {border.r, border.g, border.b}

	-- Backdrop Color
	self.media.backdropcolor = E:SetColorTable(self.media.backdropcolor, self.db.general.backdropcolor)

	-- Backdrop Fade Color
	self.media.backdropfadecolor = E:SetColorTable(self.media.backdropfadecolor, self.db.general.backdropfadecolor)

	-- Value Color
	local value = self.db.general.valuecolor

	if self:CheckClassColor(value.r, value.g, value.b) then
		value = E:ClassColor(E.myclass, true)
		self.db.general.valuecolor.r = value.r
		self.db.general.valuecolor.g = value.g
		self.db.general.valuecolor.b = value.b
	end

	self.media.hexvaluecolor = self:RGBToHex(value.r, value.g, value.b)
	self.media.rgbvaluecolor = {value.r, value.g, value.b}

	if LeftChatPanel and LeftChatPanel.tex and RightChatPanel and RightChatPanel.tex then
		LeftChatPanel.tex:SetTexture(E.db.chat.panelBackdropNameLeft)
		RightChatPanel.tex:SetTexture(E.db.chat.panelBackdropNameRight)

		local a = E.db.general.backdropfadecolor.a or 0.5
		LeftChatPanel.tex:SetAlpha(a)
		RightChatPanel.tex:SetAlpha(a)
	end

	self:ValueFuncCall()
	self:UpdateBlizzardFonts()
end

do	--Update font/texture paths when they are registered by the addon providing them
	--This helps fix most of the issues with fonts or textures reverting to default because the addon providing them is loading after ElvUI.
	--We use a wrapper to avoid errors in :UpdateMedia because "self" is passed to the function with a value other than ElvUI.
	local function LSMCallback() E:UpdateMedia() end
	LSM.RegisterCallback(E, "LibSharedMedia_Registered", LSMCallback)
end

function E:ValueFuncCall()
	for func in pairs(self.valueColorUpdateFuncs) do
		func(self.media.hexvaluecolor, unpack(self.media.rgbvaluecolor))
	end
end

function E:UpdateFrameTemplates()
	for frame in pairs(self.frames) do
		if frame and frame.template and not frame.ignoreUpdates then
			if not frame.ignoreFrameTemplates then
				frame:SetTemplate(frame.template, frame.glossTex, nil, frame.forcePixelMode)
			end
		else
			self.frames[frame] = nil
		end
	end

	for frame in pairs(self.unitFrameElements) do
		if frame and frame.template and not frame.ignoreUpdates then
			if not frame.ignoreFrameTemplates then
				frame:SetTemplate(frame.template, frame.glossTex, nil, frame.forcePixelMode, frame.isUnitFrameElement)
			end
		else
			self.unitFrameElements[frame] = nil
		end
	end
end

function E:UpdateBorderColors()
	for frame in pairs(self.frames) do
		if frame and not frame.ignoreUpdates then
			if not frame.ignoreBorderColors then
				if frame.template == "Default" or frame.template == "Transparent" or frame.template == nil then
					frame:SetBackdropBorderColor(unpack(self.media.bordercolor))
				end
			end
		else
			self.frames[frame] = nil
		end
	end

	for frame in pairs(self.unitFrameElements) do
		if frame and not frame.ignoreUpdates then
			if not frame.ignoreBorderColors then
				if frame.template == "Default" or frame.template == "Transparent" or frame.template == nil then
					frame:SetBackdropBorderColor(unpack(self.media.unitframeBorderColor))
				end
			end
		else
			self.unitFrameElements[frame] = nil
		end
	end
end

function E:UpdateBackdropColors()
	for frame in pairs(self.frames) do
		if frame and not frame.ignoreUpdates then
			if not frame.ignoreBackdropColors then
				if frame.template == "Default" or frame.template == nil then
					if frame.backdropTexture then
						frame.backdropTexture:SetVertexColor(unpack(self.media.backdropcolor))
					else
						frame:SetBackdropColor(unpack(self.media.backdropcolor))
					end
				elseif frame.template == "Transparent" then
					frame:SetBackdropColor(unpack(self.media.backdropfadecolor))
				end
			end
		else
			self.frames[frame] = nil
		end
	end

	for frame in pairs(self.unitFrameElements) do
		if frame and not frame.ignoreUpdates then
			if not frame.ignoreBackdropColors then
				if frame.template == "Default" or frame.template == nil then
					if frame.backdropTexture then
						frame.backdropTexture:SetVertexColor(unpack(self.media.backdropcolor))
					else
						frame:SetBackdropColor(unpack(self.media.backdropcolor))
					end
				elseif frame.template == "Transparent" then
					frame:SetBackdropColor(unpack(self.media.backdropfadecolor))
				end
			end
		else
			self.unitFrameElements[frame] = nil
		end
	end
end

function E:UpdateFontTemplates()
	for text in pairs(self.texts) do
		if text then
			text:FontTemplate(text.font, text.fontSize, text.fontStyle)
		else
			self.texts[text] = nil
		end
	end
end

function E:RegisterStatusBar(statusBar)
	tinsert(self.statusBars, statusBar)
end

function E:UpdateStatusBars()
	for _, statusBar in pairs(self.statusBars) do
		if statusBar and statusBar:IsObjectType("StatusBar") then
			statusBar:SetStatusBarTexture(self.media.normTex)
		elseif statusBar and statusBar:IsObjectType("Texture") then
			statusBar:SetTexture(self.media.normTex)
		end
	end
end

function E:IncompatibleAddOn(addon, module)
	E.PopupDialogs.INCOMPATIBLE_ADDON.button1 = addon
	E.PopupDialogs.INCOMPATIBLE_ADDON.button2 = "ElvUI "..module
	E.PopupDialogs.INCOMPATIBLE_ADDON.addon = addon
	E.PopupDialogs.INCOMPATIBLE_ADDON.module = module
	E:StaticPopup_Show("INCOMPATIBLE_ADDON", addon, module)
end

function E:CheckIncompatible()
	if E.global.ignoreIncompatible then return end

	if IsAddOnLoaded("Prat-3.0") and E.private.chat.enable then E:IncompatibleAddOn("Prat-3.0", "Chat") end
	if IsAddOnLoaded("Chatter") and E.private.chat.enable then E:IncompatibleAddOn("Chatter", "Chat") end
	if IsAddOnLoaded("TidyPlates") and E.private.nameplates.enable then E:IncompatibleAddOn("TidyPlates", "NamePlates") end
	if IsAddOnLoaded("Aloft") and E.private.nameplates.enable then E:IncompatibleAddOn("Aloft", "NamePlates") end
	if IsAddOnLoaded("Healers-Have-To-Die") and E.private.nameplates.enable then E:IncompatibleAddOn("Healers-Have-To-Die", "NamePlates") end
end

function E:CopyTable(currentTable, defaultTable)
	if type(currentTable) ~= "table" then currentTable = {} end

	if type(defaultTable) == "table" then
		for option, value in pairs(defaultTable) do
			if type(value) == "table" then
				value = self:CopyTable(currentTable[option], value)
			end

			currentTable[option] = value
		end
	end

	return currentTable
end

function E:RemoveEmptySubTables(tbl)
	if type(tbl) ~= "table" then
		E:Print("Bad argument #1 to 'RemoveEmptySubTables' (table expected)")
		return
	end

	for k, v in pairs(tbl) do
		if type(v) == "table" then
			if next(v) == nil then
				tbl[k] = nil
			else
				self:RemoveEmptySubTables(v)
			end
		end
	end
end

--Compare 2 tables and remove duplicate key/value pairs
--param cleanTable : table you want cleaned
--param checkTable : table you want to check against.
--return : a copy of cleanTable with duplicate key/value pairs removed
function E:RemoveTableDuplicates(cleanTable, checkTable, customVars)
	if type(cleanTable) ~= "table" then
		E:Print("Bad argument #1 to 'RemoveTableDuplicates' (table expected)")
		return
	end
	if type(checkTable) ~= "table" then
		E:Print("Bad argument #2 to 'RemoveTableDuplicates' (table expected)")
		return
	end

	local rtdCleaned = {}
	for option, value in pairs(cleanTable) do
		if not customVars or (customVars[option] or checkTable[option] ~= nil) then
			-- we only want to add settings which are existing in the default table, unless it's allowed by customVars
			if type(value) == "table" and type(checkTable[option]) == "table" then
				rtdCleaned[option] = self:RemoveTableDuplicates(value, checkTable[option], customVars)
			elseif cleanTable[option] ~= checkTable[option] then
				-- add unique data to our clean table
				rtdCleaned[option] = value
			end
		end
	end

	--Clean out empty sub-tables
	self:RemoveEmptySubTables(rtdCleaned)

	return rtdCleaned
end

--Compare 2 tables and remove blacklisted key/value pairs
--param cleanTable : table you want cleaned
--param blacklistTable : table you want to check against.
--return : a copy of cleanTable with blacklisted key/value pairs removed
function E:FilterTableFromBlacklist(cleanTable, blacklistTable)
	if type(cleanTable) ~= "table" then
		E:Print("Bad argument #1 to 'FilterTableFromBlacklist' (table expected)")
		return
	end
	if type(blacklistTable) ~= "table" then
		E:Print("Bad argument #2 to 'FilterTableFromBlacklist' (table expected)")
		return
	end

	local tfbCleaned = {}
	for option, value in pairs(cleanTable) do
		if type(value) == "table" and blacklistTable[option] and type(blacklistTable[option]) == "table" then
			tfbCleaned[option] = self:FilterTableFromBlacklist(value, blacklistTable[option])
		else
			-- Filter out blacklisted keys
			if blacklistTable[option] ~= true then
				tfbCleaned[option] = value
			end
		end
	end

	--Clean out empty sub-tables
	self:RemoveEmptySubTables(tfbCleaned)

	return tfbCleaned
end

do	--The code in this function is from WeakAuras, credit goes to Mirrored and the WeakAuras Team
	--Code slightly modified by Simpy
	local function recurse(table, level, ret)
		for i, v in pairs(table) do
			ret = ret..strrep("    ", level).."["
			if type(i) == "string" then ret = ret..'"'..i..'"' else ret = ret..i end
			ret = ret.."] = "

			if type(v) == "number" then
				ret = ret..v..",\n"
			elseif type(v) == "string" then
				ret = ret.."\""..v:gsub("\\", "\\\\"):gsub("\n", "\\n"):gsub("\"", "\\\""):gsub("\124", "\124\124").."\",\n"
			elseif type(v) == "boolean" then
				if v then ret = ret.."true,\n" else ret = ret.."false,\n" end
			elseif type(v) == "table" then
				ret = ret.."{\n"
				ret = recurse(v, level + 1, ret)
				ret = ret..strrep("    ", level).."},\n"
			else
				ret = ret.."\""..tostring(v).."\",\n"
			end
		end

		return ret
	end

	function E:TableToLuaString(inTable)
		if type(inTable) ~= "table" then
			E:Print("Invalid argument #1 to E:TableToLuaString (table expected)")
			return
		end

		local ret = "{\n"
		if inTable then ret = recurse(inTable, 1, ret) end
		ret = ret.."}"

		return ret
	end
end

do	--The code in this function is from WeakAuras, credit goes to Mirrored and the WeakAuras Team
	--Code slightly modified by Simpy
	local lineStructureTable, profileFormat = {}, {
		profile = "E.db",
		private = "E.private",
		global = "E.global",
		filters = "E.global",
		styleFilters = "E.global"
	}

	local function buildLineStructure(str) -- str is profileText
		for _, v in ipairs(lineStructureTable) do
			if type(v) == "string" then
				str = str..'["'..v..'"]'
			else
				str = str..'['..v..']'
			end
		end

		return str
	end

	local sameLine
	local function recurse(tbl, ret, profileText)
		local lineStructure = buildLineStructure(profileText)
		for k, v in pairs(tbl) do
			if not sameLine then
				ret = ret..lineStructure
			end

			ret = ret.."["

			if type(k) == "string" then
				ret = ret..'"'..k..'"'
			else
				ret = ret..k
			end

			if type(v) == "table" then
				tinsert(lineStructureTable, k)
				sameLine = true
				ret = ret.."]"
				ret = recurse(v, ret, profileText)
			else
				sameLine = false
				ret = ret.."] = "

				if type(v) == "number" then
					ret = ret..v.."\n"
				elseif type(v) == "string" then
					ret = ret.."\""..v:gsub("\\", "\\\\"):gsub("\n", "\\n"):gsub("\"", "\\\""):gsub("\124", "\124\124").."\"\n"
				elseif type(v) == "boolean" then
					if v then
						ret = ret.."true\n"
					else
						ret = ret.."false\n"
					end
				else
					ret = ret.."\""..tostring(v).."\"\n"
				end
			end
		end

		tremove(lineStructureTable)

		return ret
	end

	function E:ProfileTableToPluginFormat(inTable, profileType)
		local profileText = profileFormat[profileType]
		if not profileText then return end

		twipe(lineStructureTable)
		local ret = ""
		if inTable and profileType then
			sameLine = false
			ret = recurse(inTable, ret, profileText)
		end

		return ret
	end
end

do	--Split string by multi-character delimiter (the strsplit / string.split function provided by WoW doesn't allow multi-character delimiter)
	local splitTable = {}
	function E:SplitString(str, delim)
		assert(type (delim) == "string" and strlen(delim) > 0, "bad delimiter")

		local start = 1
		twipe(splitTable) -- results table

		-- find each instance of a string followed by the delimiter
		while true do
			local pos = find(str, delim, start, true) -- plain find
			if not pos then break end

			tinsert(splitTable, sub(str, start, pos - 1))
			start = pos + strlen(delim)
		end -- while

		-- insert final one (after last delimiter)
		tinsert(splitTable, sub(str, start))

		return unpack(splitTable)
	end
end

do
	local SendMessageWaiting -- only allow 1 delay at a time regardless of eventing
	function E:SendMessage()
		if GetNumRaidMembers() > 1 then
			local _, instanceType = IsInInstance()
			if instanceType == "pvp" then
				SendAddonMessage("ELVUI_VERSIONCHK", E.version, "BATTLEGROUND")
			else
				SendAddonMessage("ELVUI_VERSIONCHK", E.version, "RAID")
			end
		elseif GetNumPartyMembers() > 0 then
			SendAddonMessage("ELVUI_VERSIONCHK", E.version, "PARTY")
		elseif IsInGuild() then
			SendAddonMessage("ELVUI_VERSIONCHK", E.version, "GUILD")
		end

		SendMessageWaiting = nil
	end

	local SendRecieveGroupSize = 0
	local myRealm = gsub(E.myrealm, "[%s%-]", "")
	local myName = E.myname.."-"..myRealm
	local function SendRecieve(_, event, prefix, message, _, sender)
		if event == "CHAT_MSG_ADDON" then
			if sender == myName then return end

			if prefix == "ELVUI_VERSIONCHK" then
				local msg, ver = tonumber(message), E.version
				local inCombat = InCombatLockdown()

				E.UserList[gsub(sender, "%-"..myRealm, "")] = msg
				if ver ~= G.general.version then
					if not E.shownUpdatedWhileRunningPopup and not inCombat then
						E:StaticPopup_Show("ELVUI_UPDATED_WHILE_RUNNING", nil, nil, {mismatch = ver > G.general.version})

						E.shownUpdatedWhileRunningPopup = true
					end
				elseif msg and (msg > ver) then -- you're outdated D:
					if not E.recievedOutOfDateMessage then
						E:Print(L["ElvUI is out of date. You can download the newest version from https://github.com/ElvUI-Cataclysm"])

						if msg and ((msg - ver) >= 0.01) and not inCombat then
							E:StaticPopup_Show("ELVUI_UPDATE_AVAILABLE")
						end

						E.recievedOutOfDateMessage = true
					end
				end
			end
		elseif event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE" then
			local numRaid, numParty = GetNumRaidMembers(), GetNumPartyMembers() + 1
			local num = numRaid > 0 and numRaid or numParty
			if num ~= SendRecieveGroupSize then
				if num > 1 and num > SendRecieveGroupSize then
					if not SendMessageWaiting then
						SendMessageWaiting = E:Delay(10, E.SendMessage)
					end
				end
				SendRecieveGroupSize = num
			end
		elseif event == "PLAYER_ENTERING_WORLD" then
			if not SendMessageWaiting then
				SendMessageWaiting = E:Delay(10, E.SendMessage)
			end
		end
	end

	RegisterAddonMessagePrefix("ELVUI_VERSIONCHK")

	local f = CreateFrame("Frame")
	f:RegisterEvent("CHAT_MSG_ADDON")
	f:RegisterEvent("RAID_ROSTER_UPDATE")
	f:RegisterEvent("PARTY_MEMBERS_CHANGED")
	f:RegisterEvent("PLAYER_ENTERING_WORLD")
	f:SetScript("OnEvent", SendRecieve)
end

function E:UpdateAll(ignoreInstall)
	E.private = E.charSettings.profile
	E.db = E.data.profile
	E.global = E.data.global
	E.db.theme = nil
	E.db.install_complete = nil

	E:DBConversions()

	ActionBars.db = E.db.actionbar
	Auras.db = E.db.auras
	Bags.db = E.db.bags
	Chat.db = E.db.chat
	DataBars.db = E.db.databars
	DataTexts.db = E.db.datatexts
	NamePlates.db = E.db.nameplates
	Threat.db = E.db.general.threat
	Tooltip.db = E.db.tooltip
	Totems.db = E.db.general.totems
	ReminderBuffs.db = E.db.general.reminder
	UnitFrames.db = E.db.unitframe

	--The mover is positioned before it is resized, which causes issues for unitframes
	--Allow movers to be "pushed" outside the screen, when they are resized they should be back in the screen area.
	--We set movers to be clamped again at the bottom of this function.
	E:SetMoversClampedToScreen(false)
	E:SetMoversPositions()

	E:UpdateMedia()
	E:UpdateBorderColors()
	E:UpdateBackdropColors()
	E:UpdateFrameTemplates()
	E:UpdateStatusBars()
	E:UpdateCooldownSettings("all")

	Layout:ToggleChatPanels()
	Layout:BottomPanelVisibility()
	Layout:TopPanelVisibility()
	Layout:SetDataPanelStyle()

	if E.private.actionbar.enable then
		ActionBars:Extra_SetAlpha()
		ActionBars:Extra_SetScale()
		ActionBars:ToggleDesaturation()
		ActionBars:UpdateButtonSettings()
		ActionBars:UpdateMicroPositionDimensions()
	end

	AFK:Toggle()

	if E.private.bags.enable then
		Bags:Layout()
		Bags:Layout(true)
		Bags:SizeAndPositionBagBar()
		Bags:UpdateCountDisplay()
		Bags:UpdateItemLevelDisplay()
	end

	if E.private.chat.enable then
		Chat:PositionChat(true)
		Chat:SetupChat()
		Chat:UpdateAnchors()
	end

	DataBars:EnableDisable_ExperienceBar()
	DataBars:EnableDisable_ReputationBar()
	DataBars:UpdateDataBarDimensions()

	DataTexts:LoadDataTexts()

	if E.private.general.minimap.enable then
		Minimap:UpdateSettings()
	end

	if E.private.nameplates.enable then
		NamePlates:ConfigureAll()
		NamePlates:StyleFilterInitialize()
	end

	Threat:ToggleEnable()
	Threat:UpdatePosition()

	Totems:PositionAndSize()
	Totems:ToggleEnable()

	ReminderBuffs:UpdateSettings()

	if E.private.unitframe.enable then
		UnitFrames:Update_AllFrames()
	end

	if ElvUIPlayerBuffs then
		Auras:UpdateHeader(ElvUIPlayerBuffs)
	end

	if ElvUIPlayerDebuffs then
		Auras:UpdateHeader(ElvUIPlayerDebuffs)
	end

	if E.RefreshGUI then
		E:RefreshGUI()
	end

	if (ignoreInstall ~= true) and (E.private.install_complete == nil or (E.private.install_complete and type(E.private.install_complete) == "boolean") or (E.private.install_complete and type(tonumber(E.private.install_complete)) == "number" and tonumber(E.private.install_complete) <= 3.83)) then
		E:Install()
	end

	Blizzard:SetWatchFrameHeight()
	E:SetMoversClampedToScreen(true) -- Go back to using clamp after resizing has taken place.
end

do
	E.ObjectEventTable, E.ObjectEventFrame = {}, CreateFrame("Frame")
	local eventFrame, eventTable = E.ObjectEventFrame, E.ObjectEventTable

	eventFrame:SetScript("OnEvent", function(_, event, ...)
		local objs = eventTable[event]
		if objs then
			for object, funcs in pairs(objs) do
				for _, func in ipairs(funcs) do
					func(object, event, ...)
				end
			end
		end
	end)

	function E:HasFunctionForObject(event, object, func)
		if not (event and object and func) then
			E:Print("Error. Usage: HasFunctionForObject(event, object, func)")
			return
		end

		local objs = eventTable[event]
		local funcs = objs and objs[object]
		return funcs and tContains(funcs, func)
	end

	function E:IsEventRegisteredForObject(event, object)
		if not (event and object) then
			E:Print("Error. Usage: IsEventRegisteredForObject(event, object)")
			return
		end

		local objs = eventTable[event]
		local funcs = objs and objs[object]
		return funcs ~= nil, funcs
	end

	--- Registers specified event and adds specified func to be called for the specified object.
	-- Unless all parameters are supplied it will not register.
	-- If the specified object has already been registered for the specified event
	-- then it will just add the specified func to a table of functions that should be called.
	-- When a registered event is triggered, then the registered function is called with
	-- the object as first parameter, then event, and then all the parameters for the event itself.
	-- @param event The event you want to register.
	-- @param object The object you want to register the event for.
	-- @param func The function you want executed for this object.
	function E:RegisterEventForObject(event, object, func)
		if not (event and object and func) then
			E:Print("Error. Usage: RegisterEventForObject(event, object, func)")
			return
		end

		local objs = eventTable[event]
		if not objs then
			objs = {}
			eventTable[event] = objs
			eventFrame:RegisterEvent(event)
		end

		local funcs = objs[object]
		if not funcs then
			objs[object] = {func}
		elseif not tContains(funcs, func) then
			tinsert(funcs, func)
		end
	end

	--- Unregisters specified function for the specified object on the specified event.
	-- Unless all parameters are supplied it will not unregister.
	-- @param event The event you want to unregister an object from.
	-- @param object The object you want to unregister a func from.
	-- @param func The function you want unregistered for the object.
	function E:UnregisterEventForObject(event, object, func)
		if not (event and object and func) then
			E:Print("Error. Usage: UnregisterEventForObject(event, object, func)")
			return
		end

		local objs = eventTable[event]
		local funcs = objs and objs[object]
		if funcs then
			for index, fnc in ipairs(funcs) do
				if func == fnc then
					tremove(funcs, index)
					break
				end
			end

			if #funcs == 0 then
				objs[object] = nil
			end

			if not next(funcs) then
				eventFrame:UnregisterEvent(event)
				eventTable[event] = nil
			end
		end
	end
end

function E:ResetAllUI()
	self:ResetMovers()

	if E.db.layoutSet then
		E:SetupLayout(E.db.layoutSet, true)
	end
end

function E:ResetUI(...)
	if InCombatLockdown() then E:Print(ERR_NOT_IN_COMBAT) return end

	if ... == "" or ... == " " or ... == nil then
		E:StaticPopup_Show("RESETUI_CHECK")
		return
	end

	self:ResetMovers(...)
end

function E:CallLoadedModule(obj, silent, object, index)
	local name, func
	if type(obj) == "table" then name, func = unpack(obj) else name = obj end
	local module = name and self:GetModule(name, silent)

	if not module then return end
	if func and type(func) == "string" then
		E:RegisterCallback(name, module[func], module)
	elseif func and type(func) == "function" then
		E:RegisterCallback(name, func, module)
	elseif module.Initialize then
		E:RegisterCallback(name, module.Initialize, module)
	end

	E.callbacks:Fire(name)

	if object and index then object[index] = nil end
end

function E:RegisterInitialModule(name, func)
	self.RegisteredInitialModules[#self.RegisteredInitialModules + 1] = (func and {name, func}) or name
end

function E:RegisterModule(name, func)
	if self.initialized then
		E:CallLoadedModule((func and {name, func}) or name)
	else
		self.RegisteredModules[#self.RegisteredModules + 1] = (func and {name, func}) or name
	end
end

function E:InitializeInitialModules()
	for index, object in ipairs(E.RegisteredInitialModules) do
		E:CallLoadedModule(object, true, E.RegisteredInitialModules, index)
	end
end

function E:InitializeModules()
	for index, object in ipairs(E.RegisteredModules) do
		E:CallLoadedModule(object, true, E.RegisteredModules, index)
	end
end

local function buffwatchConvert(spell)
	if spell.sizeOverride then spell.sizeOverride = nil end
	if spell.size then spell.size = nil end

	if not spell.sizeOffset then
		spell.sizeOffset = 0
	end

	if spell.styleOverride then
		spell.style = spell.styleOverride
		spell.styleOverride = nil
	elseif not spell.style then
		spell.style = "coloredIcon"
	end
end

function E:DBConversions()
	--Fix issue where UIScale was incorrectly stored as string
	E.global.general.UIScale = tonumber(E.global.general.UIScale)

	--Not sure how this one happens, but prevent it in any case
	if E.global.general.UIScale <= 0 then
		E.global.general.UIScale = G.general.UIScale
	end

	--Combat & Resting Icon options update
	if E.db.unitframe.units.player.combatIcon ~= nil then
		E.db.unitframe.units.player.CombatIcon.enable = E.db.unitframe.units.player.combatIcon
		E.db.unitframe.units.player.combatIcon = nil
	end
	if E.db.unitframe.units.player.restIcon ~= nil then
		E.db.unitframe.units.player.RestIcon.enable = E.db.unitframe.units.player.restIcon
		E.db.unitframe.units.player.restIcon = nil
	end

	-- [Fader] Combat Fade options for Player
	if E.db.unitframe.units.player.combatfade ~= nil then
		local enabled = E.db.unitframe.units.player.combatfade
		E.db.unitframe.units.player.fader.enable = enabled

		if enabled then -- use the old min alpha too
			E.db.unitframe.units.player.fader.minAlpha = 0
		end

		E.db.unitframe.units.player.combatfade = nil
	end

	-- [Fader] Range check options for Units
	do
		local outsideAlpha
		if E.db.unitframe.OORAlpha ~= nil then
			outsideAlpha = E.db.unitframe.OORAlpha
			E.db.unitframe.OORAlpha = nil
		end

		for _, unit in pairs({"target", "targettarget", "targettargettarget", "focus", "focustarget", "pet", "pettarget", "boss", "arena", "party", "raid", "raid40", "raidpet", "tank", "assist"}) do
			if E.db.unitframe.units[unit].rangeCheck ~= nil then
				local enabled = E.db.unitframe.units[unit].rangeCheck
				E.db.unitframe.units[unit].fader.enable = enabled
				E.db.unitframe.units[unit].fader.range = enabled

				if outsideAlpha then
					E.db.unitframe.units[unit].fader.minAlpha = outsideAlpha
				end

				E.db.unitframe.units[unit].rangeCheck = nil
			end
		end
	end

	--Convert old "Buffs and Debuffs" font size option to individual options
	if E.db.auras.fontSize then
		local fontSize = E.db.auras.fontSize
		E.db.auras.buffs.countFontSize = fontSize
		E.db.auras.buffs.durationFontSize = fontSize
		E.db.auras.debuffs.countFontSize = fontSize
		E.db.auras.debuffs.durationFontSize = fontSize
		E.db.auras.fontSize = nil
	end

	--Remove stale font settings from Cooldown system for top auras
	if E.db.auras.cooldown.fonts then
		E.db.auras.cooldown.fonts = nil
	end

	--Convert old private cooldown setting to profile setting
	if E.private.cooldown and (E.private.cooldown.enable ~= nil) then
		E.db.cooldown.enable = E.private.cooldown.enable
		E.private.cooldown.enable = nil
		E.private.cooldown = nil
	end

	--Convert cropIcon to tristate
	local cropIcon = E.db.general.cropIcon
	if type(cropIcon) == "boolean" then
		E.db.general.cropIcon = (cropIcon and 2) or 0
	end

	--Vendor Greys option is now in bags table
	if E.db.general.vendorGrays ~= nil then
		E.db.bags.vendorGrays.enable = E.db.general.vendorGrays
		E.db.general.vendorGraysDetails = nil
		E.db.general.vendorGrays = nil
	end

	--Heal Prediction is now a table instead of a bool
	for _, unit in pairs({"player", "target", "focus", "pet", "arena", "party", "raid", "raid40", "raidpet"}) do
		if type(E.db.unitframe.units[unit].healPrediction) ~= "table" then
			local enabled = E.db.unitframe.units[unit].healPrediction
			E.db.unitframe.units[unit].healPrediction = {}
			E.db.unitframe.units[unit].healPrediction.enable = enabled
		end
	end

	--Health Backdrop Multiplier
	if E.db.unitframe.colors.healthmultiplier ~= nil then
		if E.db.unitframe.colors.healthmultiplier > 0.75 then
			E.db.unitframe.colors.healthMultiplier = 0.75
		else
			E.db.unitframe.colors.healthMultiplier = E.db.unitframe.colors.healthmultiplier
		end

		E.db.unitframe.colors.healthmultiplier = nil
	end

	-- removed override stuff from aurawatch
	for _, spells in pairs(E.global.unitframe.buffwatch) do
		for _, spell in pairs(spells) do
			buffwatchConvert(spell)
		end
	end
	for _, spell in pairs(E.db.unitframe.filters.buffwatch) do
		buffwatchConvert(spell)
	end

	-- fix aurabars colors
	local auraBarColors = E.global.unitframe.AuraBarColors
	for spell, info in pairs(auraBarColors) do
		if type(spell) == "string" then
			local spellID = select(7, GetSpellInfo(spell))
			if spellID and not auraBarColors[spellID] then
				auraBarColors[spellID] = info
				auraBarColors[spell] = nil
				spell = spellID
			end
		end

		if type(info) == "boolean" then
			auraBarColors[spell] = {color = {r = 1, g = 1, b = 1}, enable = info}
		elseif type(info) == "table" then
			if info.r or info.g or info.b then
				auraBarColors[spell] = {color = {r = info.r or 1, g = info.g or 1, b = info.b or 1}, enable = true}
			elseif info.color then -- azil created a void hole, delete it -x-
				if info.color.color then info.color.color = nil end
				if info.color.enable then info.color.enable = nil end
				if info.color.a then info.color.a = nil end -- alpha isnt supported by this
			end
		end
	end

	if E.db.unitframe.colors.debuffHighlight.blendMode == "MOD" then
		E.db.unitframe.colors.debuffHighlight.blendMode = P.unitframe.colors.debuffHighlight.blendMode
	end
end

function E:RefreshModulesDB()
	-- this function is specifically used to reference the new database
	-- onto the unitframe module, its useful dont delete! D:
	twipe(UnitFrames.db) --old ref, dont need so clear it
	UnitFrames.db = self.db.unitframe --new ref
end

function E:Initialize()
	twipe(self.db)
	twipe(self.global)
	twipe(self.private)

	self.myguid = UnitGUID("player")
	self.data = E.Libs.AceDB:New("ElvDB", self.DF)
	self.data.RegisterCallback(self, "OnProfileChanged", "UpdateAll")
	self.data.RegisterCallback(self, "OnProfileCopied", "UpdateAll")
	self.data.RegisterCallback(self, "OnProfileReset", "OnProfileReset")
	self.charSettings = E.Libs.AceDB:New("ElvPrivateDB", self.privateVars)
	E.Libs.DualSpec:EnhanceDatabase(self.data, "ElvUI")
	self.private = self.charSettings.profile
	self.db = self.data.profile
	self.global = self.data.global

	self:CheckIncompatible()
	self:DBConversions()
	self:UIScale()
	self:BuildPrefixValues()
	self:LoadAPI()
	self:LoadCommands()
	self:InitializeModules()
	self:RefreshModulesDB()
	self:LoadMovers()
	self:UpdateMedia()
	self:UpdateCooldownSettings("all")
	self:Tutorials()
	self.initialized = true

	Minimap:UpdateSettings()

	if E.db.general.smoothingAmount and (E.db.general.smoothingAmount ~= 0.33) then
		E:SetSmoothingAmount(E.db.general.smoothingAmount)
	end

	if self.private.install_complete == nil then
		self:Install()
	end

	if self:HelloKittyFixCheck() then
		self:HelloKittyFix()
	end

	if self.db.general.kittys then
		self:CreateKittys()
		self:Delay(5, self.Print, self, L["Type /hellokitty to revert to old settings."])
	end

	if self.db.general.loginmessage then
		local msg = format(L["LOGIN_MSG"], self.media.hexvaluecolor, self.media.hexvaluecolor, self.version)
		if Chat.Initialized then msg = select(2, Chat:FindURL("CHAT_MSG_DUMMY", msg)) end
		E:Print(msg)
	end
end