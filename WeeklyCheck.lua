-----------------------------------------------------------------------------------------
--------- Isle of Thunder Weekly Check---------------------------------------------------
-- by Fluffies
-- EU-Well of Eternity
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local ldbicon = ldb and LibStub("LibDBIcon-1.0", true)

local chest_icon = "|TInterface\\Icons\\Trade_Archaeology_ChestofTinyGlassAnimals:12|t "
local rare_icon = "|TInterface\\Icons\\Achievement_Boss_Archaedas:12|t "
local quest_icon = "|TInterface\\CURSOR\\QUEST:12|t "

local rare_name = EXAMPLE_TARGET_MONSTER.." ("..ITEM_QUALITY3_DESC..")"

-- string colors
local LIGHT_RED   = "|cffFF2020"
local LIGHT_GREEN = "|cff20FF20"
local LIGHT_BLUE  = "|cff00ddFF"
local ZONE_BLUE   = "|cff00aacc"
local GREY        = "|cff999999"
local COORD_GREY  = "|cffBBBBBB"
local GOLD        = "|cffffcc00"
local WHITE       = "|cffffffff"
local PINK        = "|cffFFaaaa"
local function AddColor(str,color)
 return color..str.."|r"
end

local function completedstring(arg)
 if IsQuestFlaggedCompleted(arg) then
  return AddColor(COMPLETE,LIGHT_GREEN)
 else
  return AddColor(INCOMPLETE,LIGHT_RED)
 end
end

local function getitemname(arg)
 if arg ~= nil then 
  return arg
 else
  return ""
 end
end

----------------------卡扎克-----------------------------
local function CheckKazzak()
	if GetNumSavedWorldBosses and GetSavedWorldBossInfo then
		for i=1,GetNumSavedWorldBosses() do
			if select(2, GetSavedWorldBossInfo(i)) == 15 then return AddColor(COMPLETE,LIGHT_GREEN) end;
		end
	end
	return AddColor(INCOMPLETE,LIGHT_RED)
end

-------------------------------------------------------------
	
local function DrawMainframe(frame, istooltip)

----------------------既定命运印记  thanks NDui-----------------------------
 		local bonus = {
			36054, 36055, 36056, 36057,		--stage1
			37452, 37454, 37456, 37458,		--stage2
			37453, 37455, 37457, 37459,		--stage3  
			36058,							--armory 
		}
		local count = 0
		for _, id in pairs(bonus) do
			if IsQuestFlaggedCompleted(id) then
				count = count + 1
			end
		end
local function CheckCurrency()
		if count < 3 then
		  return AddColor(count.." / 3",LIGHT_RED)
		elseif count >= 3 then
			return AddColor(count.." / 3",LIGHT_GREEN)
		end
end

-- title
 frame:ClearLines()
 frame:AddDoubleLine("查看下哪些还没完成呦~","|T".."Interface\\Addons\\Ace3\\ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI"..":32|t")
 frame:AddLine(" ")
 frame:AddLine(" ")
 frame:AddDoubleLine(quest_icon..AddColor("日常：布林顿5000",ZONE_BLUE), completedstring(34774))
 frame:AddLine(" ")

 frame:AddDoubleLine(quest_icon..AddColor(GetCurrencyInfo(1129).." [|cffFFaaaa"..bonusname.."|r] ",GOLD), CheckCurrency())
 --frame:AddDoubleLine(quest_icon..AddColor("既定命运印记|cffdd00FF(不绝对准确)|r",GOLD), completedstring(36054) or completedstring(36055) or completedstring(36056) or completedstring(36057))
 --frame:AddDoubleLine(quest_icon..AddColor("既定命运印记",GOLD), completedstring(36058)) --and 
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(36054))  --封印命运：金币
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(36055))  --封印命运：埃匹希斯水晶
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(36056))  --封印命运：要塞资源
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(36057))  --封印命运：荣誉

 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37452))  --封印命运：成堆的埃匹希斯水晶
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37453))  --封印命运：成山的埃匹希斯水晶
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37454))  --封印命运：大把的金币
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37455))  --封印命运：巨额的金币
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37456))  --封印命运：满仓的要塞资源
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37457))  --封印命运：海量的要塞资源
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37458))  --封印命运：额外的荣誉
 --frame:AddDoubleLine(AddColor("既定命运印记X1",GOLD), completedstring(37459))  --封印命运：不朽的荣誉
 --要塞入侵
 frame:AddDoubleLine(quest_icon..AddColor("要塞入侵",GOLD), completedstring(37638 and 37639 and 37640 and 38482))
 frame:AddLine(" ")
 
 --时光本
 frame:AddDoubleLine(quest_icon..AddColor("时空漫游-TBC",ZONE_BLUE), completedstring(40168))   --TBC
 frame:AddDoubleLine(quest_icon..AddColor("时空漫游-WLK",ZONE_BLUE), completedstring(40173))   --WLK
 frame:AddDoubleLine(quest_icon..AddColor("时空漫游-CTM",ZONE_BLUE), completedstring(40786))   --CTM
 frame:AddLine(" ")
 
 --[[周长任务 可改为刃牙声望3精英
 frame:AddLine(getitemname(ritualstone_name)..":")
 frame:AddDoubleLine(rare_icon..AddColor(rare_name,WHITE), completedstring(32610))
 frame:AddDoubleLine(chest_icon..AddColor(select(8,GetAchievementInfo(8104)),WHITE), completedstring(32609))
 frame:AddLine(" ")
 
 -- check if the character has completed the first summoning quest
 if IsQuestFlaggedCompleted(32708) and WeeklyItems_Options["ctk_quest_name"] ~= nil then
  if IsQuestFlaggedCompleted(32640) or IsQuestFlaggedCompleted(32641) then
   frame:AddDoubleLine(quest_icon..AddColor(WeeklyItems_Options["ctk_quest_name"],WHITE), AddColor(COMPLETE,LIGHT_GREEN))
  else
   frame:AddDoubleLine(quest_icon..AddColor(WeeklyItems_Options["ctk_quest_name"],WHITE), AddColor(INCOMPLETE,LIGHT_RED))
  end
 end]]
 
 --[[破碎侍从官之颅  和 3个石头
 frame:AddDoubleLine(quest_icon..AddColor(GetAchievementCriteriaInfo(8105,1),WHITE), completedstring(32505))
 frame:AddLine(" ")
 frame:AddLine(AddColor(select(2,GetAchievementInfo(8110))..":", GOLD))
 frame:AddLine(" - "..getitemname(deng_itemname))
 frame:AddDoubleLine(" - "..getitemname(haqin_itemname), completedstring(32611))
 frame:AddLine(" - "..getitemname(vu_itemname))]]
  
 frame:AddLine(rare_icon..AddColor("世界Boss",GOLD))
 frame:AddDoubleLine(AddColor("鲁克玛",PINK), completedstring(37464)) 
 frame:AddDoubleLine(AddColor("卡扎克",PINK), CheckKazzak())
 frame:AddLine(" ")
  
 frame:AddLine(chest_icon..AddColor("塔纳安Boss",GOLD))
 frame:AddDoubleLine(AddColor("暗影领主艾斯卡 -|cff00ddFF 死爪|r",COORD_GREY), completedstring(39287))
 frame:AddDoubleLine(AddColor("游侠将军         -|cff00ddFF 泰罗菲斯特|r",COORD_GREY), completedstring(39288))
 frame:AddDoubleLine(AddColor("攻城大师玛塔克 -|cff00ddFF 末日之轮|r",COORD_GREY), completedstring(39289))
 frame:AddDoubleLine(AddColor("暴君维哈里      -|cff00ddFF 维金斯|r",COORD_GREY), completedstring(39290)) 
 frame:AddLine(" ")
  
 frame:AddLine(AddColor("副本CD",GOLD))
