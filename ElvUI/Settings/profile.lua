﻿local E, L, V, P, G = unpack(select(2, ...))

P.gridSize = 64
P.farmSize = 340

--Core
P["general"] = {
	["taingLog"] = false,
	["stickyFrames"] = true,
	["loginmessage"] = true,
	["interruptAnnounce"] = "NONE",
	["autoRepair"] = "NONE",
	["autoRoll"] = false,
	["autoAcceptInvite"] = false,
	["vendorGrays"] = false,
	["vendorGraysDetails"] = false,
	["bottomPanel"] = true,
	["hideErrorFrame"] = true,
	["errorFrame"] = {
		["height"] = 60,
		["width"] = 300
	},
	["enhancedPvpMessages"] = true,
	["watchFrameHeight"] = 480,
	["afk"] = true,
	["numberPrefixStyle"] = "ENGLISH",
	["decimalLength"] = 1,

	["fontSize"] = 12,
	["font"] = "PT Sans Narrow",

	["bordercolor"] = {r = 0, g = 0, b = 0},
	["backdropcolor"] = {r = 0.1, g = 0.1, b = 0.1},
	["backdropfadecolor"] = {r = .06, g = .06, b = .06, a = 0.8},
	["valuecolor"] = {r = 254/255, g = 123/255, b = 44/255},

	["minimap"] = {
		["size"] = 176,
		["locationText"] = "MOUSEOVER",
		["locationFontSize"] = 12,
		["locationFontOutline"] = "OUTLINE",
		["locationFont"] = "PT Sans Narrow",
		["resetZoom"] = {
			["enable"] = false,
			["time"] = 3
		},
		["icons"] = {
			["calendar"] = {
				["scale"] = 1,
				["position"] = "TOPRIGHT",
				["xOffset"] = 0,
				["yOffset"] = 0,
			},
			["mail"] = {
				["scale"] = 1,
				["position"] = "TOPRIGHT",
				["xOffset"] = 3,
				["yOffset"] = 4
			},
			["lfgEye"] = {
				["scale"] = 1,
				["position"] = "BOTTOMRIGHT",
				["xOffset"] = 1,
				["yOffset"] = 30
			},
			["battlefield"] = {
				["scale"] = 1,
				["position"] = "BOTTOMRIGHT",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["difficulty"] = {
				["scale"] = 1,
				["position"] = "TOPLEFT",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["vehicleLeave"] = {
				["scale"] = 1,
				["position"] = "BOTTOMLEFT",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["hide"] = false
			},
			["ticket"] = {
				["scale"] = 1,
				["position"] = "TOPRIGHT",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["worldMap"] = {
				["scale"] = 1,
				["position"] = "TOP",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["zoomIn"] = {
				["scale"] = 1,
				["position"] = "BOTTOMLEFT",
				["xOffset"] = -8,
				["yOffset"] = 16
			},
			["zoomOut"] = {
				["scale"] = 1,
				["position"] = "BOTTOMLEFT",
				["xOffset"] = -8,
				["yOffset"] = -8
			}
		}
	},
	["threat"] = {
		["enable"] = true,
		["position"] = "RIGHTCHAT",
		["textfont"] = "PT Sans Narrow",
		["textSize"] = 12,
		["textOutline"] = "OUTLINE"
	},
	["totems"] = {
		["enable"] = true,
		["growthDirection"] = "VERTICAL",
		["sortDirection"] = "ASCENDING",
		["size"] = 40,
		["spacing"] = 4
	},
	["reminder"] = {
		["enable"] = true,
		["durations"] = true,
		["reverse"] = true,
		["position"] = "RIGHT",
		["font"] = "Homespun",
		["fontSize"] = 10,
		["fontOutline"] = "MONOCHROMEOUTLINE"
	},
	["kittys"] = false
}

--DataBars
P["databars"] = {
	["experience"] = {
		["enable"] = true,
		["width"] = 10,
		["height"] = 180,
		["textFormat"] = "NONE",
		["textSize"] = 11,
		["font"] = "PT Sans Narrow",
		["fontOutline"] = "NONE",
		["mouseover"] = false,
		["orientation"] = "VERTICAL",
		["hideAtMaxLevel"] = true,
		["hideInVehicle"] = false,
		["reverseFill"] = false,
		["hideInCombat"] = false
	},
	["reputation"] = {
		["enable"] = false,
		["width"] = 10,
		["height"] = 180,
		["textFormat"] = "NONE",
		["textSize"] = 11,
		["font"] = "PT Sans Narrow",
		["fontOutline"] = "NONE",
		["mouseover"] = false,
		["orientation"] = "VERTICAL",
		["hideInVehicle"] = false,
		["reverseFill"] = false,
		["hideInCombat"] = false
	}
}

--Bags
P["bags"] = {
	["sortInverted"] = true,
	["bagSize"] = 34,
	["bankSize"] = 34,
	["bagWidth"] = 406,
	["bankWidth"] = 406,
	["currencyFormat"] = "ICON_TEXT_ABBR",
	["moneyFormat"] = "SMART",
	["moneyCoins"] = true,
	["ignoredItems"] = {},
	["itemLevel"] = true,
	["itemLevelThreshold"] = 1,
	["itemLevelFont"] = "Homespun",
	["itemLevelFontSize"] = 10,
	["itemLevelFontOutline"] = "MONOCHROMEOUTLINE",
	["countFont"] = "Homespun",
	["countFontSize"] = 10,
	["countFontOutline"] = "MONOCHROMEOUTLINE",
	["countFontColor"] = {r = 1, g = 1, b = 1},
	["clearSearchOnClose"] = false,
	["disableBagSort"] = false,
	["disableBankSort"] = false,
	["cooldown"] = {
		["threshold"] = 4,
		["override"] = false,
		["expiringColor"] = {r = 1, g = 0, b = 0},
		["secondsColor"] = {r = 1, g = 1, b = 1},
		["minutesColor"] = {r = 1, g = 1, b = 1},
		["hoursColor"] = {r = 1, g = 1, b = 1},
		["daysColor"] = {r = 1, g = 1, b = 1},
	},
	["bagBar"] = {
		["growthDirection"] = "VERTICAL",
		["sortDirection"] = "ASCENDING",
		["size"] = 30,
		["spacing"] = 4,
		["backdropSpacing"] = 4,
		["showBackdrop"] = false,
		["mouseover"] = false,
		["visibility"] = "",
	}
}

--NamePlate
P["nameplates"] = {
	["statusbar"] = "ElvUI Norm",
	["font"] = "PT Sans Narrow",
	["fontSize"] = 11,
	["fontOutline"] = "OUTLINE",
	["healthFont"] = "PT Sans Narrow",
	["healthFontSize"] = 11,
	["healthFontOutline"] = "OUTLINE",
	["durationFont"] = "PT Sans Narrow",
	["durationFontSize"] = 10,
	["durationFontOutline"] = "OUTLINE",
	["durationPosition"] = "CENTER",
	["stackFont"] = "PT Sans Narrow",
	["stackFontSize"] = 8,
	["stackFontOutline"] = "OUTLINE",
	["useTargetScale"] = true,
	["targetScale"] = 1.15,
	["nonTargetTransparency"] = 0.40,
	["motionType"] = "STACKED",
	["lowHealthThreshold"] = 0.4,
	["showFriendlyCombat"] = "DISABLED",
	["showEnemyCombat"] = "DISABLED",
	["targetGlow"] = "style2",
	["glowColor"] = {r = 77/255, g = 179/255, b = 255/255, a = 1},
	["nameColoredGlow"] = false,
	["alwaysShowTargetHealth"] = true,
	["castColor"] = {r = 1, g = 208/255, b = 0},
	["castNoInterruptColor"] = {r = 0.78, g = 0.25, b = 0.25},
	["comboPoints"] = true,
	["cooldown"] = {
		["threshold"] = 4,
		["override"] = true,
		["expiringColor"] = {r = 1, g = 0, b = 0},
		["secondsColor"] = {r = 1, g = 1, b = 1},
		["minutesColor"] = {r = 1, g = 1, b = 1},
		["hoursColor"] = {r = 1, g = 1, b = 1},
		["daysColor"] = {r = 1, g = 1, b = 1},
	},
	["reactions"] = {
		["friendlyPlayer"] = {r = 75/255, g = 175/255, b = 76/255},
		["good"] = {r = 0.31, g = 0.45, b = 0.63},
		["neutral"] = {r = 218/255, g = 197/255, b = 92/255},
		["bad"] = {r = 0.78, g = 0.25, b = 0.25},
	},
	["threat"] = {
		["goodColor"] = {r = 75/255, g = 175/255, b = 76/255},
		["badColor"] = {r = 0.78, g = 0.25, b = 0.25},
		["goodTransition"] = {r = 218/255, g = 197/255, b = 92/255},
		["badTransition"] = {r = 235/255, g = 163/255, b = 40/255},
		["beingTankedByTankColor"] = {r = .8, g = 0.1, b = 1},
		["beingTankedByTank"] = true,
		["goodScale"] = 0.8,
		["badScale"] = 1.2,
		["useThreatColor"] = true,
	},
	["filters"] = {
		["Boss"] = {
			["triggers"] = {
				["enable"] = false,
			}
		}
	},
	["units"] = {
		["FRIENDLY_PLAYER"] = {
			["healthbar"] = {
				["enable"] = false,
				["height"] = 10,
				["width"] = 120,
				["glowStyle"] = "TARGET_THREAT",
				["text"] = {
					["enable"] = false,
					["format"] = "CURRENT",
				},
				["useClassColor"] = true,
			},
			["showName"] = true,
			["showLevel"] = false,
			["castbar"] = {
				["enable"] = true,
				["height"] = 8,
				["offset"] = 1,
				["hideSpellName"] = false,
				["hideTime"] = false,
				["castTimeFormat"] = "CURRENT",
				["channelTimeFormat"] = "CURRENT",
				["timeToHold"] = 0,
				["iconPosition"] = "RIGHT",
			},
			["buffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,blockNoDuration,Personal,TurtleBuffs" --NamePlate FriendlyPlayer Buffs
				}
			},
			["debuffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,blockNoDuration,Personal,CCDebuffs" --NamePlate FriendlyPlayer Debuffs
				}
			},
			["name"] = {
				["useClassColor"] = false,
			}
		},
		["ENEMY_PLAYER"] = {
			["markHealers"] = true,
			["healthbar"] = {
				["enable"] = true,
				["height"] = 10,
				["width"] = 120,
				["glowStyle"] = "TARGET_THREAT",
				["text"] = {
					["enable"] = false,
					["format"] = "CURRENT",
				},
				["useClassColor"] = true,
			},
			["showName"] = true,
			["showLevel"] = true,
			["castbar"] = {
				["enable"] = true,
				["height"] = 8,
				["offset"] = 1,
				["hideSpellName"] = false,
				["hideTime"] = false,
				["castTimeFormat"] = "CURRENT",
				["channelTimeFormat"] = "CURRENT",
				["timeToHold"] = 0,
				["iconPosition"] = "RIGHT",
			},
			["buffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,PlayerBuffs,TurtleBuffs" --NamePlate EnemyPlayer Buffs
				}
			},
			["debuffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,blockNoDuration,Personal,CCDebuffs,RaidDebuffs" --NamePlate EnemyPlayer Debuffs
				}
			},
			["name"] = {
				["useClassColor"] = true,
			}
		},
		["FRIENDLY_NPC"] = {
			["healthbar"] = {
				["enable"] = false,
				["height"] = 10,
				["width"] = 120,
				["glowStyle"] = "TARGET_THREAT",
				["text"] = {
					["enable"] = false,
					["format"] = "CURRENT",
				}
			},
			["showName"] = true,
			["showLevel"] = true,
			["castbar"] = {
				["enable"] = true,
				["height"] = 8,
				["offset"] = 1,
				["hideSpellName"] = false,
				["hideTime"] = false,
				["castTimeFormat"] = "CURRENT",
				["channelTimeFormat"] = "CURRENT",
				["timeToHold"] = 0,
				["iconPosition"] = "RIGHT",
			},
			["buffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,blockNoDuration,Personal,TurtleBuffs" --NamePlate FriendlyNPC Buffs
				}
			},
			["debuffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,CCDebuffs,RaidDebuffs" --NamePlate FriendlyNPC Debuffs
				}
			},
			["eliteIcon"] = {
				["enable"] = false,
				["size"] = 15,
				["position"] = "RIGHT",
				["xOffset"] = 10,
				["yOffset"] = 0,
			},
			["name"] = {
				["useReactionColor"] = false,
			}
		},
		["ENEMY_NPC"] = {
			["healthbar"] = {
				["enable"] = true,
				["height"] = 10,
				["width"] = 120,
				["glowStyle"] = "TARGET_THREAT",
				["text"] = {
					["enable"] = false,
					["format"] = "CURRENT",
				},
			},
			["showName"] = true,
			["showLevel"] = true,
			["castbar"] = {
				["enable"] = true,
				["height"] = 8,
				["offset"] = 1,
				["hideSpellName"] = false,
				["hideTime"] = false,
				["castTimeFormat"] = "CURRENT",
				["channelTimeFormat"] = "CURRENT",
				["timeToHold"] = 0,
				["iconPosition"] = "RIGHT",
			},
			["buffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,blockNoDuration,PlayerBuffs,TurtleBuffs" --NamePlate EnemyNPC Buffs
				},
			},
			["debuffs"] = {
				["enable"] = true,
				["numAuras"] = 4,
				["baseHeight"] = 18,
				["filters"] = {
					["minDuration"] = 0,
					["maxDuration"] = 0,
					["priority"] = "Blacklist,Personal,CCDebuffs" --NamePlate EnemyNPC Debuffs
				}
			},
			["eliteIcon"] = {
				["enable"] = false,
				["size"] = 15,
				["position"] = "RIGHT",
				["xOffset"] = 10,
				["yOffset"] = 0,
			},
			["name"] = {
				["useReactionColor"] = false,
			}
		}
	}
}

