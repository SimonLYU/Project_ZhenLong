--require
require("util")
require("zaobing")
require("chuzheng")
require("baoxiang")
require("huoyue")
require("jiasu")
require("renwu")
require("attack")
local bb = require("3rd.badboy")
local json = bb.json
--moudle
self = {}
--config
CONFIG_zaobing = 1
CONFIG_chuzheng = 1
CONFIG_baoxiang = 1
CONFIG_huoyue = 1
CONFIG_jiasu = 1
CONFIG_renwu = 1
CONFIG_attack = 1

--有选项页
function configUI()
	alert_width = 700
	alert_height = 900
	screen_width,screen_height = getScreenSize()
	if screen_width < alert_width then
		alert_width = screen_width - 40
	end
	if screen_height < alert_height then
		alert_height = screen_height - 40
	end
	
	local MyTable = {
		
		["style"] = "default",
		["width"] = alert_width,
		["height"] = alert_height,
		["config"] = "save_001.dat",
		["bg"] = "bg.png",
		["okname"] = "确定",
		["cancelname"] = "取消",
		["views"] = {
			{
				["type"] = "Page",
				["text"] = "总设置",
				["views"] = {
					{
						["type"] = "Label",
						["text"] = "ps:开启脚本后如果没有反应，请彻底关掉游戏后重新进入，再开启脚本",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "基本功能",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "CheckBoxGroup1",
						["type"] = "CheckBoxGroup",
						["size"] = 40,
						["list"] = "自动造兵,队列出征,领取宝箱,活跃奖励,军团加速,领取任务,被打开罩",
						["select"] = "0,1,2,3,4,5,6",
						["color"] = "255,255,255",
					},
					{
						["type"] = "Label",
						["text"] = "队列出征数量:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "勾选队列出征后,以下设置生效",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBoxDuiLieCount",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "1,2,3,4,5",
						["color"] = "255,108,88",
						["select"] = "2"
					},
				}
			},
			{
				["type"] = "Page",
				["text"] = "出征设置",
				["views"] = {
					{
						["type"] = "Label",
						["text"] = "tip:勾选队列出征后,本页面设置才会生效",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "目标等级(全局生效):",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "此项关系到搜索资源等级时,\"加号\"点击的次数",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "EditLevel",
						["type"] = "Edit",
						["prompt"] = "请输入数值",
						["text"] = "5",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
						["kbtype"] = "number",
					},
					{
						["type"] = "Label",
						["text"] = "当前可搜索野怪的最高等级:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "此项关系到搜索资源等级时,\"减号\"点击的次数",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "EditMaxLevel",
						["type"] = "Edit",
						["prompt"] = "请输入数值",
						["text"] = "23",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
						["kbtype"] = "number",
					},
					{
						["type"] = "Label",
						["text"] = "采集资源配置:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "以下配置对攻打野外敌兵不生效!!!",
						["size"] = 25,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["type"] = "Label",
						["text"] = "队列一:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBox1",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "神兽,贼兵,粮草,木材,石材,铁矿,银矿",
						["select"] = "0"
					},
					{
						["type"] = "Label",
						["text"] = "队列二:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBox2",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "神兽,贼兵,粮草,木材,石材,铁矿,银矿",
						["select"] = "0"
					},
					{
						["type"] = "Label",
						["text"] = "队列三:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBox3",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "神兽,贼兵,粮草,木材,石材,铁矿,银矿",
						["select"] = "0"
					},
					{
						["type"] = "Label",
						["text"] = "队列四:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBox4",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "神兽,贼兵,粮草,木材,石材,铁矿,银矿",
						["select"] = "0"
					},
					{
						["type"] = "Label",
						["text"] = "队列五:",
						["size"] = 40,
						["align"] = "left",
						["color"] = "255,108,88",
					},
					{
						["id"] = "ComboBox5",
						["type"] = "ComboBox",
						["size"] = 40,
						["list"] = "神兽,贼兵,粮草,木材,石材,铁矿,银矿",
						["select"] = "0"
					},
				}
			},
		}
	}
	return MyTable
	
end

