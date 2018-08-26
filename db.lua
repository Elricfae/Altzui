local T, C, L, G = unpack(select(2, ...))

local default_ClassClick = {
	PRIEST = { 
		["1"] = {
			["Click"]		= {
				["action"]	= "target",
							},
			["ctrl-"]		= {
				["action"]	= 47788,--"守护之魂",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]		= 17,--"真言術:盾",
							},
		},
		["6"] = {
			["Click"]			= {
				["action"]	= 33076,	--"愈合",
							},
		},
		["10"] = {
			["Click"]			= {
				["action"]	= 527,	--"驱散",
							},
		},
	},
	DRUID = { 
		["1"] = {
			["Click"]		= {
				["action"]	= "target",
							},
			["ctrl-"]		= {
				["action"]	= 102342,--"铁木树皮",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]		= 774,--"回春",
							},
			["ctrl-"]		= {
				["action"]	= 20484,--"战复",
							},				
		},
		["6"] = {
			["Click"]			= {
				["action"]	= 18562,	--"迅捷治愈",
							},
		},
		["10"] = {
			["Click"]			= {
				["action"]	= 33763,	--"生命绽放",
							},
		},					
		["12"] = {
			["Click"]			= {
				["action"]	= 88423,	--"驱散",
							},						
		},
	},
	SHAMAN = { 
		["1"] = {
			["Click"]		= {
				["action"]	= "target",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 61295,	--"激流",
							},
			["ctrl-"]		= {
				["action"]	= 546,		--水上行走
							},
		},
		["6"] = {
			["Click"]			= {
				["action"]	= 8004,	--"治疗之涌",
							},
		},
		["10"] = {
			["Click"]			= {
				["action"]	= 77130,	--"净化灵魂",
							},
		},
	},
	PALADIN = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
			["ctrl-"]		= {
				["action"]	= 6940,		--牺牲祝福
							},		
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 20476,  --"神圣震击",
							},
			["ctrl-"]		= {
				["action"]	= 1022,		--保护祝福
							},	
		},
		["6"] = {
			["Click"]			= {
				["action"]	= 183998,	--"殉道者之光",
							},
		},
		["8"] = {
			["Click"]			= {
				["action"]	= 53563,	--"圣光道标",
							},
		},			
		["10"] = {
			["Click"]			= {
				["action"]	= 4987,	--"驱散",
							},
		},
		["12"] = {
			["Click"]			= {
				["action"]	= 115450,	--"自由祝福",
							},		
		},
							
	},
	WARRIOR = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 3411,--"阻擾",
							},
		},
	},
	MAGE = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
	},
	WARLOCK = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
	},
	HUNTER = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 34477,--"誤導",
							},
		},
	},
	ROGUE = { 
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 57933,--"偷天換日", ---
							},
		},
	},
	DEATHKNIGHT = {
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
			["shift-"]		= {
				["action"]	= 61999, --复活盟友
							},
		},
	},
	MONK = {
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
			["ctrl-"]		= {
				["action"]	= 116849,		--作茧缚命
							},		
		},
		["2"] = {
			["Click"]			= {
				["action"]	= 119611,--"复苏之雾",
							},
		},
		["6"] = {
			["Click"]			= {
				["action"]	= 115450,	--"神器",
							},
		},
		["10"] = {
			["Click"]			= {
				["action"]	= 115450,	--"驱散",
							},
		},
		
	},
	DEMONHUNTER = {
		["1"] = {
			["Click"]			= {
				["action"]	= "target",
							},
		},
	},
}

local classClickdb = default_ClassClick[G.myClass]
local modifiers = { "Click", "shift-", "ctrl-", "alt-"}

local ClickCastDB = {}

for i = 1, 13  do
	ClickCastDB[tostring(i)] = {}
	if i < 6 then
		for _, modifier in ipairs(modifiers) do
			ClickCastDB[tostring(i)][modifier] = {}
			ClickCastDB[tostring(i)][modifier]["action"] = "NONE"
			ClickCastDB[tostring(i)][modifier]["macro"] = ""
		end
	else -- 滚轮用的
		ClickCastDB[tostring(i)]["Click"] = {}
		ClickCastDB[tostring(i)]["Click"]["action"] = "NONE"
		ClickCastDB[tostring(i)]["Click"]["macro"] = ""
	end
end

for k, _ in pairs(classClickdb) do
	for j, _ in pairs(classClickdb[k]) do
		local var = classClickdb[k][j]["action"]
		local spellname = GetSpellInfo(var)
		if (var == "target" or var == "tot" or var == "follow" or var == "macro") then
			ClickCastDB[k][j]["action"] = var
		elseif spellname then
			ClickCastDB[k][j]["action"] = spellname
		end
	end
end

local EJ_GetEncounterInfo = function(value)
	local a = EJ_GetEncounterInfo(value)
	return a
end

local AuraList = {
	["Buffs"] = {
	--Prêtre
		[GetSpellInfo(33206)]  = { id = 33206,  level = 15,}, -- Suppression de la douleur
        [GetSpellInfo(47788)]  = { id = 47788,  level = 15,}, -- Esprit gardien
		[GetSpellInfo(47585)]  = { id = 47585,  level = 15,}, -- Dispersion		
	--小德
        [GetSpellInfo(102342)] = { id = 102342, level = 15,}, -- 铁木树皮
		[GetSpellInfo(22812)]  = { id = 22812,  level = 15,}, -- 树皮术
		[GetSpellInfo(61336)]  = { id = 61336,  level = 15,}, -- 生存本能
	--骑士
		[GetSpellInfo(1022)]   = { id = 1022,   level = 15,}, -- 保护之手
		[GetSpellInfo(31850)]  = { id = 31850,  level = 15,}, -- 炽热防御者
        [GetSpellInfo(498)]    = { id = 498,    level = 15,}, -- 圣佑术
		[GetSpellInfo(642)]    = { id = 642,    level = 15,}, -- 圣盾术
		[GetSpellInfo(86659)]  = { id = 86659,  level = 15,}, -- 远古列王守卫
	--武僧
		[GetSpellInfo(116849)] = { id = 116849, level = 15,}, -- 作茧缚命
		[GetSpellInfo(115203)] = { id = 115203, level = 15,}, -- 壮胆酒
	--DK
		[GetSpellInfo(48707)]  = { id = 48707,  level = 15,}, -- 反魔法护罩
		[GetSpellInfo(48792)]  = { id = 48792,  level = 15,}, -- 冰封之韧
		[GetSpellInfo(49028)]  = { id = 49028,  level = 15,}, -- 吸血鬼之血
		[GetSpellInfo(55233)]  = { id = 55233,  level = 15,}, -- 符文刃舞
	--战士
		[GetSpellInfo(12975)]  = { id = 12975,  level = 15,}, -- 破釜沉舟
		[GetSpellInfo(871)]    = { id = 871,    level = 15,}, -- 盾墙
		[GetSpellInfo(184364)]  = { id = 184364,  level = 15,}, -- 狂怒回复
		[GetSpellInfo(118038)]  = { id = 118038,  level = 15,}, -- 剑在人在
	--DH
		[GetSpellInfo(196555)]  = { id = 196555,  level = 15,}, -- 虚空行走 浩劫
	--猎人
		[GetSpellInfo(186265)]  = { id = 186265,  level = 15,}, -- 灵龟守护
	--盗贼
		[GetSpellInfo(31224)]  = { id = 31224,  level = 15,}, -- 暗影斗篷
		[GetSpellInfo(1966)]  = { id = 1966,  level = 15,}, -- 佯攻
	--术士
		[GetSpellInfo(104773)]  = { id = 104773,  level = 15,}, -- 不灭决心
	--法师
		[GetSpellInfo(45438)]  = { id = 45438,  level = 15,}, -- 寒冰屏障
	--武僧
		[GetSpellInfo(122470)]  = { id = 122470,  level = 15,}, -- 业报之触
		[GetSpellInfo(122783)]  = { id = 122783,  level = 15,}, -- 散魔功
	--萨满
		[GetSpellInfo(108271)]  = { id = 108271,  level = 15,}, -- 星界转移

	},
	["Debuffs"] = {
		[GetSpellInfo(243237)]  = { id = 243237,  level = 15,}, -- 爆裂
		[GetSpellInfo(240559)]  = { id = 240559,  level = 15,}, -- 重伤
		[GetSpellInfo(209858)]  = { id = 209858,  level = 15,}, -- 死疽
	},
}

--instanceID, name, description, bgImage, buttonImage, loreImage, dungeonAreaMapID, link = EJ_GetInstanceByIndex(index, isRaid)
--name, description, encounterID, rootSectionID, link = EJ_GetEncounterInfoByIndex(index[, instanceID])

G.Raids = {
	[EJ_GetInstanceInfo(768)] = { -- Cauchemar d'Emeraude
		EJ_GetEncounterInfo(1703),
		EJ_GetEncounterInfo(1738),
		EJ_GetEncounterInfo(1744),
		EJ_GetEncounterInfo(1667),
		EJ_GetEncounterInfo(1704),
		EJ_GetEncounterInfo(1750),
		EJ_GetEncounterInfo(1726),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(861)] = { -- Jugement des Valeureux
		EJ_GetEncounterInfo(1819),
		EJ_GetEncounterInfo(1830),
		EJ_GetEncounterInfo(1829),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(786)] = { -- Palais Sacrenuit
		EJ_GetEncounterInfo(1706),
		EJ_GetEncounterInfo(1725),
		EJ_GetEncounterInfo(1731),
		EJ_GetEncounterInfo(1751),
		EJ_GetEncounterInfo(1762),
		EJ_GetEncounterInfo(1713),
		EJ_GetEncounterInfo(1761),
		EJ_GetEncounterInfo(1732),
		EJ_GetEncounterInfo(1743),
		EJ_GetEncounterInfo(1737),
		"Trash",
	},
	[EJ_GetInstanceInfo(875)] = { -- Tombe de Sargeras
		EJ_GetEncounterInfo(1862),
		EJ_GetEncounterInfo(1867),
		EJ_GetEncounterInfo(1856),
		EJ_GetEncounterInfo(1903),
		EJ_GetEncounterInfo(1861),
		EJ_GetEncounterInfo(1896),
		EJ_GetEncounterInfo(1897),
		EJ_GetEncounterInfo(1873),
		EJ_GetEncounterInfo(1898),
		"Trash",
	},
	[EJ_GetInstanceInfo(946)] = { -- Antorus
		EJ_GetEncounterInfo(1992),
		EJ_GetEncounterInfo(1987),
		EJ_GetEncounterInfo(1997),
		EJ_GetEncounterInfo(1985),
		EJ_GetEncounterInfo(2025),
		EJ_GetEncounterInfo(2009),
		EJ_GetEncounterInfo(2004),
		EJ_GetEncounterInfo(1983),
		EJ_GetEncounterInfo(1986),
		EJ_GetEncounterInfo(1984),
		EJ_GetEncounterInfo(2031),
		"Trash",
	},

	[EJ_GetInstanceInfo(968)] = { -- Atal'dazar
		EJ_GetEncounterInfo(2082),
		EJ_GetEncounterInfo(2036),
		EJ_GetEncounterInfo(2083),
		EJ_GetEncounterInfo(2030),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1022)] = { -- Les tréfonds Putrides
		EJ_GetEncounterInfo(2157),
		EJ_GetEncounterInfo(2131),
		EJ_GetEncounterInfo(2130),
		EJ_GetEncounterInfo(2158),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1030)] = { -- Temple de Sephraliss
		EJ_GetEncounterInfo(2142),
		EJ_GetEncounterInfo(2143),
		EJ_GetEncounterInfo(2144),
		EJ_GetEncounterInfo(2145),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1012)] = { -- Le Filon
		EJ_GetEncounterInfo(2109),
		EJ_GetEncounterInfo(2114),
		EJ_GetEncounterInfo(2115),
		EJ_GetEncounterInfo(2116),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1021)] = { -- Manoir Malvoie
		EJ_GetEncounterInfo(2125),
		EJ_GetEncounterInfo(2126),
		EJ_GetEncounterInfo(2127),
		EJ_GetEncounterInfo(2128),
		EJ_GetEncounterInfo(2129),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1001)] = { -- Port-Liberté
		EJ_GetEncounterInfo(2102),
		EJ_GetEncounterInfo(2093),
		EJ_GetEncounterInfo(2094),
		EJ_GetEncounterInfo(2095),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1041)] = { -- Repos des rois
		EJ_GetEncounterInfo(2165),
		EJ_GetEncounterInfo(2171),
		EJ_GetEncounterInfo(2170),
		EJ_GetEncounterInfo(2172),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1036)] = { -- Sanctuaire des Tempetes
		EJ_GetEncounterInfo(2153),
		EJ_GetEncounterInfo(2154),
		EJ_GetEncounterInfo(2155),
		EJ_GetEncounterInfo(2156),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1023)] = { -- Siege de Boralus
		EJ_GetEncounterInfo(2133),
		EJ_GetEncounterInfo(2173),
		EJ_GetEncounterInfo(2134),
		EJ_GetEncounterInfo(2140),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1002)] = { -- Tol Dagor
		EJ_GetEncounterInfo(2097),
		EJ_GetEncounterInfo(2098),
		EJ_GetEncounterInfo(2099),
		EJ_GetEncounterInfo(2096),
		"Trash",
	},
	
	[EJ_GetInstanceInfo(1028)] = { -- Azeroth boss BFA
		EJ_GetEncounterInfo(2139),
		EJ_GetEncounterInfo(2141),
		EJ_GetEncounterInfo(2197),
		EJ_GetEncounterInfo(2212),
		EJ_GetEncounterInfo(2199),
		EJ_GetEncounterInfo(2198),
		EJ_GetEncounterInfo(2210),
	},
	
	[EJ_GetInstanceInfo(1031)] = { -- Uldir
		EJ_GetEncounterInfo(2168),
		EJ_GetEncounterInfo(2167),
		EJ_GetEncounterInfo(2146),
		EJ_GetEncounterInfo(2169),
		EJ_GetEncounterInfo(2166),
		EJ_GetEncounterInfo(2195),
		EJ_GetEncounterInfo(2194),
		EJ_GetEncounterInfo(2147),
		"Trash",
	},
}