--Auras
P["auras"] = {
	["font"] = "Homespun",
	["fontOutline"] = "MONOCHROMEOUTLINE",
	["countYOffset"] = 0,
	["countXOffset"] = 0,
	["timeYOffset"] = 0,
	["timeXOffset"] = 0,
	["fadeThreshold"] = 6,
	["buffs"] = {
		["growthDirection"] = "LEFT_DOWN",
		["wrapAfter"] = 12,
		["maxWraps"] = 3,
		["horizontalSpacing"] = 6,
		["verticalSpacing"] = 16,
		["sortMethod"] = "TIME",
		["sortDir"] = "-",
		["seperateOwn"] = 1,
		["size"] = 32,
		["countFontsize"] = 10,
		["durationFontSize"] = 10,
	},
	["debuffs"] = {
		["growthDirection"] = "LEFT_DOWN",
		["wrapAfter"] = 12,
		["maxWraps"] = 1,
		["horizontalSpacing"] = 6,
		["verticalSpacing"] = 16,
		["sortMethod"] = "TIME",
		["sortDir"] = "-",
		["seperateOwn"] = 1,
		["size"] = 32,
		["countFontsize"] = 10,
		["durationFontSize"] = 10,
	},
	["weapons"] = {
		["font"] = "Homespun",
		["fontSize"] = 10,
		["fontOutline"] = "MONOCHROMEOUTLINE",
		["size"] = 32,
		["spacing"] = 6,
		["growthDirection"] = "RIGHT_LEFT",
	},
	["cooldown"] = {
		["threshold"] = 4,
		["override"] = true,
		["expiringColor"] = {r = 1, g = 0, b = 0},
		["secondsColor"] = {r = 1, g = 1, b = 1},
		["minutesColor"] = {r = 1, g = 1, b = 1},
		["hoursColor"] = {r = 1, g = 1, b = 1},
		["daysColor"] = {r = 1, g = 1, b = 1},
	}
}