--main
function main()
	--init
	init("0", 1);
	setScreenScale(1242,2208)
	util.initMyHud()
	--UI
	local ret, results = showUI(json.encode(configUI()))    --table转json
	--点击确认返回1, 取消返回0
	if ret == 1 then
		--results 返回以id为key的Map类型数据,返回值为字符串
		--自动造兵
		if bb.strutils.contains(results["CheckBoxGroup1"],"0") then
			CONFIG_zaobing = 1
		else 
			CONFIG_zaobing = 0
		end
		--自动出征
		if bb.strutils.contains(results["CheckBoxGroup1"],"1") then
			CONFIG_chuzheng = 1
			if tonumber(results["EditLevel"]) <= 0 then
				dialog("主人,您填写的出征等级不正确哦,下次记得填好哦,~", 0)
				main()
				return 0
			end
			if tonumber(results["EditMaxLevel"]) <= 0 then
				dialog("主人,您填写的当前可搜索野怪的最高等级不正确哦,下次记得填好哦~", 0)
				main()
				return 0
			end
			--队列任务
			_G["CONFIG_chu_zheng_type"]  = tonumber(results["RadioGroupChuZheng"])--0:打怪,1:采集
			_G["CONFIG_search_level"] =	tonumber(results["EditLevel"]) - 1
			_G["CONFIG_max_level"] =	tonumber(results["EditMaxLevel"]) - 1
			--队列数量
			_G["CONFIG_dui_lie_count"] =	tonumber(results["ComboBoxDuiLieCount"]) + 1
			--五个队列轮番执行
			_G["chuzheng_first"]  = tonumber(results["ComboBox1"])
			_G["chuzheng_second"]  = tonumber(results["ComboBox2"])
			_G["chuzheng_third"]  = tonumber(results["ComboBox3"])
			_G["chuzheng_forth"]  = tonumber(results["ComboBox4"])
			_G["chuzheng_fifth"]  = tonumber(results["ComboBox5"])
		else 
			CONFIG_chuzheng = 0
		end
		--领取宝箱
		if bb.strutils.contains(results["CheckBoxGroup1"],"2") then--神秘宝箱
			CONFIG_baoxiang = 1
		else 
			CONFIG_baoxiang = 0
		end
		--领取活跃奖励
		if bb.strutils.contains(results["CheckBoxGroup1"],"3") then--活跃奖励
			CONFIG_huoyue = 1
		else 
			CONFIG_huoyue = 0
		end
		--军团加速
		if bb.strutils.contains(results["CheckBoxGroup1"],"4") then--军团加速
			CONFIG_jiasu = 1
		else 
			CONFIG_jiasu = 0
		end
		--领取任务
		if bb.strutils.contains(results["CheckBoxGroup1"],"5") then--自动领取任务
			CONFIG_renwu = 1
		else 
			CONFIG_renwu = 0
		end
		--被打开罩
		if bb.strutils.contains(results["CheckBoxGroup1"],"6") then--被打开罩
			CONFIG_attack = 1
			_G["config_attack"]  = 1
		else 
			CONFIG_attack = 0
			_G["config_attack"]  = 0
		end
		
	else
		dialog("主人拜拜,我们下次见哦~", 0)
		lua_exit()
	end
	--protect
	if CONFIG_zaobing == 0 and CONFIG_chuzheng == 0 and CONFIG_baoxiang == 0 and CONFIG_huoyue == 0 and CONFIG_jiasu == 0 and CONFIG_renwu == 0 and CONFIG_attack == 0 then
		dialog("主人,要记得选择功能哦~",0)
		main()
		return 0
	end
	--main function
	repeat
		resetIDLETimer()
		if CONFIG_zaobing == 1 then
			zaobing.func_zaobing_main()
		end
		if CONFIG_chuzheng == 1 then 
			chuzheng.func_chuzheng_main()
		end
		if CONFIG_baoxiang == 1 then
			baoxiang.func_baoxiang_main()
		end
		if CONFIG_huoyue == 1 then
			huoyue.func_huoyue_main()
		end
		if CONFIG_jiasu == 1 then
			jiasu.func_jiasu_main()
		end
		if CONFIG_renwu == 1 then
			renwu.func_renwu_main()
		end
		if CONFIG_attack == 1 then
			attack.func_attack_main()
		end
		mSleep(500)
	until(false)
end
main()
return self