for i = 1, GetNumSavedInstances() do
	local name, id, _, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, level, total, progress = GetSavedInstanceInfo(i)
	frame:AddDoubleLine(AddColor(name.."("..level..")",WHITE), locked and AddColor(progress.."/"..total, LIGHT_GREEN) or AddColor("已过期", LIGHT_RED))
end

 if not istooltip then
  frame:AddLine(" ")
  frame:AddLine(" ")
 end
end

local ldbset = false
local eventframe = CreateFrame("FRAME","WIEventFrame")
eventframe:RegisterEvent("VARIABLES_LOADED")
eventframe:RegisterEvent("GET_ITEM_INFO_RECEIVED")
eventframe:RegisterEvent("QUEST_LOG_UPDATE")
eventframe:RegisterEvent("UPDATE_INSTANCE_INFO")
eventframe:RegisterEvent("CURRENCY_DISPLAY_UPDATE") 
local function eventhandler(self, event, ...)

 if event == "QUEST_LOG_UPDATE" then
  local i, s
  for i = 1, GetNumQuestLogEntries() do
   s = GetQuestLink(i)
   if s ~= nil then
    s = string.match(s, "Hquest:(%d+)");
   end
  end
 elseif event == "CURRENCY_DISPLAY_UPDATE" then
  --if keylink == nil then
   _, bonusname = GetCurrencyInfo(1129)
  --end
  --if ritualstone_name == nil then
   --_, ritualstone_name = GetItemInfo(94221)
  --end
  --if deng_itemname == nil then
    --_, deng_itemname = GetItemInfo(94233)
  --end
  --if vu_itemname == nil then
    --_, vu_itemname = GetItemInfo(95350)
  --end
  --if haqin_itemname == nil then
    --_, haqin_itemname = GetItemInfo(94130)
  --end
 elseif event == "VARIABLES_LOADED" then
  --_, keylink = GetItemInfo(94222)
  --_, ritualstone_name = GetItemInfo(94221)
  --_, deng_itemname = GetItemInfo(94233)
  --_, haqin_itemname = GetItemInfo(94130)
  --_, vu_itemname = GetItemInfo(95350)
  if WeeklyItems_Options == nil then
   WeeklyItems_Options = {}
  end
  if WeeklyItems_Options["minimap_icon"] == nil then
    WeeklyItems_Options["minimap_icon"] = {
        hide = false,
        --minimapPos = 220,
    }
  end

  if ldb and not ldbset then
   local WeeklyCheck = ldb:NewDataObject("WeeklyCheck", {
	--type = "data source",
	icon = "Interface\\Addons\\Ace3\\ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI",
	--label = "Weekly Check",
	OnClick = function(self,button)
  PlaySound("igSpellBookOpen");
  sendCmd("/mr");
  --InterfaceOptionsFrame_OpenToCategory("|cffFFFFFF[毛人]|r自动交接任务");
  end,
	OnTooltipShow = function(tooltip)
		 DrawMainframe(tooltip,true)
	end,
   })
   if ldbicon then
    ldbicon:Register("WeeklyCheck", WeeklyCheck, WeeklyItems_Options["minimap_icon"])
   end
   ldbset = true
  end -- variables_loaded
 end
end
eventframe:SetScript("OnEvent", eventhandler);