--Chat
P["chat"] = {
	["lockPositions"] = true,
	["url"] = true,
	["shortChannels"] = true,
	["hyperlinkHover"] = true,
	["throttleInterval"] = 45,
	["scrollDownInterval"] = 15,
	["fade"] = true,
	["font"] = "PT Sans Narrow",
	["fontOutline"] = "NONE",
	["sticky"] = true,
	["emotionIcons"] = true,
	["keywordSound"] = "None",
	["whisperSound"] = "Whisper Alert",
	["noAlertInCombat"] = false,
	["chatHistory"] = true,
	["lfgIcons"] = false,
	["timeStampFormat"] = "NONE",
	["keywords"] = "%MYNAME%, ElvUI",
	["separateSizes"] = false,
	["panelWidth"] = 412,
	["panelHeight"] = 180,
	["panelWidthRight"] = 412,
	["panelHeightRight"] = 180,
	["panelBackdropNameLeft"] = "",
	["panelBackdropNameRight"] = "",
	["panelBackdrop"] = "SHOWBOTH",
	["panelTabBackdrop"] = false,
	["panelTabTransparency"] = false,
	["editBoxPosition"] = "BELOW_CHAT",
	["fadeUndockedTabs"] = true,
	["fadeTabsNoBackdrop"] = true,
	["useAltKey"] = false,
	["classColorMentionsChat"] = true,
	["numAllowedCombatRepeat"] = 3,
	["useCustomTimeColor"] = true,
	["customTimeColor"] = {r = 0.7, g = 0.7, b = 0.7},
	["numScrollMessages"] = 3,

	["tabFont"] = "PT Sans Narrow",
	["tabFontSize"] = 12,
	["tabFontOutline"] = "NONE",
}

--Datatexts
P["datatexts"] = {
	["font"] = "PT Sans Narrow",
	["fontSize"] = 12,
	["fontOutline"] = "OUTLINE",
	["wordWrap"] = false,
	["panels"] = {
		["LeftChatDataPanel"] = {
			["left"] = "Armor",
			["middle"] = "Durability",
			["right"] = "Avoidance"
		},
		["RightChatDataPanel"] = {
			["left"] = "System",
			["middle"] = "Time",
			["right"] = "Gold"
		},
		["LeftMiniPanel"] = "Guild",
		["RightMiniPanel"] = "Friends",
		["BottomMiniPanel"] = "",
		["TopMiniPanel"] = "",
		["BottomLeftMiniPanel"] = "",
		["BottomRightMiniPanel"] = "",
		["TopRightMiniPanel"] = "",
		["TopLeftMiniPanel"] = ""
	},
	["timeFormat"] = "%I:%M",
	["dateFormat"] = "",
	["battleground"] = true,
	["panelTransparency"] = false,
	["panelBackdrop"] = true,
	["goldFormat"] = "BLIZZARD",
	["goldCoins"] = true,
	["noCombatClick"] = false,
	["noCombatHover"] = false,
	["friends"] = {
		["hideAFK"] = false,
		["hideDND"] = false,
	},
	["currencies"] = {
		["displayedCurrency"] = "GOLD",
		["displayStyle"] = "ICON"
	},
	["minimapPanels"] = true,
	["leftChatPanel"] = true,
	["rightChatPanel"] = true,
	["minimapTop"] = false,
	["minimapTopLeft"] = false,
	["minimapTopRight"] = false,
	["minimapBottom"] = false,
	["minimapBottomLeft"] = false,
	["minimapBottomRight"] = false
}

--Tooltip
P["tooltip"] = {
	["cursorAnchor"] = false,
	["targetInfo"] = true,
	["playerTitles"] = true,
	["guildRanks"] = true,
	["inspectInfo"] = true,
	["itemCount"] = "BAGS_ONLY",
	["spellID"] = true,
	["font"] = "PT Sans Narrow",
	["fontOutline"] = "NONE",
	["headerFontSize"] = 12,
	["textFontSize"] = 12,
	["smallTextFontSize"] = 12,
	["colorAlpha"] = 0.8,
	["visibility"] = {
		["unitFrames"] = "NONE",
		["bags"] = "NONE",
		["actionbars"] = "NONE",
		["combat"] = false
	},
	["healthBar"] = {
		["text"] = true,
		["height"] = 7,
		["font"] = "Homespun",
		["fontSize"] = 10,
		["fontOutline"] = "OUTLINE",
		["statusPosition"] = "BOTTOM"
	},
	["useCustomFactionColors"] = false,
	["factionColors"] = {
		[1] = {r = 0.8, g = 0.3, b = 0.22},
		[2] = {r = 0.8, g = 0.3, b = 0.22},
		[3] = {r = 0.75, g = 0.27, b = 0},
		[4] = {r = 0.9, g = 0.7, b = 0},
		[5] = {r = 0, g = 0.6, b = 0.1},
		[6] = {r = 0, g = 0.6, b = 0.1},
		[7] = {r = 0, g = 0.6, b = 0.1},
		[8] = {r = 0, g = 0.6, b = 0.1}
	}
}