G.DebuffList = {
	[EJ_GetInstanceInfo(768)] = { -- Le Cauchemar d'Emeraude
	
		[EJ_GetEncounterInfo(1703)]={
			[GetSpellInfo(204504)] = {id = 204504, level = 8,},
			[GetSpellInfo(203045)] = {id = 203045, level = 8,},
			[GetSpellInfo(203096)] = {id = 203096, level = 8,},
			[GetSpellInfo(204463)] = {id = 204463, level = 8,},
			[GetSpellInfo(203646)] = {id = 203646, level = 8,},
			[GetSpellInfo(202978)] = {id = 202978, level = 8,},
			[GetSpellInfo(205043)] = {id = 205043, level = 8,},
		},
		[EJ_GetEncounterInfo(1738)]={
			[GetSpellInfo(210099)] = {id = 210099, level = 8,},
			[GetSpellInfo(209469)] = {id = 209469, level = 8,},
			[GetSpellInfo(210984)] = {id = 210984, level = 8,},
			[GetSpellInfo(208697)] = {id = 208697, level = 8,},
			[GetSpellInfo(208929)] = {id = 208929, level = 8,},
			[GetSpellInfo(212886)] = {id = 212886, level = 8,},
			[GetSpellInfo(215128)] = {id = 215128, level = 8,},
			[GetSpellInfo(215836)] = {id = 215836, level = 8,},
			[GetSpellInfo(215845)] = {id = 215845, level = 8,},
			[GetSpellInfo(209471)] = {id = 209471, level = 8,},
		},
		[EJ_GetEncounterInfo(1744)]={
			[GetSpellInfo(210228)] = {id = 210228, level = 8,},
			[GetSpellInfo(215300)] = {id = 215300, level = 8,},
			--[GetSpellInfo(215307)] = {id = 215307, level = 8,},
			[GetSpellInfo(213124)] = {id = 213124, level = 8,},
			--[GetSpellInfo(215489)] = {id = 215489, level = 8,},
			[GetSpellInfo(215460)] = {id = 215460, level = 8,},
			[GetSpellInfo(215582)] = {id = 215582, level = 8,},
			[GetSpellInfo(210850)] = {id = 210850, level = 8,},
			[GetSpellInfo(218124)] = {id = 218124, level = 8,},
			--[GetSpellInfo(218144)] = {id = 218144, level = 8,},
			[GetSpellInfo(218519)] = {id = 218519, level = 8,},
		},
		[EJ_GetEncounterInfo(1667)]={
			[GetSpellInfo(197943)] = {id = 197943, level = 8,},
			[GetSpellInfo(204859)] = {id = 204859, level = 8,},
			[GetSpellInfo(198006)] = {id = 198006, level = 8,},
			[GetSpellInfo(198108)] = {id = 198108, level = 8,},
			[GetSpellInfo(198388)] = {id = 198388, level = 8,},
			[GetSpellInfo(198392)] = {id = 198392, level = 8,},
			[GetSpellInfo(205611)] = {id = 205611, level = 8,},
			[GetSpellInfo(197980)] = {id = 197980, level = 8,},
		},
		[EJ_GetEncounterInfo(1704)]={
			[GetSpellInfo(207681)] = {id = 207681, level = 8,},
			[GetSpellInfo(204731)] = {id = 204731, level = 8,},
			[GetSpellInfo(204044)] = {id = 204044, level = 8,},
			[GetSpellInfo(205341)] = {id = 205341, level = 8,},
			[GetSpellInfo(203121)] = {id = 203121, level = 8,},
			[GetSpellInfo(203124)] = {id = 203124, level = 8,},
			[GetSpellInfo(203125)] = {id = 203125, level = 8,},
			[GetSpellInfo(203102)] = {id = 203102, level = 8,},
			[GetSpellInfo(203110)] = {id = 203110, level = 8,},
			[GetSpellInfo(203770)] = {id = 203770, level = 8,},
			[GetSpellInfo(203787)] = {id = 203787, level = 8,},
			[GetSpellInfo(204078)] = {id = 204078, level = 8,},
			[GetSpellInfo(214543)] = {id = 214543, level = 8,},
		},
		[EJ_GetEncounterInfo(1750)]={
			[GetSpellInfo(210279)] = {id = 210279, level = 8,},
			[GetSpellInfo(210315)] = {id = 210315, level = 8,},
			[GetSpellInfo(212681)] = {id = 212681, level = 8,},
			[GetSpellInfo(211612)] = {id = 211612, level = 8,},
			[GetSpellInfo(211989)] = {id = 211989, level = 8,}, -- buff
			[GetSpellInfo(211990)] = {id = 211990, level = 8,},
			[GetSpellInfo(216516)] = {id = 216516, level = 8,},
			[GetSpellInfo(211507)] = {id = 211507, level = 8,},
			[GetSpellInfo(211471)] = {id = 211471, level = 8,},
			[GetSpellInfo(213162)] = {id = 213162, level = 8,},
		},
		[EJ_GetEncounterInfo(1726)]={
			[GetSpellInfo(206005)] = {id = 206005, level = 8,},
			[GetSpellInfo(206109)] = {id = 206109, level = 8,},
			[GetSpellInfo(206651)] = {id = 206651, level = 8,},
			[GetSpellInfo(209158)] = {id = 209158, level = 8,},
			[GetSpellInfo(210451)] = {id = 210451, level = 8,},
			--[GetSpellInfo(209034)] = {id = 209034, level = 8,},
			[GetSpellInfo(208431)] = {id = 208431, level = 8,},
			[GetSpellInfo(207409)] = {id = 207409, level = 8,},
			[GetSpellInfo(208385)] = {id = 208385, level = 8,},
			[GetSpellInfo(211802)] = {id = 211802, level = 8,},
			[GetSpellInfo(224508)] = {id = 224508, level = 8,},
			[GetSpellInfo(205771)] = {id = 205771, level = 8,},
			[GetSpellInfo(211634)] = {id = 211634, level = 8,},
		},
		["Trash"] = {
		
		},
	},

	[EJ_GetInstanceInfo(861)] = { -- LE Jugement des Valeureux
		[EJ_GetEncounterInfo(1819)]={
			[GetSpellInfo(228932)] = {id = 228932, level = 8,}, --228918
			[GetSpellInfo(227491)] = {id = 227491, level = 8,},
			[GetSpellInfo(227490)] = {id = 227490, level = 8,},
			[GetSpellInfo(227500)] = {id = 227500, level = 8,},
			[GetSpellInfo(227498)] = {id = 227498, level = 8,},
			[GetSpellInfo(227499)] = {id = 227499, level = 8,},
			[GetSpellInfo(227781)] = {id = 227781, level = 8,},
			[GetSpellInfo(227475)] = {id = 227475, level = 8,},
			[GetSpellInfo(228029)] = {id = 228029, level = 8,},
			[GetSpellInfo(228007)] = {id = 228007, level = 8,},
		},
		[EJ_GetEncounterInfo(1830)]={
			[GetSpellInfo(228769)] = {id = 228769, level = 8,},
			[GetSpellInfo(228758)] = {id = 228758, level = 8,},
			[GetSpellInfo(228768)] = {id = 228768, level = 8,},
			[GetSpellInfo(228253)] = {id = 228253, level = 8,},
			[GetSpellInfo(228228)] = {id = 228228, level = 8,},
			[GetSpellInfo(228248)] = {id = 228248, level = 8,},
			[GetSpellInfo(219966)] = {id = 228248, level = 8,},
		},
		[EJ_GetEncounterInfo(1829)]={
			[GetSpellInfo(227982)] = {id = 227982, level = 8,},
			[GetSpellInfo(228054)] = {id = 228054, level = 8,},
			[GetSpellInfo(193367)] = {id = 193367, level = 8,},
			[GetSpellInfo(229119)] = {id = 229119, level = 8,},
			[GetSpellInfo(228127)] = {id = 228127, level = 8,},
			[GetSpellInfo(228055)] = {id = 228055, level = 8,},
			[GetSpellInfo(228519)] = {id = 228519, level = 8,},
			[GetSpellInfo(230197)] = {id = 230197, level = 8,},
			[GetSpellInfo(227998)] = {id = 227998, level = 8,},
			[GetSpellInfo(230267)] = {id = 230267, level = 8,},
			[GetSpellInfo(232488)] = {id = 232488, level = 8,},
			[GetSpellInfo(232450)] = {id = 232450, level = 8,},
		},
        ["Trash"] = {
		
		},
	},
	
	[EJ_GetInstanceInfo(786)] = { -- Palais Sacrenuit
		[EJ_GetEncounterInfo(1706)]={
			[GetSpellInfo(204284)] = {id = 204284, level = 8,},
			[GetSpellInfo(204483)] = {id = 204483, level = 8,},
			[GetSpellInfo(204744)] = {id = 204744, level = 8,},
		},
		[EJ_GetEncounterInfo(1725)]={
			[GetSpellInfo(206607)] = {id = 206607, level = 8,},
			[GetSpellInfo(206617)] = {id = 206617, level = 8,},
			[GetSpellInfo(219964)] = {id = 219964, level = 8,},
		},
		[EJ_GetEncounterInfo(1731)]={
			[GetSpellInfo(206641)] = {id = 206641, level = 8,},
			[GetSpellInfo(214573)] = {id = 214573, level = 8,},
			[GetSpellInfo(206838)] = {id = 206838, level = 8,},
			[GetSpellInfo(208499)] = {id = 208499, level = 8,},
			[GetSpellInfo(208910)] = {id = 208910, level = 8,},
			[GetSpellInfo(206798)] = {id = 206798, level = 8,},
            [GetSpellInfo(215062)] = {id = 215062, level = 8,},
		},
		[EJ_GetEncounterInfo(1751)]={
			[GetSpellInfo(215458)] = {id = 215458, level = 8,},
			[GetSpellInfo(212531)] = {id = 212531, level = 8,},
			[GetSpellInfo(212647)] = {id = 212647, level = 8,},
			[GetSpellInfo(213148)] = {id = 213148, level = 8,},
			[GetSpellInfo(213504)] = {id = 213504, level = 8,},
			[GetSpellInfo(212736)] = {id = 212736, level = 8,},
			[GetSpellInfo(213278)] = {id = 213278, level = 8,},
		},
		[EJ_GetEncounterInfo(1762)]={
			[GetSpellInfo(206480)] = {id = 206480, level = 8,},
			[GetSpellInfo(208230)] = {id = 208230, level = 8,},
			[GetSpellInfo(212794)] = {id = 212794, level = 8,},
			[GetSpellInfo(215988)] = {id = 215988, level = 8,},
			[GetSpellInfo(206466)] = {id = 206466, level = 8,},
			[GetSpellInfo(216024)] = {id = 216024, level = 8,},
			[GetSpellInfo(216027)] = {id = 216027, level = 8,},
			[GetSpellInfo(216040)] = {id = 216040, level = 8,},
			[GetSpellInfo(216685)] = {id = 216685, level = 8,},
		},
		[EJ_GetEncounterInfo(1713)]={
			[GetSpellInfo(206677)] = {id = 206677, level = 8,},
			[GetSpellInfo(205344)] = {id = 205344, level = 8,},
		},
		[EJ_GetEncounterInfo(1761)]={
			[GetSpellInfo(218342)] = {id = 218342, level = 8,},
			[GetSpellInfo(218503)] = {id = 218503, level = 8,},
			[GetSpellInfo(218780)] = {id = 218780, level = 8,},
			[GetSpellInfo(218304)] = {id = 218304, level = 8,},
			[GetSpellInfo(218809)] = {id = 218809, level = 8,},
			[GetSpellInfo(219235)] = {id = 219235, level = 8,},
			[GetSpellInfo(225105)] = {id = 225105, level = 8,},
		},
		[EJ_GetEncounterInfo(1732)]={
			[GetSpellInfo(206965)] = {id = 206965, level = 8,},
			[GetSpellInfo(206464)] = {id = 206464, level = 8,},
			[GetSpellInfo(214167)] = {id = 214167, level = 8,},
			[GetSpellInfo(206398)] = {id = 206398, level = 8,},
			[GetSpellInfo(205649)] = {id = 205649, level = 8,},
			[GetSpellInfo(206936)] = {id = 206936, level = 8,},
			[GetSpellInfo(207720)] = {id = 207720, level = 8,},
			[GetSpellInfo(206585)] = {id = 206585, level = 8,},
			[GetSpellInfo(206589)] = {id = 206589, level = 8,},
			[GetSpellInfo(207831)] = {id = 207831, level = 8,},
			[GetSpellInfo(205445)] = {id = 205445, level = 8,},
			[GetSpellInfo(205429)] = {id = 205429, level = 8,},
			[GetSpellInfo(216345)] = {id = 216345, level = 8,},
			[GetSpellInfo(216344)] = {id = 216344, level = 8,},
		},
		[EJ_GetEncounterInfo(1743)]={
			[GetSpellInfo(209166)] = {id = 209166, level = 8,},
			[GetSpellInfo(209165)] = {id = 209165, level = 8,},
			[GetSpellInfo(209433)] = {id = 209433, level = 8,},
			[GetSpellInfo(211261)] = {id = 211261, level = 8,},
			[GetSpellInfo(209244)] = {id = 209244, level = 8,},
			[GetSpellInfo(209615)] = {id = 209615, level = 8,},
			[GetSpellInfo(209973)] = {id = 209973, level = 8,},
		},
		[EJ_GetEncounterInfo(1737)] = {
			[GetSpellInfo(221891)] = {id = 221891, level = 8,},
			[GetSpellInfo(221728)] = {id = 221728, level = 8,},
			[GetSpellInfo(221606)] = {id = 221606, level = 8,},
			[GetSpellInfo(209454)] = {id = 209454, level = 8,},
			[GetSpellInfo(208802)] = {id = 208802, level = 8,},
			[GetSpellInfo(206222)] = {id = 206222, level = 8,},
			[GetSpellInfo(206366)] = {id = 206366, level = 8,},
			[GetSpellInfo(217830)] = {id = 217830, level = 8,},
			[GetSpellInfo(206847)] = {id = 206847, level = 8,},
			[GetSpellInfo(206310)] = {id = 206310, level = 8,},
			[GetSpellInfo(221486)] = {id = 221486, level = 8,},
			[GetSpellInfo(221326)] = {id = 221326, level = 8,},
			[GetSpellInfo(221781)] = {id = 221781, level = 8,},
			[GetSpellInfo(209191)] = {id = 209191, level = 8,},
			[GetSpellInfo(227009)] = {id = 227009, level = 8,},
			[GetSpellInfo(206506)] = {id = 206506, level = 8,},
			[GetSpellInfo(221299)] = {id = 221299, level = 8,},
			},
		["Trash"] = {
		
		},
	},
	
	[EJ_GetInstanceInfo(875)] = { -- Tombe de Sargeras
		[EJ_GetEncounterInfo(1862)] = { --> 格罗斯
			[GetSpellInfo(206398)] = {id = 206398, level = 8,},
			[GetSpellInfo(230345)] = {id = 230345, level = 8,},
			[GetSpellInfo(231363)] = {id = 231363, level = 8,},
			[GetSpellInfo(230348)] = {id = 230348, level = 8,},
		},
		[EJ_GetEncounterInfo(1867)] = { --> 恶魔审判庭
			[GetSpellInfo(233983)] = {id = 233983, level = 8,},
			[GetSpellInfo(233894)] = {id = 233894, level = 8,},
		},
		[EJ_GetEncounterInfo(1856)] = { --> 哈亚坦
			[GetSpellInfo(231998)] = {id = 231998, level = 8,},
			[GetSpellInfo(231770)] = {id = 231770, level = 8,},
			[GetSpellInfo(231729)] = {id = 231729, level = 8,},
			[GetSpellInfo(234016)] = {id = 234016, level = 8,},
			[GetSpellInfo(231768)] = {id = 231768, level = 8,},
		},
		[EJ_GetEncounterInfo(1903)] = { --> 月之姐妹
			[GetSpellInfo(234995)] = {id = 234995, level = 8,},
			[GetSpellInfo(234996)] = {id = 234996, level = 8,},
			[GetSpellInfo(236330)] = {id = 236330, level = 8,},
			[GetSpellInfo(237561)] = {id = 237561, level = 8,},
			[GetSpellInfo(236529)] = {id = 236529, level = 8,},
			[GetSpellInfo(236550)] = {id = 236550, level = 8,},
			[GetSpellInfo(236305)] = {id = 236305, level = 8,},
			[GetSpellInfo(236596)] = {id = 236596, level = 8,},
			[GetSpellInfo(236519)] = {id = 236519, level = 8,},
			[GetSpellInfo(236712)] = {id = 236712, level = 8,},
			[GetSpellInfo(239264)] = {id = 239264, level = 8,},
			[GetSpellInfo(233263)] = {id = 233263, level = 8,},
		},
		[EJ_GetEncounterInfo(1861)] = { --> 主母萨丝琳
			[GetSpellInfo(230139)] = {id = 230139, level = 8,},
			[GetSpellInfo(232754)] = {id = 232754, level = 8,},
			[GetSpellInfo(230201)] = {id = 230201, level = 8,},
			[GetSpellInfo(230276)] = {id = 230276, level = 8,},
			[GetSpellInfo(230959)] = {id = 230959, level = 8,},
			[GetSpellInfo(230384)] = {id = 230384, level = 8,},
			[GetSpellInfo(234661)] = {id = 234661, level = 8,},
			[GetSpellInfo(234621)] = {id = 234621, level = 8,},
			[GetSpellInfo(232913)] = {id = 232913, level = 8,},
		},
		[EJ_GetEncounterInfo(1896)] = { --> 绝望的聚合体
			[GetSpellInfo(235924)] = {id = 235924, level = 8,},
			--[GetSpellInfo(238442)] = {id = 238442, level = 8,},
			[GetSpellInfo(235907)] = {id = 235907, level = 8,},
			[GetSpellInfo(238018)] = {id = 238018, level = 8,},
			[GetSpellInfo(236011)] = {id = 236011, level = 8,},
			[GetSpellInfo(236131)] = {id = 236131, level = 8,},
			[GetSpellInfo(236138)] = {id = 236138, level = 8,},
			[GetSpellInfo(236459)] = {id = 236459, level = 8,},
			[GetSpellInfo(235969)] = {id = 235969, level = 8,},
			[GetSpellInfo(236515)] = {id = 236515, level = 8,},
			[GetSpellInfo(236361)] = {id = 236361, level = 8,},
			[GetSpellInfo(236241)] = {id = 236241, level = 8,},
        },
		[EJ_GetEncounterInfo(1897)] = { --> 戒卫侍女
			[GetSpellInfo(235117)] = {id = 235117, level = 8,},
			[GetSpellInfo(235240)] = {id = 235240, level = 8,},
			[GetSpellInfo(235213)] = {id = 235213, level = 8,},
			[GetSpellInfo(248812)] = {id = 248812, level = 8,},
			[GetSpellInfo(235534)] = {id = 235534, level = 8,},
			[GetSpellInfo(235538)] = {id = 235538, level = 8,},
	    },
		[EJ_GetEncounterInfo(1873)] = { --> 堕落的化身
			[GetSpellInfo(234059)] = {id = 234059, level = 8,},
			[GetSpellInfo(236494)] = {id = 236494, level = 8,},
			[GetSpellInfo(239739)] = {id = 239739, level = 8,},
		},
		[EJ_GetEncounterInfo(1898)] = { --> 基尔加丹
			[GetSpellInfo(234310)] = {id = 234310, level = 8,},
			[GetSpellInfo(240916)] = {id = 240916, level = 8,},
			[GetSpellInfo(236710)] = {id = 236710, level = 8,},
			[GetSpellInfo(236378)] = {id = 236378, level = 8,},
			[GetSpellInfo(241822)] = {id = 241822, level = 8,},
			[GetSpellInfo(236555)] = {id = 236555, level = 8,},
			[GetSpellInfo(242696)] = {id = 242696, level = 8,},
			[GetSpellInfo(241721)] = {id = 241721, level = 8,},
			[GetSpellInfo(239216)] = {id = 239216, level = 8,},
			[GetSpellInfo(239155)] = {id = 239155, level = 8,},
			[GetSpellInfo(239931)] = {id = 239931, level = 8,},
			[GetSpellInfo(240908)] = {id = 240908, level = 8,},
			[GetSpellInfo(245509)] = {id = 245509, level = 8,},
			[GetSpellInfo(238502)] = {id = 238502, level = 8,},
			[GetSpellInfo(238455)] = {id = 238455, level = 8,},
		},
		["Trash"] = {
		
		},
	},	

	[EJ_GetInstanceInfo(946)] = { -- Antorus
		[EJ_GetEncounterInfo(1992)] = { --> 加洛西灭世者
			[GetSpellInfo(246220)] = {id = 246220, level = 8,}, --邪能轰炸
			[GetSpellInfo(244410)] = {id = 244410, level = 8,}, --屠戮
			[GetSpellInfo(246920)] = {id = 246920, level = 8,}, --错乱屠戮
		},
		
		[EJ_GetEncounterInfo(1987)] = { --> 萨格拉斯的恶犬
			[GetSpellInfo(251445)] = {id = 251445, level = 8,}, --闷烧
			[GetSpellInfo(245098)] = {id = 245098, level = 8,}, --腐蚀
			[GetSpellInfo(244768)] = {id = 244768, level = 8,}, --荒芜凝视
			[GetSpellInfo(244072)] = {id = 244072, level = 8,}, --熔火之触
			[GetSpellInfo(244091)] = {id = 244091, level = 8,}, --烧焦
			[GetSpellInfo(248815)] = {id = 248815, level = 8,}, --燃烧腐蚀
			[GetSpellInfo(254429)] = {id = 254429, level = 8,}, --黑暗压迫
			[GetSpellInfo(248819)] = {id = 248819, level = 8,}, --虹吸腐蚀
			[GetSpellInfo(244055)] = {id = 244055, level = 8,}, --暗影触痕
			[GetSpellInfo(244054)] = {id = 244054, level = 8,}, --烈焰触痕
			[GetSpellInfo(245022)] = {id = 245022, level = 8,}, --炽然
			[GetSpellInfo(244071)] = {id = 244071, level = 8,}, --恐惧		
		},
		
		[EJ_GetEncounterInfo(1997)] = { --> 安托兰统帅议会
			[GetSpellInfo(257974)] = { id = 257974, level = 8, }, --混乱脉冲
			[GetSpellInfo(244892)] = { id = 244892, level = 8, }, --弱点攻击
			[GetSpellInfo(244737)] = { id = 244737, level = 8, }, --震荡手雷
			[GetSpellInfo(244748)] = { id = 244748, level = 8, }, --震荡手雷
			[GetSpellInfo(244172)] = { id = 244172, level = 8, }, --灵能突袭
			[GetSpellInfo(253306)] = { id = 253306, level = 8, }, --灵能创伤
			[GetSpellInfo(244910)] = { id = 244910, level = 8, }, --邪能护盾
			[GetSpellInfo(253037)] = { id = 253037, level = 8, }, --恶魔冲锋
		},
		
		[EJ_GetEncounterInfo(1985)] = { --> 传送门守护者哈萨贝尔
			[GetSpellInfo(244016)] = { id = 244016, level = 8, }, -- 时空裂隙
			[GetSpellInfo(246208)] = { id = 246208, level = 8, }, -- 酸性之网
			[GetSpellInfo(244613)] = { id = 244613, level = 8, }, -- 永燃烈焰
			[GetSpellInfo(244849)] = { id = 244849, level = 8, }, -- 腐蚀烂泥
			[GetSpellInfo(245075)] = { id = 245075, level = 8, }, -- 饥饿幽影
			[GetSpellInfo(245118)] = { id = 245118, level = 8, }, -- 饱足幽影
			[GetSpellInfo(244949)] = { id = 244949, level = 8, }, -- 邪丝缠缚
			[GetSpellInfo(244915)] = { id = 244915, level = 8, }, -- 吸取精华
			[GetSpellInfo(245050)] = { id = 245050, level = 8, }, -- 欺骗幻境
			[GetSpellInfo(245040)] = { id = 245040, level = 8, }, -- 腐蚀
			[GetSpellInfo(244709)] = { id = 244709, level = 8, }, -- 烈焰引爆
		},
		
		[EJ_GetEncounterInfo(2025)] = { --> 生命的缚誓者艾欧娜尔
			[GetSpellInfo(248795)] = { id = 248795, level = 8, }, -- 邪能池
			[GetSpellInfo(248332)] = { id = 248332, level = 8, }, -- 邪能之雨
			[GetSpellInfo(249017)] = { id = 249017, level = 8, }, -- 反馈-奥术奇点
			[GetSpellInfo(250693)] = { id = 250693, level = 8, }, -- 奥能累积
			[GetSpellInfo(249014)] = { id = 249014, level = 8, }, -- 反馈-邪污足迹
			[GetSpellInfo(250140)] = { id = 250140, level = 8, }, -- 邪污足迹
			[GetSpellInfo(249015)] = { id = 249015, level = 8, }, -- 反馈-燃烧的余烬
			[GetSpellInfo(250691)] = { id = 250691, level = 8, }, -- 燃烧的余烬
			[GetSpellInfo(249016)] = { id = 249016, level = 8, }, -- 反馈-目标锁定     
			[GetSpellInfo(249194)] = { id = 249194, level = 8, }, -- 痛苦    
		},
		
		[EJ_GetEncounterInfo(2009)] = { --> 裂魂者伊墨纳尔
			[GetSpellInfo(247367)] = { id = 247367, level = 8, }, -- 震击之枪
			[GetSpellInfo(250255)] = { id = 250255, level = 8, }, -- 强化震击之枪
			[GetSpellInfo(255029)] = { id = 255029, level = 8, }, -- 催眠气罐
			[GetSpellInfo(247565)] = { id = 247565, level = 8, }, -- 催眠毒气
			[GetSpellInfo(250006)] = { id = 250006, level = 8, }, -- 强化脉冲手雷
			[GetSpellInfo(247716)] = { id = 247716, level = 8, }, -- 充能轰炸
			[GetSpellInfo(247687)] = { id = 247687, level = 8, }, -- 撕裂
			[GetSpellInfo(247932)] = { id = 247932, level = 8, }, -- 霰弹爆破
			[GetSpellInfo(248070)] = { id = 248070, level = 8, }, -- 强化霰弹爆破
			[GetSpellInfo(254183)] = { id = 254183, level = 8, }, -- 灼伤皮肤
			[GetSpellInfo(247641)] = { id = 247641, level = 8, }, -- 静滞陷阱
			[GetSpellInfo(250224)] = { id = 250224, level = 8, }, -- 震晕
			[GetSpellInfo(248321)] = { id = 248321, level = 8, }, -- 洪荒烈火
			[GetSpellInfo(248255)] = { id = 248255, level = 8, }, -- 地狱火火箭
		},
		
		[EJ_GetEncounterInfo(2004)] = { --> 金加洛斯
			[GetSpellInfo(254919)] = { id = 254919, level = 8, }, -- 熔铸之击
			[GetSpellInfo(245770)] = { id = 245770, level = 8, }, -- 屠戮
			[GetSpellInfo(249535)] = { id = 249535, level = 8, }, -- 破坏术
			[GetSpellInfo(249686)] = { id = 249686, level = 8, }, -- 轰鸣屠戮
			[GetSpellInfo(246698)] = { id = 246698, level = 8, }, -- 破坏
			[GetSpellInfo(246840)] = { id = 246840, level = 8, }, -- 毁灭者
		},
		
		[EJ_GetEncounterInfo(1983)] = { --> 瓦里玛萨斯                  
			[GetSpellInfo(243968)] = { id = 243968, level = 8, }, -- 烈焰折磨
			[GetSpellInfo(243977)] = { id = 243977, level = 8, }, -- 冰霜折磨
			[GetSpellInfo(243980)] = { id = 243980, level = 8, }, -- 邪能折磨
			[GetSpellInfo(243973)] = { id = 243973, level = 8, }, -- 暗影折磨
			[GetSpellInfo(243961)] = { id = 243961, level = 8, }, -- 哀难
			[GetSpellInfo(244005)] = { id = 244005, level = 8, }, -- 黑暗裂隙
			[GetSpellInfo(244094)] = { id = 244094, level = 8, }, -- 冥魂之拥
			[GetSpellInfo(248732)] = { id = 248732, level = 8, }, -- 毁灭回响
			[GetSpellInfo(244042)] = { id = 244042, level = 8, }, -- 被标记的猎物
		},
		
		[EJ_GetEncounterInfo(1986)] = { --> 破坏魔女巫会
			[GetSpellInfo(253753)] = { id = 253753, level = 8, }, -- 恐惧
			[GetSpellInfo(244899)] = { id = 244899, level = 8, }, -- 火焰打击
			[GetSpellInfo(245634)] = { id = 245634, level = 8, }, -- 飞旋的军刀
			[GetSpellInfo(253520)] = { id = 253520, level = 8, }, -- 爆裂冲击
			[GetSpellInfo(253020)] = { id = 253020, level = 8, }, -- 黑暗风暴
			[GetSpellInfo(245518)] = { id = 245518, level = 8, }, -- 快速冻结
			[GetSpellInfo(245586)] = { id = 245586, level = 8, }, -- 冷凝之血
			[GetSpellInfo(253697)] = { id = 253697, level = 8, }, -- 冰霜之球
			[GetSpellInfo(250757)] = { id = 250757, level = 8, }, -- 宇宙之光
			[GetSpellInfo(250097)] = { id = 250097, level = 8, }, -- 阿曼苏尔的诡诈
		},
		
		[EJ_GetEncounterInfo(1984)] = { --> 阿格拉玛
			[GetSpellInfo(245990)] = { id = 245990, level = 8, }, -- 泰沙拉克之触
			[GetSpellInfo(245994)] = { id = 245994, level = 8, }, -- 灼热之焰
			[GetSpellInfo(254452)] = { id = 254452, level = 8, }, -- 饕餮烈焰
			[GetSpellInfo(244736)] = { id = 244736, level = 8, }, -- 烈焰之迹
			[GetSpellInfo(244291)] = { id = 244291, level = 8, }, -- 破敌者
			[GetSpellInfo(255060)] = { id = 255060, level = 8, }, -- 强化破敌者
			[GetSpellInfo(247079)] = { id = 247079, level = 8, }, -- 强化撕裂烈焰
			[GetSpellInfo(244912)] = { id = 244912, level = 8, }, -- 烈焰喷薄
			[GetSpellInfo(245916)] = { id = 245916, level = 8, }, -- 熔火残渣
			
		},
		
		[EJ_GetEncounterInfo(2031)] = { --> 寂灭者阿古斯
			[GetSpellInfo(248167)] = { id = 248167, level = 8, }, -- 死亡之雾
			[GetSpellInfo(248396)] = { id = 248396, level = 8, }, -- 灵魂凋零
			[GetSpellInfo(248499)] = { id = 248499, level = 8, }, -- 巨镰横扫
			[GetSpellInfo(258646)] = { id = 258646, level = 8, }, -- 天空之赐
			[GetSpellInfo(253903)] = { id = 253903, level = 8, }, -- 天空之力
			[GetSpellInfo(258647)] = { id = 258647, level = 8, }, -- 海洋之赐
			[GetSpellInfo(253901)] = { id = 253901, level = 8, }, -- 海洋之力
			[GetSpellInfo(250669)] = { id = 250669, level = 8, }, -- 灵魂爆发
			[GetSpellInfo(251570)] = { id = 251570, level = 8, }, -- 灵魂炸弹
			[GetSpellInfo(255199)] = { id = 255199, level = 8, }, -- 阿格拉玛的化身
			[GetSpellInfo(255200)] = { id = 255200, level = 8, }, -- 阿格拉玛的恩赐
			[GetSpellInfo(252729)] = { id = 252729, level = 8, }, -- 宇宙射线
			[GetSpellInfo(252616)] = { id = 252616, level = 8, }, -- 宇宙道标
			[GetSpellInfo(252634)] = { id = 252634, level = 8, }, -- 宇宙重击
			[GetSpellInfo(257299)] = { id = 257299, level = 8, }, -- 怒火余烬
			[GetSpellInfo(258039)] = { id = 258039, level = 8, }, -- 死亡之镰
			[GetSpellInfo(256899)] = { id = 256899, level = 8, }, -- 灵魂引爆
			[GetSpellInfo(258834)] = { id = 258834, level = 8, }, -- 毁灭之锋
			[GetSpellInfo(257931)] = { id = 257931, level = 8, }, -- 萨格拉斯的恐惧
			[GetSpellInfo(257869)] = { id = 257869, level = 8, }, -- 萨格拉斯的狂怒
			[GetSpellInfo(257911)] = { id = 257911, level = 8, }, -- 狂野怒意
			[GetSpellInfo(257930)] = { id = 257930, level = 8, }, -- 毁灭之惧
			[GetSpellInfo(257966)] = { id = 257966, level = 8, }, -- 萨格拉斯的判决
		},
		
		["Trash"] = {
			[GetSpellInfo(252621)] = { id = 252621, level = 8, }, -- 魔化束缚
			[GetSpellInfo(257920)] = { id = 257920, level = 8, }, -- 魔能火炬
			[GetSpellInfo(244590)] = { id = 244590, level = 8, }, -- 炽热熔火魔能
			[GetSpellInfo(249297)] = { id = 249297, level = 8, }, -- 归源之焰
			[GetSpellInfo(246199)] = { id = 246199, level = 8, }, -- 燃烧之风
			[GetSpellInfo(246209)] = { id = 246209, level = 8, }, -- 惩戒烈焰
			[GetSpellInfo(254122)] = { id = 254122, level = 8, }, -- 混乱云雾
		},
	},
	
	[EJ_GetInstanceInfo(968)] = { -- Atal'Dazar
		[EJ_GetEncounterInfo(2082)] = { --> Prêtresse Alun'za
			[GetSpellInfo(255582)] = {id = 255582, level = 8,}, 
			[GetSpellInfo(255558)] = {id = 255558, level = 8,}, 
		},
		[EJ_GetEncounterInfo(2036)] = { --> Vol'kaal
			[GetSpellInfo(250371)] = {id = 250371, level = 8,}, 
		},
		[EJ_GetEncounterInfo(2083)] = { --> Rezan
			[GetSpellInfo(255371)] = {id = 255371, level = 8,}, 
			[GetSpellInfo(255421)] = {id = 255421, level = 8,}, 
			[GetSpellInfo(255434)] = {id = 255434, level = 8,}, 
			},
		[EJ_GetEncounterInfo(2030)] = { --> Yazma
			[GetSpellInfo(250096)] = {id = 250096, level = 8,},
			[GetSpellInfo(256577)] = {id = 256577, level = 8,},
			[GetSpellInfo(259190)] = {id = 259190, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(252781)] = {id = 252781, level = 8,},
			[GetSpellInfo(253562)] = {id = 253562, level = 8,},			
			[GetSpellInfo(255041)] = {id = 255041, level = 8,},
			[GetSpellInfo(252687)] = {id = 252687, level = 8,},
			[GetSpellInfo(254959)] = {id = 254959, level = 8,},		
			[GetSpellInfo(255814)] = {id = 255814, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1022)] = { -- Les Tréfonds Putrides
		[EJ_GetEncounterInfo(2157)] = { --> Leaxa l'aînée
			[GetSpellInfo(260685)] = {id = 260685, level = 8,},
		},
		[EJ_GetEncounterInfo(2131)] = { --> Gueule-de-pierre l'Infesté

		},
		[EJ_GetEncounterInfo(2130)] = { --> Zancha le Mande-spores
			[GetSpellInfo(259714)] = {id = 259714, level = 8,},
		},
		[EJ_GetEncounterInfo(2158)] = { --> Monstruosité déchaînée
			[GetSpellInfo(269301)] = {id = 269301, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(265468)] = {id = 265468, level = 8,},
			[GetSpellInfo(278961)] = {id = 278961, level = 8,},
			[GetSpellInfo(272180)] = {id = 272180, level = 8,},
			[GetSpellInfo(272609)] = {id = 272609, level = 8,},
			[GetSpellInfo(265533)] = {id = 265533, level = 8,},
			[GetSpellInfo(265019)] = {id = 265019, level = 8,},
			[GetSpellInfo(265377)] = {id = 265377, level = 8,},
			[GetSpellInfo(265625)] = {id = 265625, level = 8,},
			[GetSpellInfo(266107)] = {id = 266107, level = 8,},
			[GetSpellInfo(260455)] = {id = 260455, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1030)] = { -- Temple de Sephrasliss
		[EJ_GetEncounterInfo(2142)] = { --> Viperis et Aspis
			[GetSpellInfo(263371)] = {id = 263371, level = 8,},
		},
		[EJ_GetEncounterInfo(2143)] = { --> Merekpha
			[GetSpellInfo(263914)] = {id = 263914, level = 8,},
			[GetSpellInfo(263958)] = {id = 263958, level = 8,},
		},
		[EJ_GetEncounterInfo(2144)] = { --> Galvazzt
			[GetSpellInfo(266923)] = {id = 266923, level = 8,},
		},
		[EJ_GetEncounterInfo(2145)] = { --> Avatar de Sephraliss

		},
		["Trash"] = {
			[GetSpellInfo(269686)] = {id = 269686, level = 8,},
			[GetSpellInfo(268013)] = {id = 268013, level = 8,},
			[GetSpellInfo(268008)] = {id = 268008, level = 8,},
			[GetSpellInfo(273563)] = {id = 273563, level = 8,},
			[GetSpellInfo(272657)] = {id = 272657, level = 8,},
			[GetSpellInfo(267027)] = {id = 267027, level = 8,},
			[GetSpellInfo(272699)] = {id = 272699, level = 8,},
			[GetSpellInfo(272655)] = {id = 272655, level = 8,},
			[GetSpellInfo(268007)] = {id = 268007, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1012)] = { -- Le Filon
		[EJ_GetEncounterInfo(2109)] = { --> Disperseur de foule automatique
			[GetSpellInfo(257337)] = {id = 257337, level = 8,},
			[GetSpellInfo(270882)] = {id = 270882, level = 8,},
		},
		[EJ_GetEncounterInfo(2114)] = { --> Azerokk

		},
		[EJ_GetEncounterInfo(2115)] = { --> Rixxa Fluxifuge
			--[GetSpellInfo(259856)] = {id = 259856, level = 8,},
			[GetSpellInfo(259853)] = {id = 259853, level = 8,},
		},
		[EJ_GetEncounterInfo(2116)] = { --> Nabab Razzbam
			[GetSpellInfo(260829)] = {id = 260829, level = 8,},
			[GetSpellInfo(260838)] = {id = 260838, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(263074)] = {id = 263074, level = 8,},
			[GetSpellInfo(280605)] = {id = 280605, level = 8,},
			[GetSpellInfo(268797)] = {id = 268797, level = 8,},
			[GetSpellInfo(269302)] = {id = 269302, level = 8,},
			[GetSpellInfo(280604)] = {id = 280604, level = 8,},
			[GetSpellInfo(257371)] = {id = 257371, level = 8,},
			[GetSpellInfo(257544)] = {id = 257544, level = 8,},
			[GetSpellInfo(268846)] = {id = 268846, level = 8,},
			[GetSpellInfo(262794)] = {id = 262794, level = 8,},
			[GetSpellInfo(262513)] = {id = 262513, level = 8,},
			[GetSpellInfo(263637)] = {id = 263637, level = 8,},
			[GetSpellInfo(262270)] = {id = 262270, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1021)] = { -- Manoir Malvoie
		[EJ_GetEncounterInfo(2125)] = { --> Triade Malecarde
			[GetSpellInfo(260703)] = {id = 260703, level = 8,},
			[GetSpellInfo(260907)] = {id = 260907, level = 8,},
			[GetSpellInfo(260741)] = {id = 260741, level = 8,},
		},
		[EJ_GetEncounterInfo(2126)] = { --> Goliath des âmes
			[GetSpellInfo(260551)] = {id = 260551, level = 8,},
		},
		[EJ_GetEncounterInfo(2127)] = { --> Raal le Bâfreur
			
		},
		[EJ_GetEncounterInfo(2128)] = { --> Seigneur et Dame Malvoie
			[GetSpellInfo(261440)] = {id = 261440, level = 8,},
			[GetSpellInfo(261438)] = {id = 261438, level = 8,},
		},
		[EJ_GetEncounterInfo(2129)] = { --> Gorak Tul
			
		},
		["Trash"] = {
			[GetSpellInfo(263905)] = {id = 263905, level = 8,},
			[GetSpellInfo(265880)] = {id = 265880, level = 8,},
			[GetSpellInfo(265882)] = {id = 265882, level = 8,},
			[GetSpellInfo(264105)] = {id = 264105, level = 8,},
			[GetSpellInfo(264050)] = {id = 264050, level = 8,},
			[GetSpellInfo(263891)] = {id = 263891, level = 8,},
			[GetSpellInfo(264378)] = {id = 264378, level = 8,},
			[GetSpellInfo(266035)] = {id = 266035, level = 8,},
			[GetSpellInfo(266036)] = {id = 266036, level = 8,},
			[GetSpellInfo(264556)] = {id = 264556, level = 8,},
			[GetSpellInfo(265760)] = {id = 265760, level = 8,},
			[GetSpellInfo(263943)] = {id = 263943, level = 8,},
			[GetSpellInfo(265881)] = {id = 265881, level = 8,},
			[GetSpellInfo(268202)] = {id = 268202, level = 8,},
			[GetSpellInfo(264153)] = {id = 264153, level = 8,},
			[GetSpellInfo(271175)] = {id = 271175, level = 8,},
			[GetSpellInfo(273658)] = {id = 273658, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1001)] = { -- Port-Liberté
		[EJ_GetEncounterInfo(2102)] = { --> Cap'taine céleste Kragg
			
		},
		[EJ_GetEncounterInfo(2093)] = { --> Conseil des capitaines
			[GetSpellInfo(258875)] = {id = 258875, level = 8,},
		},
		[EJ_GetEncounterInfo(2094)] = { --> Arène du Butin
			[GetSpellInfo(256363)] = {id = 256363, level = 8,},
		},
		[EJ_GetEncounterInfo(2095)] = { --> Harlan Sweete
			
		},
		["Trash"] = {
			[GetSpellInfo(258323)] = {id = 258323, level = 8,},
			[GetSpellInfo(257775)] = {id = 257775, level = 8,},
			[GetSpellInfo(257908)] = {id = 257908, level = 8,},
			[GetSpellInfo(257436)] = {id = 257436, level = 8,},
			[GetSpellInfo(274389)] = {id = 274389, level = 8,},
			[GetSpellInfo(274555)] = {id = 274555, level = 8,},
			[GetSpellInfo(257478)] = {id = 257478, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1041)] = { -- Repos des rois
		[EJ_GetEncounterInfo(2165)] = { --> Le serpent doré
			[GetSpellInfo(265773)] = {id = 265773, level = 8,},
		},
		[EJ_GetEncounterInfo(2171)] = { --> Mchimba l'Embaumeur
			[GetSpellInfo(267618)] = {id = 267618, level = 8,},
			[GetSpellInfo(267626)] = {id = 267626, level = 8,},
		},
		[EJ_GetEncounterInfo(2170)] = { --> Le conseil des tribus
			[GetSpellInfo(267273)] = {id = 267273, level = 8,},
			[GetSpellInfo(266238)] = {id = 266238, level = 8,},
			[GetSpellInfo(266231)] = {id = 266231, level = 8,},
			[GetSpellInfo(266191)] = {id = 266191, level = 8,},
		},
		[EJ_GetEncounterInfo(2172)] = { --> Dazar le premier roi
			[GetSpellInfo(268796)] = {id = 268796, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(270492)] = {id = 270492, level = 8,},
			[GetSpellInfo(267763)] = {id = 267763, level = 8,},
			[GetSpellInfo(276031)] = {id = 276031, level = 8,},
			[GetSpellInfo(270920)] = {id = 270920, level = 8,},
			[GetSpellInfo(270865)] = {id = 270865, level = 8,},
			[GetSpellInfo(271564)] = {id = 271564, level = 8,},
			[GetSpellInfo(270507)] = {id = 270507, level = 8,},
			[GetSpellInfo(270003)] = {id = 270003, level = 8,},
			[GetSpellInfo(270084)] = {id = 270084, level = 8,},
			[GetSpellInfo(270487)] = {id = 270487, level = 8,},
			[GetSpellInfo(272388)] = {id = 272388, level = 8,},
			[GetSpellInfo(271640)] = {id = 271640, level = 8,},
			[GetSpellInfo(270499)] = {id = 270499, level = 8,},
			[GetSpellInfo(269369)] = {id = 269369, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1036)] = { -- Sanctuaire des tempetes
		[EJ_GetEncounterInfo(2153)] = { --> Aqu'sire
			[GetSpellInfo(264560)] = {id = 264560, level = 8,},
			[GetSpellInfo(264166)] = {id = 264166, level = 8,},
			[GetSpellInfo(264526)] = {id = 264526, level = 8,},
		},
		[EJ_GetEncounterInfo(2154)] = { --> Conseil des eaugures
			[GetSpellInfo(267818)] = {id = 267818, level = 8,},
			[GetSpellInfo(267899)] = {id = 267899, level = 8,},
		},
		[EJ_GetEncounterInfo(2155)] = { --> Seigneur Chantorage
			[GetSpellInfo(268896)] = {id = 268896, level = 8,},
			[GetSpellInfo(269104)] = {id = 269104, level = 8,},
			[GetSpellInfo(269131)] = {id = 269131, level = 8,},
		},
		[EJ_GetEncounterInfo(2156)] = { --> Vol'zith l'Insidieuse
			[GetSpellInfo(267034)] = {id = 267034, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(268233)] = {id = 268233, level = 8,},
			[GetSpellInfo(268322)] = {id = 268322, level = 8,},
			[GetSpellInfo(276268)] = {id = 276268, level = 8,},
			[GetSpellInfo(274633)] = {id = 274633, level = 8,},
			[GetSpellInfo(268214)] = {id = 268214, level = 8,},
			[GetSpellInfo(268309)] = {id = 268309, level = 8,},
			[GetSpellInfo(268317)] = {id = 268317, level = 8,},
			[GetSpellInfo(268391)] = {id = 268391, level = 8,},
			[GetSpellInfo(274720)] = {id = 274720, level = 8,},
			[GetSpellInfo(268315)] = {id = 268315, level = 8,},
			[GetSpellInfo(276297)] = {id = 276297, level = 8,},
			[GetSpellInfo(268050)] = {id = 268050, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1023)] = { -- Siege de Boralus
		[EJ_GetEncounterInfo(2133)] = { --> Sergent Bainbridge
			[GetSpellInfo(261428)] = {id = 261428, level = 8,},
		},
		[EJ_GetEncounterInfo(2173)] = { --> Capitaine de l'effroi Boisclos
			[GetSpellInfo(273470)] = {id = 273470, level = 8,},
		},
		[EJ_GetEncounterInfo(2134)] = { --> Hadal Sombrabysse
			
		},
		[EJ_GetEncounterInfo(2140)] = { --> Viq'Goth
			[GetSpellInfo(274991)] = {id = 274991, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(257168)] = {id = 257168, level = 8,},
			[GetSpellInfo(272588)] = {id = 272588, level = 8,},
			[GetSpellInfo(272571)] = {id = 272571, level = 8,},
			[GetSpellInfo(275835)] = {id = 275835, level = 8,},
			[GetSpellInfo(273930)] = {id = 273930, level = 8,},
			[GetSpellInfo(257292)] = {id = 257292, level = 8,},
			[GetSpellInfo(256897)] = {id = 256897, level = 8,},
			[GetSpellInfo(272874)] = {id = 272874, level = 8,},
			[GetSpellInfo(272834)] = {id = 272834, level = 8,},
			[GetSpellInfo(257169)] = {id = 257169, level = 8,},
			[GetSpellInfo(272713)] = {id = 272713, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1002)] = { -- Tol Dagor
		[EJ_GetEncounterInfo(2097)] = { --> La reine des sables
			[GetSpellInfo(257119)] = {id = 257119, level = 8,},
		},
		[EJ_GetEncounterInfo(2098)] = { --> Jes Hurley
			[GetSpellInfo(257791)] = {id = 257791, level = 8,},
			[GetSpellInfo(257777)] = {id = 257777, level = 8,},
			[GetSpellInfo(260067)] = {id = 260067, level = 8,},
		},
		[EJ_GetEncounterInfo(2099)] = { --> Chevalier-capitaine Valyri
			[GetSpellInfo(257028)] = {id = 257028, level = 8,},
		},
		[EJ_GetEncounterInfo(2096)] = { --> Surveillant Korgus
			[GetSpellInfo(256198)] = {id = 256198, level = 8,},
			[GetSpellInfo(256101)] = {id = 256101, level = 8,},
			[GetSpellInfo(256044)] = {id = 256044, level = 8,},
			[GetSpellInfo(256474)] = {id = 256474, level = 8,},
		},
		["Trash"] = {
			[GetSpellInfo(258128)] = {id = 258128, level = 8,},
			[GetSpellInfo(265889)] = {id = 265889, level = 8,},
			[GetSpellInfo(258864)] = {id = 258864, level = 8,},
			[GetSpellInfo(258917)] = {id = 258917, level = 8,},
			[GetSpellInfo(258079)] = {id = 258079, level = 8,},
			[GetSpellInfo(258058)] = {id = 258058, level = 8,},
			[GetSpellInfo(260016)] = {id = 260016, level = 8,},
			[GetSpellInfo(258313)] = {id = 258313, level = 8,},
			[GetSpellInfo(259711)] = {id = 259711, level = 8,},
		},
	},
	
	[EJ_GetInstanceInfo(1028)] = { -- Azeroth boss BFA
		[EJ_GetEncounterInfo(2139)] = { --> T'zane
			
		},
		[EJ_GetEncounterInfo(2141)] = { --> Ji'arak

		},
		[EJ_GetEncounterInfo(2197)] = { --> Assemblage de grelons
			
		},
		[EJ_GetEncounterInfo(2212)] = { --> Le Rugissement du Lion
			
		},
		[EJ_GetEncounterInfo(2199)] = { --> Azurethos, le typhon aile
			
		},
		[EJ_GetEncounterInfo(2198)] = { --> Porteguerre Yenajz
			
		},
		[EJ_GetEncounterInfo(2210)] = { --> Krolauk gorgedune
			
		},
	},
	
	[EJ_GetInstanceInfo(1031)] = { -- Uldir
		[EJ_GetEncounterInfo(2168)] = { --> Taloc
			[GetSpellInfo(270290)] = {id = 270290, level = 8,},
			[GetSpellInfo(275270)] = {id = 275270, level = 8,},
			[GetSpellInfo(271224)] = {id = 271224, level = 8,},
			[GetSpellInfo(271225)] = {id = 271225, level = 8,},
		},
		[EJ_GetEncounterInfo(2167)] = { --> DAME
			[GetSpellInfo(268277)] = {id = 268277, level = 8,},
			[GetSpellInfo(268253)] = {id = 268253, level = 8,},
			[GetSpellInfo(268095)] = {id = 268095, level = 8,},
			[GetSpellInfo(267787)] = {id = 267787, level = 8,},
			[GetSpellInfo(268198)] = {id = 268198, level = 8,},
			[GetSpellInfo(267821)] = {id = 267821, level = 8,},
		},
		[EJ_GetEncounterInfo(2146)] = { --> Devoreur fetide
			[GetSpellInfo(262313)] = {id = 262313, level = 8,},
			[GetSpellInfo(262292)] = {id = 262292, level = 8,},
			[GetSpellInfo(262314)] = {id = 262314, level = 8,},
		},
		[EJ_GetEncounterInfo(2169)] = { --> Zek'vos, heraut de N'zoth
			[GetSpellInfo(265237)] = {id = 265237, level = 8,},
			[GetSpellInfo(265264)] = {id = 265264, level = 8,},
			[GetSpellInfo(265360)] = {id = 265360, level = 8,},
			[GetSpellInfo(265662)] = {id = 265662, level = 8,},
			[GetSpellInfo(265646)] = {id = 265646, level = 8,},
		},
		[EJ_GetEncounterInfo(2166)] = { --> Vectis
			[GetSpellInfo(265127)] = {id = 265127, level = 8,},
			[GetSpellInfo(265178)] = {id = 265178, level = 8,},
			[GetSpellInfo(265206)] = {id = 265206, level = 8,},
			[GetSpellInfo(265212)] = {id = 265212, level = 8,},
			[GetSpellInfo(265129)] = {id = 265129, level = 8,},
			[GetSpellInfo(267160)] = {id = 267160, level = 8,},
			[GetSpellInfo(267161)] = {id = 267161, level = 8,},
			[GetSpellInfo(267162)] = {id = 267162, level = 8,},
			[GetSpellInfo(267163)] = {id = 267163, level = 8,},
			[GetSpellInfo(267164)] = {id = 267164, level = 8,},
		},
		[EJ_GetEncounterInfo(2195)] = { --> Zul, ressuscite
			[GetSpellInfo(273365)] = {id = 273365, level = 8,},
			[GetSpellInfo(273434)] = {id = 273434, level = 8,},
			[GetSpellInfo(274195)] = {id = 274195, level = 8,},
			[GetSpellInfo(272018)] = {id = 272018, level = 8,},
		},
		[EJ_GetEncounterInfo(2194)] = { --> Mythrax le Disloqueur
			[GetSpellInfo(272146)] = {id = 272146, level = 8,},
			[GetSpellInfo(272536)] = {id = 272536, level = 8,},
			[GetSpellInfo(274693)] = {id = 274693, level = 8,},
			[GetSpellInfo(272407)] = {id = 272407, level = 8,},
		},
		[EJ_GetEncounterInfo(2147)] = { --> G'huun
			[GetSpellInfo(263436)] = {id = 263436, level = 8,},
			[GetSpellInfo(263227)] = {id = 263227, level = 8,},
			[GetSpellInfo(263372)] = {id = 263372, level = 8,},
			[GetSpellInfo(272506)] = {id = 272506, level = 8,},
			[GetSpellInfo(267409)] = {id = 267409, level = 8,},
			[GetSpellInfo(267430)] = {id = 267430, level = 8,},
			[GetSpellInfo(263235)] = {id = 263235, level = 8,},
			[GetSpellInfo(270287)] = {id = 270287, level = 8,},
		},
		["Trash"] = {
			
		},
	},
}

--[[
			[GetSpellInfo()] = {id = , level = 8,}, -- 
			[GetSpellInfo()] = {id = , level = 8,}, -- 
			[GetSpellInfo()] = {id = , level = 8,}, -- 
			[GetSpellInfo()] = {id = , level = 8,}, -- 
]]

G.WhiteList = {
	--BUFF
	[209859] = true, -- 激励
	-- DEBUFF
	[118] = true, -- 变形术
	[51514] = true, -- 妖术
	[217832] = true, -- 禁锢
	[605] = true, -- 精神控制
	[710] = true, -- 放逐
	[2094] = true, -- 致盲
	[6770] = true, -- 闷棍
	[9484] = true, -- 束缚亡灵
	[20066] = true, -- 忏悔
	
	[339] = true, -- 根须纠缠
	[102359] = true, -- 群体缠绕
	[3355] = true, -- 冰冻陷阱
	[64695] = true, -- 陷地图腾
	
	[5211] = true, -- 蛮力猛击
	[853] = true, -- 制裁之锤	
	[221562] = true, -- 窒息
	
	[118905] = true, -- 电能图腾	
	[132168] = true, -- 震荡波
	[179057] = true, -- 混沌新星
	[30283] = true, -- 暗影之怒
 	[207171] = true, -- 凛冬将至	
	[117405] = true, -- 束缚射击
	[119381] = true, -- 扫堂腿
	[127797] = true, -- 乌索尔旋风
	[205369] = true, --  精神炸弹 
	[81261] = true, -- 日光术
}

G.BlackList = {
	[15407] = true, -- 精神鞭笞
}

local Customitembuttons = {}

for i = 1, 30 do
	Customitembuttons[i] = {
		itemID = "",
		exactItem = false,
		showCount = false,
		All = true,
		OrderHall = false,
		Raid = false,
		Dungeon = false,
		PVP = false,
	}
end

local Customcoloredplates = {}

for i = 1, 50 do
	Customcoloredplates[i] = {
		name = L["空"],
		color = {r = 1, g = 1, b = 1},
	}
end

local default_HealerIndicatorAuraList = {
	PRIEST = { 
        [17] = true,		-- 真言术盾
        [139] = true,		-- 恢复
        [41635] = true,		-- 愈合祷言
        [194384] = true,	-- 救赎
        [152118] = true,	-- 意志洞悉
	    [208065] = true,	-- 图雷之光	
	},
	DRUID = { 
	    [774] = true,		-- 回春
        [155777] = true,	-- 萌芽
        [8936] = true,		-- 愈合
        [33763] = true,		-- 生命绽放
        [48438] = true,		-- 野性成长
		[102351] = true,	-- 塞纳里奥结界
        [102352] = true,	-- 塞纳里奥结界
        [200389] = true,	-- 栽培
	},
	SHAMAN = { 
		[61295] = true,		-- 激流
	},
	PALADIN = {
	    [53563] = true,		-- 圣光道标
        [156910] = true,	-- 信仰道标
		[25771] = true,		-- 自律
		[223306] = true,	-- 赋予信仰
	},
	WARRIOR = { 
		[12975] = true,		-- 援护
		[114030] = true,	-- 警戒
	},
	MAGE = { 
	
	},
	WARLOCK = { 
	
	},
	HUNTER = { 
		[34477] = true,		-- 误导
	},
	ROGUE = { 
		[57934] = true,		-- 嫁祸
	},
	DEATHKNIGHT = {
	
	},
	MONK = {
	    [119611] = true,	-- 复苏之雾
        [124682] = true,	-- 氤氲之雾
        [124081] = true,	-- 禅意波
		[191840] = true,	-- 精华之泉
		[115175] = true,	-- 抚慰之雾
	},
	DEMONHUNTER = {
	
	},
}

local HealerIndicatorAuraList = default_HealerIndicatorAuraList[G.myClass]

local Account_default_Settings = {
	meet = false,
	gold = {},
	goldkeywordlist = "",
}

local Character_default_Settings = {
	FramePoints = {},
	UnitframeOptions = {
		style = 1, -- 1: tansparent , 2:dark bg reverse, 3:dark bg normal -- 加入
		enablefade = true,
		fadingalpha = 0.2,
		valuefontsize = 16,
		
		-- health/power
		tenthousand = false,
		alwayshp = false,
		alwayspp = false,
		classcolormode = false,
		nameclasscolormode = true,
		
		-- portrait
		portrait = false,
		portraitalpha = 0.6,
		
		-- size
		height	= 18,
		width = 230,
		widthpet = 70,
		widthboss = 170,
		scale = 1.0, -- slider
		hpheight = 0.75, -- slider

		-- castbar
		castbars = true,
		cbIconsize = 33,
		independentcb = true,
		namepos = "LEFT",
		timepos = "RIGHT",
		cbheight = 16,
		cbwidth = 230,
		target_cbheight = 5,
		target_cbwidth = 230,
		focus_cbheight = 5,
		focus_cbwidth = 230,
		channelticks = false,
		
		-- swing timer
		swing = false,
		swheight = 12,
		swwidth = 230,
		swoffhand = false,
		swtimer = true,
		swtimersize = 12,
		
		-- auras
		auras = true,
		auraborders = true,
		auraperrow = 9, -- slider
		playerdebuffenable = true,
		playerdebuffnum = 7, -- slider

		AuraFilterignoreBuff = false,
		AuraFilterignoreDebuff = false,
		AuraFilterwhitelist = {},

		showthreatbar = true,

		-- show/hide boss
		bossframes = true,
		
		-- show/hide arena
		arenaframes = true,
		
		-- show pvp timer
		pvpicon = false,
		
		-- show value
		runecooldown = true,
		dpsmana = true,
		stagger = true,
		valuefs = 12,
		
		-- totems
		totems = true,
		totemsize = 25,
		growthDirection = 'HORIZONTAL',
		sortDirection = 'ASCENDING',
		
		--[[ share ]]--
		enableraid = true,
		showraidpet = false,
		raidfontsize = 10,
		namelength = 4,
		showsolo = false,
		toggleForVehicle = true,
		autoswitch = false,
		raidonly = "healer",

		--[[ healer mode ]]--
		healergroupfilter = '1,2,3,4,5,6',
		healerraidheight = 45,
		healerraidwidth = 70,
		raidmanabars = true,
		raidhpheight = 0.85, -- slider
		anchor = "TOP", -- dropdown
		partyanchor = "LEFT", -- dropdown
		showgcd = true,
		showmisshp = true,
		healprediction = true,
		healtank_assisticon = false,
		hotind_style = "icon_ind",-- "icon_ind", "number_ind"
		hotind_size = 15,
		hotind_filtertype = "whitelist", -- "blacklist", "whitelist"
		hotind_auralist = HealerIndicatorAuraList,
				
		--[[ dps/tank mode ]]--
		dpsgroupfilter = '1,2,3,4,5,6',
		dpsraidheight = 15,
		dpsraidwidth = 100,
		unitnumperline = 25,
		dpsraidgroupbyclass = true,
		dpstank_assisticon = true,
		
		--[[ click cast ]]--
		enableClickCast = false,
		ClickCast = ClickCastDB,
	},
	ChatOptions = {
		copychat = true,
		channelreplacement = true,
		autoscroll = true,
		nogoldseller = true,
		goldkeywordnum = 2,
		showbg = false,
	},
	ItemOptions = {
		enablebag = true,
		bagiconsize = 30,
		bagiconperrow = 14,
		autorepair = true,
		autorepair_guild = true,
		autosell = true,
		alreadyknown = true,
		showitemlevel = true,
		autobuy = false,
		autobuylist = {},
		itemlevels = {},
		itembuttons = false,
		itembuttons_size = 32,
		itembuttons_fsize = 15,
		growdirection_h = "LEFT",
		growdirection_v = "UP",
		number_perline = 6,
		button_space = 2,
		itembuttons_table = Customitembuttons,
	},
	ActionbarOptions = {
		cooldown = true,
		cooldownsize = 20,
		rangecolor = true,
		keybindsize = 12,
		macronamesize = 8,
		countsize = 12,
		bar1top = true,
		bar12size = 25,
		bar12space = 4,
		bar12mfade = true,
		bar12efade = true,
		bar12fademinaplha = 0.2,
		bar3layout = "layout322",
		space1 = 5,
		bar3size = 25,
		bar3space = 4,
		bar3mfade = true,
		bar3efade = false,
		bar3fademinaplha = 0.2,
		bar45size = 25,
		bar45space = 4,
		bar45mfade = true,
		bar45efade = false,
		bar45fademinaplha = 0,
		Horizontalbar45 = true,
		bar45uselayout64 = true,
		petbaruselayout5x2 = false,
		petbarscale = .7,
		petbuttonspace = 4,
		petbarmfade = true,
		petbarefade = false,
		petbarfademinaplha = 0.2,
		stancebarinneranchor = "RIGHT",
		stancebarbuttonszie = 22,
		stancebarbuttonspace = 4,
		stancebarmfade = false,
		stancebarfademinaplha = 0.2,
		micromenuscale = 1,
		micromenufade = true,
		micromenuminalpha = 0,
		leave_vehiclebuttonsize = 30,
		extrabarbuttonsize = 30,
		cdflash_enable = true,
		cdflash_alpha = 100,
		cdflash_size = 60,
		caflash_bl = {
			item = {
				[6948] = true,
			},
			spell = {
			
			},
		},
	},
	BuffFrameOptions = {
		seperate = true,
		buffsize = 30,
		debuffsize = 35,
		buffrowspace = 10,
		debuffrowspace = 10, -- 上下间距
		buffcolspace = 5,
		debuffcolspace = 5, -- 左右间距
		bufftimesize = 13,
		debufftimesize = 16,
		buffcountsize = 14,
		debuffcountsize = 18,
		buffsPerRow = 14,
		debuffsPerRow = 10,
	},
	PlateOptions = {
		enableplate = true,
		blzplates = true,
		blzplates_nameonly = true,
		name_fontsize = 18,
		autotoggleplates = true,
		plateauranum = 5,
		plateaurasize = 25,
		numberstyle = true,
		threatcolor = true,
		firendlyCR = true,
		enemyCR = true,
		playerplate = true,
		classresource_show = true,
		classresource = "player", --"player", "target"
		plateaura = false,
		myplateauralist = G.BlackList,		
		otherplateauralist = G.WhiteList,
		myfiltertype = "blacklist", -- "blacklist", "whitelist", "none"
		otherfiltertype = "none", -- "whitelist", "none"
		customcoloredplates = Customcoloredplates,
	},
	TooltipOptions = {
		enabletip = true,
		size = 1,
		cursor = false,
		hideRealm = false,
		hideTitles = true,
		showspellID = true,
		showitemID = true,
		showtalent = true,
		combathide = true,	
	},
	CombattextOptions = {
		combattext = true,
		hidblz = true,
		hidblz_receive = false,
		showreceivedct = true,
		showoutputct = true,
		formattype = "k",
		cticonsize = 13,
		ctbigiconsize = 25,
		ctshowdots = false,
		ctshowhots = false,
		ctshowpet = true,
		ctfadetime = 3,	
	},
	RaidToolOptions = {
		onlyactive = true,
		unlockraidmarks = false,
		potion = false,
		potionblacklist = "",
		pulltime = 8,
	},
	OtherOptions = {
		minimapheight = 175,
		micromenuscale = 1,
		infobarscale = 1,
		collectminimapbuttons = true,
		MBCFpos = "BOTTOM",
		hideerrors = true,
		autoscreenshot = true,
		collectgarbage = true,	
		acceptres = true,
		battlegroundres = true,
		acceptfriendlyinvites = false,
		autoinvite = false,
        autoinvitekeywords = "111 123",		
		autoquests = false,
		saysapped = true,
		showAFKtips = true,
		vignettealert = true,
		flashtaskbar = true,
		autopet = true,
		LFGRewards = true,
		autoacceptproposal = true,
		hidemap = false,
		hidechat = false,
		worldmapcoords = false,
		afkscreen = true,
		hidepanels = false,
		shiftfocus = false,
	},
	SkinOptions = {
		setClassColor = true,
		setDBM = true,
		setSkada = true,
		setBW = true,
	},
	RaidDebuff = G.DebuffList,
	CooldownAura = AuraList,
	AddonProfiles = {},
}

function T.LoadVariables()
	for a, b in pairs(Character_default_Settings) do
		if type(b) ~= "table" then
			if aCoreCDB[a] == nil then
				aCoreCDB[a] = b
			end
		else
			if aCoreCDB[a] == nil then
				aCoreCDB[a] = {}
			end
			if a == "RaidDebuff" then
				for k, v in pairs(b) do -- k 副本
					if aCoreCDB[a][k] == nil then -- 需要添加新副本
						aCoreCDB[a][k] = v
					else -- 需要添加新boss
						for k1, v1 in pairs(v) do
							if aCoreCDB[a][k][k1] == nil then
								aCoreCDB[a][k][k1] = v1
							end
						end
					end
				end
			else
				for k, v in pairs(b) do
					if aCoreCDB[a][k] == nil then
						aCoreCDB[a][k] = v
					end
				end
			end
		end
	end
end

function T.LoadAccountVariables()
	for a, b in pairs(Account_default_Settings) do
		if type(b) ~= "table" then
			if aCoreDB[a] == nil then
				aCoreDB[a] = b
			end
		else
			if aCoreDB[a] == nil then
				aCoreDB[a] = {}
			end
			for k, v in pairs(b) do
				if aCoreDB[a][k] == nil then
					aCoreDB[a][k] = v
				end
			end
		end
	end
end

T.ExportSettings = function(editbox)
	local str = "AltzUI Export".."~"..G.Version.."~"..G.Client.."~"..G.myClass
	for OptionCategroy, OptionTable in pairs(Character_default_Settings) do
		if type(OptionTable) == "table" then
			for setting, value in pairs(OptionTable) do
				if type(value) ~= "table" then -- 3
					if aCoreCDB[OptionCategroy][setting] ~= value then
						local valuetext
						if aCoreCDB[OptionCategroy][setting] == false then
							valuetext = "false"
						elseif aCoreCDB[OptionCategroy][setting] == true then
							valuetext = "true"
						else
							valuetext = aCoreCDB[OptionCategroy][setting]
						end
						str = str.."^"..OptionCategroy.."~"..setting.."~"..valuetext
					end
				else
					if OptionCategroy == "RaidDebuff" then -- 完全复制 6
						for boss, auratable in pairs(value) do
							for auraname, aurainfo in pairs (aCoreCDB["RaidDebuff"][setting][boss]) do
								str = str.."^"..OptionCategroy.."~"..setting.."~"..boss.."~"..auraname.."~"..aurainfo.id.."~"..aurainfo.level
							end
						end
					elseif OptionCategroy == "CooldownAura" then -- 完全复制 5
						for auraname, aurainfo in pairs (aCoreCDB["CooldownAura"][setting]) do
							str = str.."^"..OptionCategroy.."~"..setting.."~"..auraname.."~"..aurainfo.id.."~"..aurainfo.level
						end
					elseif OptionCategroy == "ItemOptions" then
						if setting == "autobuylist" then -- 完全复制 4
							for id, count in pairs(aCoreCDB["ItemOptions"]["autobuylist"]) do -- 默认是空的
								str = str.."^"..OptionCategroy.."~"..setting.."~"..id.."~"..count
							end
						elseif setting == "itembuttons_table" then -- 非空则复制 11
							for index, t in pairs(aCoreCDB["ItemOptions"]["itembuttons_table"]) do
								if t.itemID ~= "" then
									str = str.."^"..OptionCategroy.."~"..setting.."~"..index.."~"..t.itemID.."~"..(t.exactItem and "true" or "false").."~"..(t.showCount and "true" or "false").."~"..(t.All and "true" or "false").."~"..(t.OrderHall and "true" or "false").."~"..(t.Raid and "true" or "false").."~"..(t.Dungeon and "true" or "false").."~"..(t.PVP and "true" or "false")
								end
							end
						end
					elseif OptionCategroy == "PlateOptions" then
						if setting == "customcoloredplates" then -- 非空则复制 7
							for index, t in pairs(aCoreCDB["PlateOptions"]["customcoloredplates"]) do
								if t.name ~= L["空"] then
									str = str.."^"..OptionCategroy.."~"..setting.."~"..index.."~"..t.name.."~"..t.color.r.."~"..t.color.g.."~"..t.color.b
								end
							end
						
						else -- 完全复制 4
							for id, _ in pairs(aCoreCDB["PlateOptions"][setting]) do
								str = str.."^"..OptionCategroy.."~"..setting.."~"..id.."~true"
							end
						end
					elseif setting == "ClickCast" then -- 6
						for k, _ in pairs(value) do
							for j, v in pairs(value[k]) do -- j  Click ctrl- shift- alt-
								local action = aCoreCDB["UnitframeOptions"]["ClickCast"][k][j].action
								local macro = aCoreCDB["UnitframeOptions"]["ClickCast"][k][j].macro
								if action ~= v.action or macro ~= v.macro then
									str = str.."^"..OptionCategroy.."~"..setting.."~"..k.."~"..j.."~"..action.."~"..macro
								end
							end
						end
					elseif setting == "AuraFilterwhitelist" then -- 完全复制 4
						for id, spellname in pairs(aCoreCDB["UnitframeOptions"]["AuraFilterwhitelist"]) do -- 默认是空的
							str = str.."^"..OptionCategroy.."~"..setting.."~"..id.."~"..spellname
						end
					elseif setting == "caflash_bl" then -- 完全复制 5
						for cdtpye, cdtable in pairs(aCoreCDB["ActionbarOptions"]["caflash_bl"]) do
							for id, _ in pairs(cdtable) do
								str = str.."^"..OptionCategroy.."~"..setting.."~"..cdtpye.."~"..id.."~true"
							end
						end
					end
				end
			end
		end
	end
	for frame, info in pairs (aCoreCDB["FramePoints"]) do
		for mode, xy in pairs(info) do
			for key, _ in pairs(xy) do
				local f = _G[frame]
				if f and f["point"] then
					if xy[key] ~= f["point"][mode][key] then
						str = str.."^FramePoints~"..frame.."~"..mode.."~"..key.."~"..xy[key]
						--print(frame.."~"..mode.."~"..key.."~"..xy[key])
					end
				else -- 框体在当前配置尚未创建
					str = str.."^FramePoints~"..frame.."~"..mode.."~"..key.."~"..xy[key]
					--print(frame.."~"..mode.."~"..key.."~"..xy[key])
				end
			end
		end
	end
	editbox:SetText(str)
	editbox:HighlightText()
end

T.ImportSettings = function(str)
	local optionlines = {string.split("^", str)}
	local uiname, version, client, class = string.split("~", optionlines[1])
	local sameversion, sameclient, sameclass
	
	if uiname ~= "AltzUI Export" then
		StaticPopup_Show(G.uiname.."Cannot Import")
	else
		local import_str = ""
		if version ~= G.Version then
			import_str = import_str..format(L["版本不符合"], version, G.Version)
		else
			sameversion = true
		end
		
		if client ~= G.Client then
			import_str = import_str..format(L["客户端不符合"], client, G.Client)
		else
			sameclient = true
		end
		
		if class ~= G.myClass then
			import_str = import_str..format(L["职业不符合"], G.ClassInfo[class], G.ClassInfo[G.myClass])
		else
			sameclass = true
		end
		
		if not (sameversion and sameclient and sameclass) then
			import_str = import_str..L["不完整导入"]
		end
		StaticPopupDialogs[G.uiname.."Import Confirm"].text = format(L["导入确认"]..import_str, "Altz UI")
		StaticPopupDialogs[G.uiname.."Import Confirm"].OnAccept = function()
			aCoreCDB = {}
			T.SetChatFrame()
			T.LoadVariables()
			
			-- 完全复制的设置
			if sameclient then
				aCoreCDB.RaidDebuff = {}
				for instance, bosstable in pairs(G.Raids) do
					if aCoreCDB.RaidDebuff[instance] == nil then
						aCoreCDB.RaidDebuff[instance] = {}
					end
					for _, bossname in pairs(bosstable) do
						aCoreCDB.RaidDebuff[instance][bossname] = {}
					end
				end	
				
				aCoreCDB.CooldownAura = {}
				aCoreCDB.CooldownAura.Buffs = {}
				aCoreCDB.CooldownAura.Debuffs = {}
			end
			
			if sameclass then
				aCoreCDB.PlateOptions.myplateauralist = {}
				aCoreCDB.ActionbarOptions.caflash_bl.spell = {}
			end
			
			aCoreCDB.ActionbarOptions.caflash_bl.item = {}
			aCoreCDB.PlateOptions.otherplateauralist = {}
			
			for index, v in pairs(optionlines) do
				if index ~= 1 then
					local OptionCategroy, setting, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = string.split("~", v)	
					local count = select(2, string.gsub(v, "~", "~")) + 1
	
					if count == 3 then -- 可以直接赋值
						if aCoreCDB[OptionCategroy][setting] ~= nil then
							if arg1 == "true" then
								aCoreCDB[OptionCategroy][setting] = true	
							elseif arg1 == "false" then
								aCoreCDB[OptionCategroy][setting] = false
							elseif tonumber(arg1) and setting ~= "autoinvitekeywords" and setting ~= "goldkeywordlist" then
								aCoreCDB[OptionCategroy][setting] = tonumber(arg1)
							else
								aCoreCDB[OptionCategroy][setting] = arg1
							end
						end
					else -- 是个表格 sameclient sameclass
						if OptionCategroy == "RaidDebuff" then -- 完全复制 6 OptionCategroy.."~"..setting.."~"..boss.."~"..auraname.."~"..aurainfo.id.."~"..aurainfo.level
							if sameclient then
								if aCoreCDB[OptionCategroy][setting][arg1][arg2] == nil then
									aCoreCDB[OptionCategroy][setting][arg1][arg2] = {}
									aCoreCDB[OptionCategroy][setting][arg1][arg2]["id"] = tonumber(arg3)
									aCoreCDB[OptionCategroy][setting][arg1][arg2]["level"] = tonumber(arg4)
								end
							end
						elseif OptionCategroy == "CooldownAura" then -- 完全复制 5 OptionCategroy.."~"..setting.."~"..auraname.."~"..aurainfo.id.."~"..aurainfo.level
							if sameclient then
								if aCoreCDB[OptionCategroy][setting][arg1] == nil then
									aCoreCDB[OptionCategroy][setting][arg1] = {}
									aCoreCDB[OptionCategroy][setting][arg1]["id"] = tonumber(arg2)
									aCoreCDB[OptionCategroy][setting][arg1]["level"] = tonumber(arg3)
								end
							end
						elseif OptionCategroy == "ItemOptions" then
							if setting == "autobuylist" then -- 完全复制 4 OptionCategroy.."~"..setting.."~"..id.."~"..count
								aCoreCDB[OptionCategroy][setting][arg1] = arg2
							elseif setting == "itembuttons_table" then -- 非空则复制 11 OptionCategroy.."~"..setting.."~"..index.."~"..t.itemID.."~"..t.exactItem.."~"..t.showCount.."~"..t.All.."~"..t.OrderHall.."~"..t.Raid.."~"..t.Dungeon.."~"..t.PVP
								local ID = tonumber(arg2)
								aCoreCDB[OptionCategroy][setting][tonumber(arg1)] = {
									itemID = ID,
									exactItem = ((arg3 == "true") and true or false),
									showCount = ((arg4 == "true") and true or false),
									All = ((arg5 == "true") and true or false),
									OrderHall = ((arg6 == "true") and true or false),
									Raid = ((arg7 == "true") and true or false),
									Dungeon = ((arg8 == "true") and true or false),
									PVP = ((arg9 == "true") and true or false),
								}
							end
						elseif OptionCategroy == "PlateOptions" then
							if setting == "customcoloredplates" then -- 非空则复制 7 OptionCategroy.."~"..setting.."~"..index.."~"..t.name.."~"..t.color.r.."~"..t.color.g.."~"..t.color.b
								if sameclient then
									aCoreCDB[OptionCategroy][setting][tonumber(arg1)] = {
										name = arg2,
										color = {
											r = tonumber(arg3),
											g = tonumber(arg4),
											b = tonumber(arg5),
										},
									}
								end
							elseif arg1 == "otherplateauralist" then -- 完全复制 4 OptionCategroy.."~"..setting.."~"..id.."~true"
								aCoreCDB[OptionCategroy][setting][tonumber(arg1)] = true
							elseif sameclass then
								aCoreCDB[OptionCategroy][setting][tonumber(arg1)] = true
							end
						elseif OptionCategroy == "FramePoints" then -- 5 ^FramePoints~"..frame.."~"..mode.."~"..key.."~"..xy[key]
							if aCoreCDB[OptionCategroy][setting] == nil then
								aCoreCDB[OptionCategroy][setting] = {}
							end
							if aCoreCDB[OptionCategroy][setting][arg1] == nil then
								aCoreCDB[OptionCategroy][setting][arg1] = {}
							end
							if arg2 == "x" or arg2 == "y" then
								aCoreCDB[OptionCategroy][setting][arg1][arg2] = tonumber(arg3)
							else
								aCoreCDB[OptionCategroy][setting][arg1][arg2] = arg3
							end
						elseif setting == "ClickCast" then -- 6 OptionCategroy.."~"..setting.."~"..k.."~"..j.."~"..action.."~"..macro
							if sameclient and sameclass then
								aCoreCDB[OptionCategroy][setting][tostring(arg1)][arg2]["action"] = arg3
								aCoreCDB[OptionCategroy][setting][tostring(arg1)][arg2]["macro"] = arg4
							end
						elseif setting == "AuraFilterwhitelist" then -- 完全复制 4 OptionCategroy.."~"..setting.."~"..id.."~"..spellname
							if sameclient then
								aCoreCDB[OptionCategroy][setting][arg1] = arg2
							end
						elseif setting == "caflash_bl" then -- 完全复制 5 OptionCategroy.."~"..setting.."~"..cdtpye.."~"..id.."~true"
							if arg1 == "item" then
								aCoreCDB[OptionCategroy][setting][arg1][tonumber(arg2)] = true
							elseif sameclass then
								aCoreCDB[OptionCategroy][setting][arg1][tonumber(arg2)] = true
							end
						end
					end

				end
			end
		ReloadUI()
		end
		StaticPopup_Show(G.uiname.."Import Confirm")
	end
end