--UnitFrame
P["unitframe"] = {
	["smoothbars"] = false,
	["smoothSpeed"] = 0.3,
	["statusbar"] = "ElvUI Norm",
	["font"] = "Homespun",
	["fontSize"] = 10,
	["fontOutline"] = "MONOCHROMEOUTLINE",
	["OORAlpha"] = 0.35,
	["debuffHighlighting"] = "FILL",
	["smartRaidFilter"] = true,
	["targetOnMouseDown"] = false,
	["auraBlacklistModifier"] = "SHIFT",
	["thinBorders"] = false,
	["cooldown"] = {
		["threshold"] = 4,
		["override"] = true,
		["expiringColor"] = {r = 1, g = 0, b = 0},
		["secondsColor"] = {r = 1, g = 1, b = 1},
		["minutesColor"] = {r = 1, g = 1, b = 1},
		["hoursColor"] = {r = 1, g = 1, b = 1},
		["daysColor"] = {r = 1, g = 1, b = 1},
	},
	["colors"] = {
		["borderColor"] = {r = 0, g = 0, b = 0},
		["healthclass"] = false,
		["forcehealthreaction"] = false,
		["powerclass"] = false,
		["colorhealthbyvalue"] = true,
		["customhealthbackdrop"] = false,
		["useDeadBackdrop"] = false,
		["classbackdrop"] = false,
		["auraBarByType"] = true,
		["auraBarTurtle"] = true,
		["auraBarTurtleColor"] = {r = 143/255, g = 101/255, b = 158/255},
		["transparentHealth"] = false,
		["transparentPower"] = false,
		["transparentCastbar"] = false,
		["transparentAurabars"] = false,
		["castColor"] = {r = .31,g = .31,b = .31},
		["castNoInterrupt"] = {r = 0.78, g = 0.25, b = 0.25},
		["castClassColor"] = false,
		["castReactionColor"] = false,
		["health"] = {r = .31, g = .31, b = .31},
		["health_backdrop"] = {r = .8, g = .01, b = .01},
		["health_backdrop_dead"] = {r = .8, g = .01, b = .01},
		["tapped"] = {r = 0.55, g = 0.57, b = 0.61},
		["disconnected"] = {r = 0.84, g = 0.75, b = 0.65},
		["auraBarBuff"] = {r = .31, g = .31, b = .31},
		["auraBarDebuff"] = {r = 0.8, g = 0.1, b = 0.1},
		["power"] = {
			["MANA"] = {r = 0.31, g = 0.45, b = 0.63},
			["RAGE"] = {r = 0.78, g = 0.25, b = 0.25},
			["FOCUS"] = {r = 0.71, g = 0.43, b = 0.27},
			["ENERGY"] = {r = 0.65, g = 0.63, b = 0.35},
			["RUNIC_POWER"] = {r = 0, g = 0.82, b = 1}
		},
		["reaction"] = {
			["BAD"] = {r = 0.78, g = 0.25, b = 0.25},
			["NEUTRAL"] = {r = 218/255, g = 197/255, b = 92/255},
			["GOOD"] = {r = 75/255, g = 175/255, b = 76/255}
		},
		["healPrediction"] = {
			["personal"] = {r = 0, g = 1, b = 0.5, a = 0.25},
			["others"] = {r = 0, g = 1, b = 0, a = 0.25},
			["maxOverflow"] = 0,
		},
		["classResources"] = {
			["bgColor"] = {r = 0.1, g = 0.1, b = 0.1, a = 1},
			["comboPoints"] = {
				[1] = {r = 0.69, g = 0.31, b = 0.31},
				[2] = {r = 0.69, g = 0.31, b = 0.31},
				[3] = {r = 0.65, g = 0.63, b = 0.35},
				[4] = {r = 0.65, g = 0.63, b = 0.35},
				[5] = {r = 0.33, g = 0.59, b = 0.33}
			},
			["DEATHKNIGHT"] = {
				[1] = {r = 1, g = 0, b = 0},
				[2] = {r = 0, g = 1, b = 0},
				[3] = {r = 0, g = 1, b = 1},
				[4] = {r = .9, g = .1, b = 1}
			},
			["PALADIN"] = {r = 228/255,g = 225/255,b = 16/255},
			["WARLOCK"] = {r = 148/255, g = 130/255, b = 201/255},
			["DRUID"] = {
				[1] = {r = .30, g = .52, b = .90},
				[2] = {r = .80, g = .82, b = .60}
			},
			["PRIEST"] = {r = 1, g = 1, b = 1}
		},
		["frameGlow"] = {
			["mainGlow"] = {
				["enable"] = false,
				["class"] = false,
				["color"] = {r = 1, g = 1, b = 1, a = 1}
			},
			["targetGlow"] = {
				["enable"] = true,
				["class"] = true,
				["color"] = {r = 1, g = 1, b = 1, a = 1}
			},
			["mouseoverGlow"] = {
				["enable"] = true,
				["class"] = false,
				["texture"] = "ElvUI Blank",
				["color"] = {r = 1, g = 1, b = 1, a = 0.1}
			}
		},
		["debuffHighlight"] = {
			["Magic"] = {r = 0.2, g = 0.6, b = 1, a = 0.45},
			["Curse"] = {r = 0.6, g = 0, b = 1, a = 0.45},
			["Disease"] = {r = 0.6, g = 0.4, b = 0, a = 0.45},
			["Poison"] = {r = 0, g = 0.6, b = 0, a = 0.45}
		}
	},
	["units"] = {
		["player"] = {
			["enable"] = true,
			["orientation"] = "LEFT",
			["width"] = 270,
			["height"] = 54,
			["lowmana"] = 30,
			["combatfade"] = false,
			["healPrediction"] = true,
			["threatStyle"] = "GLOW",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = true,
			["health"] = {
				["text_format"] = "[healthcolor][health:current-percent]",
				["position"] = "LEFT",
				["xOffset"] = 2,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "[powercolor][power:current]",
				["width"] = "fill",
				["height"] = 10,
				["offset"] = 0,
				["position"] = "RIGHT",
				["hideonnpc"] = false,
				["xOffset"] = -2,
				["yOffset"] = 0,
				["attachTextTo"] = "Health",
				["detachFromFrame"] = false,
				["detachedWidth"] = 250,
				["druidMana"] = true,
				["strataAndLevel"] = {
					["useCustomStrata"] = false,
					["frameStrata"] = "LOW",
					["useCustomLevel"] = false,
					["frameLevel"] = 1
				},
				["parent"] = "FRAME"
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 20,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["pvp"] = {
				["position"] = "BOTTOM",
				["text_format"] = "||cFFB04F4F[pvptimer][mouseover]||r",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["RestIcon"] = {
				["enable"] = true,
				["defaultColor"] = true,
				["color"] = {r = 1, g = 1, b = 1, a = 1},
				["anchorPoint"] = "TOPLEFT",
				["xOffset"] = -3,
				["yOffset"] = 6,
				["size"] = 22,
				["texture"] = "DEFAULT"
			},
			["CombatIcon"] = {
				["enable"] = true,
				["defaultColor"] = true,
				["color"] = {r = 1, g = 0.2, b = 0.2, a = 1},
				["anchorPoint"] = "CENTER",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["size"] = 20,
				["texture"] = "DEFAULT"
			},
 			["pvpIcon"] = {
 				["enable"] = false,
 				["anchorPoint"] = "CENTER",
 				["xOffset"] = 0,
 				["yOffset"] = 0,
 				["scale"] = 1,
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 8,
				["numrows"] = 1,
				["attachTo"] = "DEBUFFS",
				["anchorPoint"] = "TOPLEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal", --Player Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 8,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "TOPLEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,nonPersonal", --Player Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 270,
				["height"] = 18,
				["icon"] = true,
				["latency"] = true,
				["format"] = "REMAINING",
				["ticks"] = true,
				["spark"] = true,
				["displayTarget"] = false,
				["iconSize"] = 42,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0,
				["tickWidth"] = 1,
				["tickColor"] = {r = 0, g = 0, b = 0, a = 0.8}
			},
			["classbar"] = {
				["enable"] = true,
				["fill"] = "fill",
				["height"] = 10,
				["autoHide"] = false,
				["additionalPowerText"] = true,
				["detachFromFrame"] = false,
				["detachedWidth"] = 250,
				["parent"] = "FRAME",
				["verticalOrientation"] = false,
				["orientation"] = "HORIZONTAL",
				["spacing"] = 5,
				["strataAndLevel"] = {
					["useCustomStrata"] = false,
					["frameStrata"] = "LOW",
					["useCustomLevel"] = false,
					["frameLevel"] = 1
				}
			},
			["aurabar"] = {
				["enable"] = true,
				["anchorPoint"] = "ABOVE",
				["attachTo"] = "DEBUFFS",
				["maxBars"] = 6,
				["minDuration"] = 0,
				["maxDuration"] = 120,
				["priority"] = "Blacklist,blockNoDuration,Personal,RaidDebuffs,PlayerBuffs", --Player AuraBars
				["friendlyAuraType"] = "HELPFUL",
				["enemyAuraType"] = "HARMFUL",
				["height"] = 20,
				["sort"] = "TIME_REMAINING",
				["uniformThreshold"] = 0,
				["yOffset"] = 0,
				["spacing"] = 0,
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["target"] = {
			["enable"] = true,
			["width"] = 270,
			["height"] = 54,
			["orientation"] = "RIGHT",
			["threatStyle"] = "GLOW",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["rangeCheck"] = true,
			["healPrediction"] = true,
			["middleClickFocus"] = true,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = true,
			["health"] = {
				["text_format"] = "[healthcolor][health:current-percent]",
				["position"] = "RIGHT",
				["xOffset"] = -2,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "[powercolor][power:current]",
				["width"] = "fill",
				["height"] = 10,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["xOffset"] = 2,
				["yOffset"] = 0,
				["detachFromFrame"] = false,
				["detachedWidth"] = 250,
				["attachTextTo"] = "Health",
				["strataAndLevel"] = {
					["useCustomStrata"] = false,
					["frameStrata"] = "LOW",
					["useCustomLevel"] = false,
					["frameLevel"] = 1
				},
				["parent"] = "FRAME"
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 20,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium] [difficultycolor][smartlevel] [shortclassification]",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
 			["pvpIcon"] = {
 				["enable"] = false,
 				["anchorPoint"] = "CENTER",
 				["xOffset"] = 0,
 				["yOffset"] = 0,
 				["scale"] = 1,
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = true,
				["perrow"] = 8,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "TOPRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,nonPersonal", --Target Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 8,
				["numrows"] = 1,
				["attachTo"] = "BUFFS",
				["anchorPoint"] = "TOPRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,RaidDebuffs,CCDebuffs,Friendly:Dispellable", --Target Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 270,
				["height"] = 18,
				["icon"] = true,
				["format"] = "REMAINING",
				["spark"] = true,
				["iconSize"] = 42,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0
			},
			["combobar"] = {
				["enable"] = true,
				["fill"] = "fill",
				["height"] = 10,
				["autoHide"] = true,
				["detachFromFrame"] = false,
				["detachedWidth"] = 250,
				["parent"] = "FRAME",
				["orientation"] = "HORIZONTAL",
				["spacing"] = 5,
				["strataAndLevel"] = {
					["useCustomStrata"] = false,
					["frameStrata"] = "LOW",
					["useCustomLevel"] = false,
					["frameLevel"] = 1
				}
			},
			["aurabar"] = {
				["enable"] = true,
				["anchorPoint"] = "ABOVE",
				["attachTo"] = "DEBUFFS",
				["maxBars"] = 6,
				["minDuration"] = 0,
				["maxDuration"] = 120,
				["priority"] = "Blacklist,blockNoDuration,Personal,PlayerBuffs,RaidDebuffs", --Target AuraBars
				["friendlyAuraType"] = "HELPFUL",
				["enemyAuraType"] = "HARMFUL",
				["height"] = 20,
				["sort"] = "TIME_REMAINING",
				["uniformThreshold"] = 0,
				["yOffset"] = 0,
				["spacing"] = 0,
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			},
			["GPSArrow"] = {
				["enable"] = false,
				["size"] = 45,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["onMouseOver"] = true,
				["outOfRange"] = true
			}
		},
		["targettarget"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["threatStyle"] = "NONE",
			["orientation"] = "MIDDLE",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 130,
			["height"] = 36,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = true,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["xOffset"] = -2,
				["yOffset"] = 0
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["xOffset"] = 2,
				["yOffset"] = 0
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 14,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,PlayerBuffs,Dispellable", --TargetTarget Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,RaidDebuffs,CCDebuffs,Dispellable,Whitelist", --TargetTarget Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["targettargettarget"] = {
			["enable"] = false,
			["rangeCheck"] = true,
			["orientation"] = "MIDDLE",
			["threatStyle"] = "NONE",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 130,
			["height"] = 36,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["xOffset"] = -2,
				["yOffset"] = 0
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["xOffset"] = 2,
				["yOffset"] = 0
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,nonPersonal", --TargetTargetTarget Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,nonPersonal", --TargetTargetTarget Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["focus"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["threatStyle"] = "GLOW",
			["orientation"] = "MIDDLE",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 190,
			["height"] = 36,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["healPrediction"] = true,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["xOffset"] = -2,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["xOffset"] = 2,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 14,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,PlayerBuffs,CastByUnit,Dispellable", --Focus Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "TOPRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,RaidDebuffs,Dispellable,Whitelist", --Focus Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 190,
				["height"] = 18,
				["icon"] = true,
				["format"] = "REMAINING",
				["spark"] = true,
				["iconSize"] = 32,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0
			},
			["aurabar"] = {
				["enable"] = false,
				["anchorPoint"] = "ABOVE",
				["attachTo"] = "DEBUFFS",
				["maxBars"] = 3,
				["minDuration"] = 0,
				["maxDuration"] = 120,
				["priority"] = "Blacklist,blockNoDuration,Personal,PlayerBuffs,RaidDebuffs", --Focus AuraBars
				["friendlyAuraType"] = "HELPFUL",
				["enemyAuraType"] = "HARMFUL",
				["height"] = 20,
				["sort"] = "TIME_REMAINING",
				["uniformThreshold"] = 0,
				["yOffset"] = 0,
				["spacing"] = 0,
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			},
			["GPSArrow"] = {
				["enable"] = true,
				["size"] = 45,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["onMouseOver"] = true,
				["outOfRange"] = true
			}
		},
		["focustarget"] = {
			["enable"] = false,
			["rangeCheck"] = true,
			["threatStyle"] = "NONE",
			["orientation"] = "MIDDLE",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 190,
			["height"] = 26,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["xOffset"] = -2,
				["yOffset"] = 0
			},
			["power"] = {
				["enable"] = false,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["xOffset"] = 2,
				["yOffset"] = 0
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["yOffset"] = 0,
				["xOffset"] = 0,
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,PlayerBuffs,Dispellable,CastByUnit", --FocusTarget Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,RaidDebuffs,Dispellable,Whitelist", --FocusTarget Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["pet"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["orientation"] = "MIDDLE",
			["threatStyle"] = "GLOW",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 130,
			["height"] = 36,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = true,
			["healPrediction"] = true,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["yOffset"] = 0,
				["xOffset"] = -2
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = 2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["yOffset"] = 0,
				["xOffset"] = 0
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,PlayerBuffs", --Pet Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMRIGHT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,RaidDebuffs,Dispellable,Whitelist", --Pet Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 130,
				["height"] = 18,
				["icon"] = true,
				["format"] = "REMAINING",
				["spark"] = true,
				["iconSize"] = 26,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0
			}
		},
		["pettarget"] = {
			["enable"] = false,
			["rangeCheck"] = true,
			["threatStyle"] = "NONE",
			["orientation"] = "MIDDLE",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 130,
			["height"] = 26,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "",
				["position"] = "RIGHT",
				["yOffset"] = 0,
				["xOffset"] = -2
			},
			["power"] = {
				["enable"] = false,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "LEFT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = 2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["yOffset"] = 0,
				["xOffset"] = 0
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 7,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMLEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,PlayerBuffs,CastByUnit,Whitelist", --PetTarget Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 5,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "BOTTOMRIGHT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,Personal,RaidDebuffs", --PetTarget Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		},
		["boss"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["growthDirection"] = "DOWN",
			["threatStyle"] = "NONE",
			["orientation"] = "RIGHT",
			["smartAuraPosition"] = "DISABLED",
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 216,
			["height"] = 46,
			["spacing"] = 25,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:current]",
				["position"] = "LEFT",
				["yOffset"] = 0,
				["xOffset"] = 2,
				["attachTextTo"] = "Health"
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "[powercolor][power:current]",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "RIGHT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = -2,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 35,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 16,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["yOffset"] = 0,
				["xOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["buffs"] = {
				["enable"] = true,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,CastByUnit,Whitelist", --Boss Buffs
				["xOffset"] = 0,
				["yOffset"] = 20,
				["sizeOverride"] = 22
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 3,
				["numrows"] = 2,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,RaidDebuffs,CastByUnit,Whitelist", --Boss Debuffs
				["xOffset"] = 0,
				["yOffset"] = -3,
				["sizeOverride"] = 22
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 215,
				["height"] = 18,
				["icon"] = true,
				["format"] = "REMAINING",
				["spark"] = true,
				["iconSize"] = 32,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["arena"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["growthDirection"] = "DOWN",
			["orientation"] = "RIGHT",
			["smartAuraPosition"] = "DISABLED",
			["spacing"] = 25,
			["width"] = 246,
			["height"] = 47,
			["healPrediction"] = true,
			["colorOverride"] = "USE_DEFAULT",
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:current]",
				["position"] = "LEFT",
				["yOffset"] = 0,
				["xOffset"] = 2,
				["attachTextTo"] = "Health"
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "[powercolor][power:current]",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["attachTextTo"] = "Health",
				["position"] = "RIGHT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = -2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:medium]",
				["yOffset"] = 0,
				["xOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 35,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = true,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,TurtleBuffs,PlayerBuffs,Dispellable", --Arena Buffs
				["sizeOverride"] = 27,
				["xOffset"] = 0,
				["yOffset"] = 16
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["clickThrough"] = false,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,blockNoDuration,Personal,CCDebuffs,Whitelist", --Arena Debuffs
				["sizeOverride"] = 27,
				["xOffset"] = 0,
				["yOffset"] = -16
			},
			["castbar"] = {
				["enable"] = true,
				["width"] = 256,
				["height"] = 18,
				["icon"] = true,
				["format"] = "REMAINING",
				["spark"] = true,
				["iconSize"] = 32,
				["iconAttached"] = true,
				["insideInfoPanel"] = true,
				["iconAttachedTo"] = "Frame",
				["iconPosition"] = "LEFT",
				["iconXOffset"] = -10,
				["iconYOffset"] = 0
			},
			["pvpTrinket"] = {
				["enable"] = true,
				["position"] = "RIGHT",
				["size"] = 46,
				["xOffset"] = 1,
				["yOffset"] = 0
			}
		},
		["party"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["threatStyle"] = "GLOW",
			["orientation"] = "LEFT",
			["visibility"] = "[@raid6,exists][nogroup] hide;show",
			["growthDirection"] = "UP_RIGHT",
			["horizontalSpacing"] = 0,
			["verticalSpacing"] = 3,
			["numGroups"] = 1,
			["groupsPerRowCol"] = 1,
			["groupBy"] = "GROUP",
			["sortDir"] = "ASC",
			["raidWideSorting"] = false,
			["invertGroupingOrder"] = false,
			["startFromCenter"] = false,
			["showPlayer"] = true,
			["healPrediction"] = false,
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 184,
			["height"] = 54,
			["groupSpacing"] = 0,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:current-percent]",
				["position"] = "LEFT",
				["orientation"] = "HORIZONTAL",
				["attachTextTo"] = "Health",
				["frequentUpdates"] = false,
				["yOffset"] = 0,
				["xOffset"] = 2
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "[powercolor][power:current]",
				["attachTextTo"] = "Health",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "RIGHT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = -2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 15,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["attachTextTo"] = "Health",
				["text_format"] = "[namecolor][name:medium] [difficultycolor][smartlevel]",
				["yOffset"] = 0,
				["xOffset"] = 0
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["countFontSize"] = 10,
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,TurtleBuffs", --Party Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = true,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "RIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,RaidDebuffs,CCDebuffs,Dispellable,Whitelist", --Party Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0,
				["sizeOverride"] = 52
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
				["profileSpecific"] = false
			},
			["rdebuffs"] = {
				["enable"] = false,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 26,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["roleIcon"] = {
				["enable"] = true,
				["position"] = "TOPRIGHT",
				["attachTo"] = "Health",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["size"] = 15,
				["tank"] = true,
				["healer"] = true,
				["damager"] = true
			},
			["raidRoleIcons"] = {
				["enable"] = true,
				["position"] = "TOPLEFT"
			},
			["petsGroup"] = {
				["enable"] = false,
				["width"] = 100,
				["height"] = 22,
				["anchorPoint"] = "TOPLEFT",
				["xOffset"] = -1,
				["yOffset"] = 0,
				["name"] = {
					["position"] = "CENTER",
					["text_format"] = "[namecolor][name:short]",
					["yOffset"] = 0,
					["xOffset"] = 0
				}
			},
			["targetsGroup"] = {
				["enable"] = false,
				["width"] = 100,
				["height"] = 22,
				["anchorPoint"] = "TOPLEFT",
				["xOffset"] = -1,
				["yOffset"] = 0,
				["name"] = {
					["position"] = "CENTER",
					["text_format"] = "[namecolor][name:short]",
					["yOffset"] = 0,
					["xOffset"] = 0
				}
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			},
			["GPSArrow"] = {
				["enable"] = true,
				["size"] = 45,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["onMouseOver"] = true,
				["outOfRange"] = true
			},
			["readycheckIcon"] = {
				["enable"] = true,
				["size"] = 12,
				["attachTo"] = "Health",
				["position"] = "BOTTOM",
				["xOffset"] = 0,
				["yOffset"] = 2,
			},
			["resurrectIcon"] = {
				["enable"] = true,
				["size"] = 30,
				["attachTo"] = "CENTER",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		},
		["raid"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["threatStyle"] = "GLOW",
			["orientation"] = "MIDDLE",
			["visibility"] = "[@raid6,noexists][@raid26,exists] hide;show",
			["growthDirection"] = "RIGHT_DOWN",
			["horizontalSpacing"] = 3,
			["verticalSpacing"] = 3,
			["numGroups"] = 5,
			["groupsPerRowCol"] = 1,
			["groupBy"] = "GROUP",
			["sortDir"] = "ASC",
			["showPlayer"] = true,
			["healPrediction"] = false,
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 80,
			["height"] = 44,
			["groupSpacing"] = 0,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:deficit]",
				["position"] = "BOTTOM",
				["orientation"] = "HORIZONTAL",
				["attachTextTo"] = "Health",
				["frequentUpdates"] = false,
				["yOffset"] = 0,
				["xOffset"] = 0
			},
			["power"] = {
				["enable"] = true,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "BOTTOMRIGHT",
				["hideonnpc"] = false,
				["yOffset"] = 0,
				["xOffset"] = -2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["attachTextTo"] = "Health",
				["text_format"] = "[namecolor][name:short]",
				["yOffset"] = 0,
				["xOffset"] = 0
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 2,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,TurtleBuffs", --Raid Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "RIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,RaidDebuffs,CCDebuffs,Dispellable", --Raid Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
				["profileSpecific"] = false
			},
			["rdebuffs"] = {
				["enable"] = true,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 26,
				["xOffset"] = 0,
				["yOffset"] = 2,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["roleIcon"] = {
				["enable"] = true,
				["position"] = "TOPLEFT",
				["attachTo"] = "Health",
				["xOffset"] = 1,
				["yOffset"] = -1,
				["size"] = 15,
				["tank"] = true,
				["healer"] = true,
				["damager"] = true
			},
			["raidRoleIcons"] = {
				["enable"] = true,
				["position"] = "TOPLEFT"
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			},
			["GPSArrow"] = {
				["enable"] = true,
				["size"] = 40,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["onMouseOver"] = true,
				["outOfRange"] = true
			},
			["readycheckIcon"] = {
				["enable"] = true,
				["size"] = 12,
				["attachTo"] = "Health",
				["position"] = "BOTTOM",
				["xOffset"] = 0,
				["yOffset"] = 2,
			},
			["resurrectIcon"] = {
				["enable"] = true,
				["size"] = 30,
				["attachTo"] = "CENTER",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		},
		["raid40"] = {
			["enable"] = true,
			["rangeCheck"] = true,
			["threatStyle"] = "GLOW",
			["orientation"] = "MIDDLE",
			["visibility"] = "[@raid26,noexists] hide;show",
			["growthDirection"] = "RIGHT_DOWN",
			["horizontalSpacing"] = 3,
			["verticalSpacing"] = 3,
			["numGroups"] = 8,
			["groupsPerRowCol"] = 1,
			["groupBy"] = "GROUP",
			["sortDir"] = "ASC",
			["showPlayer"] = true,
			["healPrediction"] = false,
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 80,
			["height"] = 27,
			["groupSpacing"] = 0,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:deficit]",
				["position"] = "BOTTOM",
				["orientation"] = "HORIZONTAL",
				["frequentUpdates"] = false,
				["attachTextTo"] = "Health",
				["yOffset"] = 2,
				["xOffset"] = 0
			},
			["power"] = {
				["enable"] = false,
				["text_format"] = "",
				["width"] = "fill",
				["height"] = 7,
				["offset"] = 0,
				["position"] = "BOTTOMRIGHT",
				["hideonnpc"] = false,
				["yOffset"] = 2,
				["xOffset"] = -2
			},
			["infoPanel"] = {
				["enable"] = false,
				["height"] = 12,
				["transparent"] = false
			},
			["name"] = {
				["position"] = "CENTER",
				["text_format"] = "[namecolor][name:short]",
				["yOffset"] = 0,
				["xOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,TurtleBuffs", --Raid40 Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "RIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 300,
				["priority"] = "Blacklist,RaidDebuffs,CCDebuffs,Dispellable,Whitelist", --Raid40 Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["rdebuffs"] = {
				["enable"] = false,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 22,
				["xOffset"] = 0,
				["yOffset"] = 2,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["roleIcon"] = {
				["enable"] = false,
				["position"] = "BOTTOMRIGHT",
				["attachTo"] = "Health",
				["xOffset"] = -1,
				["yOffset"] = 1,
				["size"] = 15,
				["tank"] = true,
				["healer"] = true,
				["damager"] = true
			},
			["raidRoleIcons"] = {
				["enable"] = true,
				["position"] = "TOPLEFT"
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
				["profileSpecific"] = false
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			},
			["GPSArrow"] = {
				["enable"] = true,
				["size"] = 45,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["onMouseOver"] = true,
				["outOfRange"] = true
			},
			["readycheckIcon"] = {
				["enable"] = true,
				["size"] = 12,
				["attachTo"] = "Health",
				["position"] = "BOTTOM",
				["xOffset"] = 0,
				["yOffset"] = 2,
			},
			["resurrectIcon"] = {
				["enable"] = true,
				["size"] = 30,
				["attachTo"] = "CENTER",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		},
		["raidpet"] = {
			["enable"] = false,
			["rangeCheck"] = true,
			["orientation"] = "MIDDLE",
			["threatStyle"] = "GLOW",
			["visibility"] = "[group:raid] show; hide",
			["growthDirection"] = "DOWN_RIGHT",
			["horizontalSpacing"] = 3,
			["verticalSpacing"] = 3,
			["numGroups"] = 2,
			["groupsPerRowCol"] = 1,
			["groupBy"] = "PETNAME",
			["sortDir"] = "ASC",
			["raidWideSorting"] = true,
			["invertGroupingOrder"] = false,
			["startFromCenter"] = false,
			["healPrediction"] = true,
			["colorOverride"] = "USE_DEFAULT",
			["width"] = 80,
			["height"] = 30,
			["groupSpacing"] = 0,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["health"] = {
				["text_format"] = "[healthcolor][health:deficit]",
				["position"] = "BOTTOM",
				["orientation"] = "HORIZONTAL",
				["frequentUpdates"] = true,
				["yOffset"] = 2,
				["xOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["name"] = {
				["position"] = "TOP",
				["text_format"] = "[namecolor][name:short]",
				["yOffset"] = -2,
				["xOffset"] = 0,
				["attachTextTo"] = "Health"
			},
			["portrait"] = {
				["enable"] = false,
				["width"] = 45,
				["overlay"] = false,
				["camDistanceScale"] = 1,
				["rotation"] = 0,
				["style"] = "3D",
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "LEFT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,PlayerBuffs,blockNoDuration,nonPersonal", --RaidPet Buffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 3,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "RIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "Blacklist,Personal,Whitelist,RaidDebuffs,blockNoDuration,nonPersonal", --RaidPet Debuffs
				["xOffset"] = 0,
				["yOffset"] = 0
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
			},
			["rdebuffs"] = {
				["enable"] = true,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 26,
				["xOffset"] = 0,
				["yOffset"] = 2,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["raidicon"] = {
				["enable"] = true,
				["size"] = 18,
				["attachTo"] = "TOP",
				["attachToObject"] = "Frame",
				["xOffset"] = 0,
				["yOffset"] = 8
			}
		},
		["tank"] = {
			["enable"] = true,
			["orientation"] = "LEFT",
			["threatStyle"] = "GLOW",
			["colorOverride"] = "USE_DEFAULT",
			["rangeCheck"] = true,
			["width"] = 120,
			["height"] = 28,
			["disableDebuffHighlight"] = true,
			["verticalSpacing"] = 7,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 6,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "TOPLEFT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "",
				["xOffset"] = 0,
				["yOffset"] = 2
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 6,
				["numrows"] = 1,
				["attachTo"] = "BUFFS",
				["anchorPoint"] = "TOPRIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "",
				["xOffset"] = 0,
				["yOffset"] = 1
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
				["profileSpecific"] = false
			},
			["rdebuffs"] = {
				["enable"] = true,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 26,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["targetsGroup"] = {
				["enable"] = true,
				["anchorPoint"] = "RIGHT",
				["xOffset"] = 1,
				["yOffset"] = 0,
				["width"] = 120,
				["height"] = 28,
				["colorOverride"] = "USE_DEFAULT"
			}
		},
		["assist"] = {
			["enable"] = true,
			["orientation"] = "LEFT",
			["threatStyle"] = "GLOW",
			["colorOverride"] = "USE_DEFAULT",
			["rangeCheck"] = true,
			["width"] = 120,
			["height"] = 28,
			["disableDebuffHighlight"] = true,
			["verticalSpacing"] = 7,
			["disableMouseoverGlow"] = false,
			["disableTargetGlow"] = false,
			["buffs"] = {
				["enable"] = false,
				["perrow"] = 6,
				["numrows"] = 1,
				["attachTo"] = "FRAME",
				["anchorPoint"] = "TOPLEFT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "",
				["xOffset"] = 0,
				["yOffset"] = 2
			},
			["debuffs"] = {
				["enable"] = false,
				["perrow"] = 6,
				["numrows"] = 1,
				["attachTo"] = "BUFFS",
				["anchorPoint"] = "TOPRIGHT",
				["fontSize"] = 10,
				["countFontSize"] = 10,
				["sortMethod"] = "TIME_REMAINING",
				["sortDirection"] = "DESCENDING",
				["clickThrough"] = false,
				["minDuration"] = 0,
				["maxDuration"] = 0,
				["priority"] = "",
				["xOffset"] = 0,
				["yOffset"] = 1
			},
			["buffIndicator"] = {
				["enable"] = true,
				["size"] = 8,
				["fontSize"] = 10,
				["profileSpecific"] = false
			},
			["rdebuffs"] = {
				["enable"] = true,
				["showDispellableDebuff"] = true,
				["onlyMatchSpellID"] = true,
				["fontSize"] = 10,
				["font"] = "Homespun",
				["fontOutline"] = "MONOCHROMEOUTLINE",
				["size"] = 26,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["duration"] = {
					["position"] = "CENTER",
					["xOffset"] = 0,
					["yOffset"] = 0,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				},
				["stack"] = {
					["position"] = "BOTTOMRIGHT",
					["xOffset"] = 0,
					["yOffset"] = 2,
					["color"] = {r = 1, g = 0.9, b = 0, a = 1}
				}
			},
			["targetsGroup"] = {
				["enable"] = true,
				["anchorPoint"] = "RIGHT",
				["xOffset"] = 1,
				["yOffset"] = 0,
				["width"] = 120,
				["height"] = 28,
				["colorOverride"] = "USE_DEFAULT"
			}
		}
	}
}

P["cooldown"] = {
	threshold = 3,
	expiringColor = {r = 1, g = 0, b = 0},
	secondsColor = {r = 1, g = 1, b = 0},
	minutesColor = {r = 1, g = 1, b = 1},
	hoursColor = {r = 0.4, g = 1, b = 1},
	daysColor = {r = 0.4, g = 0.4, b = 1}
}

--Actionbar
P["actionbar"] = {
	["font"] = "Homespun",
	["fontSize"] = 10,
	["fontOutline"] = "MONOCHROMEOUTLINE",
	["fontColor"] = {r = 1, g = 1, b = 1},

	["macrotext"] = false,
	["hotkeytext"] = true,
	["keyDown"] = true,
	["movementModifier"] = "SHIFT",
	["globalFadeAlpha"] = 0,
	["lockActionBars"] = true,
	["addNewSpells"] = false,
	["rightClickSelfCast"] = false,
	["desaturateOnCooldown"] = false,

	["useRangeColorText"] = false,
	["noRangeColor"] = {r = 0.8, g = 0.1, b = 0.1},
	["noPowerColor"] = {r = 0.5, g = 0.5, b = 1},
	["usableColor"] = {r = 1, g = 1, b = 1},
	["notUsableColor"] = {r = 0.4, g = 0.4, b = 0.4},

	["microbar"] = {
		["enabled"] = false,
		["buttonsPerRow"] = 12,
		["buttonSize"] = 20,
		["buttonSpacing"] = 2,
		["alpha"] = 1,
		["mouseover"] = false,
		["visibility"] = "show",
	},
	["bar1"] = {
		["enabled"] = true,
		["buttons"] = 12,
		["mouseover"] = false,
		["buttonsPerRow"] = 12,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "BOTTOMLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {
			["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;",
			["WARRIOR"] = "[bonusbar:1] 7; [bonusbar:2] 8; [bonusbar:3] 9;",
			["PRIEST"] = "[bonusbar:1] 7;",
			["ROGUE"] = "[bonusbar:1] 7; [form:3] 7;"
		},
		["visibility"] = ""
	},
	["bar2"] = {
		["enabled"] = false,
		["mouseover"] = false,
		["buttons"] = 12,
		["buttonsPerRow"] = 12,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "BOTTOMLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {},
		["visibility"] = "[vehicleui] hide;show"
	},
	["bar3"] = {
		["enabled"] = true,
		["mouseover"] = false,
		["buttons"] = 6,
		["buttonsPerRow"] = 6,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "BOTTOMLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {},
		["visibility"] = "[vehicleui] hide;show"
	},
	["bar4"] = {
		["enabled"] = true,
		["mouseover"] = false,
		["buttons"] = 12,
		["buttonsPerRow"] = 1,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "TOPRIGHT",
		["backdrop"] = true,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {},
		["visibility"] = "[vehicleui] hide;show"
	},
	["bar5"] = {
		["enabled"] = true,
		["mouseover"] = false,
		["buttons"] = 6,
		["buttonsPerRow"] = 6,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "BOTTOMLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {},
		["visibility"] = "[vehicleui] hide;show"
	},
	["bar6"] = {
		["enabled"] = false,
		["mouseover"] = false,
		["buttons"] = 12,
		["buttonsPerRow"] = 12,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "BOTTOMLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["showGrid"] = true,
		["flyoutDirection"] = "AUTOMATIC",
		["paging"] = {},
		["visibility"] = "[vehicleui] hide;show"
	},
	["barPet"] = {
		["enabled"] = true,
		["mouseover"] = false,
		["buttons"] = NUM_PET_ACTION_SLOTS,
		["buttonsPerRow"] = 1,
		["buttonsize"] = 28,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["point"] = "TOPRIGHT",
		["backdrop"] = true,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["visibility"] = "[pet,novehicleui,nobonusbar:5] show;hide"
	},
	["barShapeShift"] = {
		["enabled"] = true,
		["style"] = "darkenInactive",
		["mouseover"] = false,
		["buttonsPerRow"] = NUM_SHAPESHIFT_SLOTS,
		["buttons"] = NUM_SHAPESHIFT_SLOTS,
		["point"] = "TOPLEFT",
		["backdrop"] = false,
		["heightMult"] = 1,
		["widthMult"] = 1,
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["backdropSpacing"] = 2,
		["alpha"] = 1,
		["inheritGlobalFade"] = false,
		["usePositionOverride"] = true,
		["visibility"] = "[vehicleui] hide;show"
	},
	["barTotem"] = {
		["enabled"] = true,
		["mouseover"] = false,
		["flyoutDirection"] = "UP",
		["buttonsize"] = 32,
		["buttonspacing"] = 2,
		["flyoutSpacing"] = 2,
		["alpha"] = 1,
		["visibility"] = "[vehicleui] hide;show"
	},
	["extraActionButton"] = {
		["alpha"] = 1,
		["scale"] = 0.75,
		["inheritGlobalFade"] = false
	}
}