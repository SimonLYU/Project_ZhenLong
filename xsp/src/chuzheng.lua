require "util"

chuzheng = {}
STEP_chuzheng = 0
CHUZHENG_max_duilie_count = 5
CHUZHENG_v_padding = 73
CHUZHENG_position = 0
CHUZHENG_current_duilie = 0

SUBSTEP_chuzheng = 0

CHUZHENG_resource_position_x = 233
CHUZHENG_resource_position_y = 908
CHUZHENG_resource_h_padding = 296

max_level = _G["CONFIG_max_level"]
search_level = _G["CONFIG_search_level"] 

CHUZHENG_function = 0

function func_chuzheng_open()
	util.hudToast("开始自动出征")
	public.func_start_init()
	for i = 1 , 2 ,1 do
		util.click(40,750)
		mSleep(500)
	end
	if public.func_detect_out_of_city() == 1 then--在城外
		--do nothing...
	else--在城内
		util.click(100,1057)
		mSleep(2000)
	end
	STEP_chuzheng = 1
end

--sub func
function subfunc_chuzheng_click_search()
	util.hudToast("点击搜索")
	max_level = _G["CONFIG_max_level"]
	search_level = _G["CONFIG_search_level"] 
	util.click(580,1090)
	SUBSTEP_chuzheng = 1
end

function select_function_with_duilie(duilie)
	if duilie == 0 then
		return 0
	elseif duilie == 1 then
		return 1
	else
		return 2
	end
end

function subfunc_chuzheng_select_resource()
	util.hudToast("选择资源")
	local xPos = 0
	local yPos = 0
	if CHUZHENG_current_duilie == 0 then --队列1,以此类推
		CHUZHENG_function = select_function_with_duilie(	_G["chuzheng_first"])
		xPos = CHUZHENG_resource_position_x + CHUZHENG_resource_h_padding * 	_G["chuzheng_first"]
		yPos = CHUZHENG_resource_position_y 
	elseif CHUZHENG_current_duilie == 1 then
		CHUZHENG_function = select_function_with_duilie(	_G["chuzheng_second"])
		xPos = CHUZHENG_resource_position_x + CHUZHENG_resource_h_padding * 	_G["chuzheng_second"]
		yPos = CHUZHENG_resource_position_y 
	elseif CHUZHENG_current_duilie == 2 then
		CHUZHENG_function = select_function_with_duilie(	_G["chuzheng_third"])
		xPos = CHUZHENG_resource_position_x + CHUZHENG_resource_h_padding * 	_G["chuzheng_third"]
		yPos = CHUZHENG_resource_position_y 
	elseif CHUZHENG_current_duilie == 3 then
		CHUZHENG_function = select_function_with_duilie(	_G["chuzheng_forth"])
		xPos = CHUZHENG_resource_position_x + CHUZHENG_resource_h_padding * 	_G["chuzheng_forth"]
		yPos = CHUZHENG_resource_position_y 
	elseif CHUZHENG_current_duilie == 4 then
		CHUZHENG_function = select_function_with_duilie(	_G["chuzheng_fifth"])
		xPos = CHUZHENG_resource_position_x + CHUZHENG_resource_h_padding * 	_G["chuzheng_fifth"]
		yPos = CHUZHENG_resource_position_y 
	end
	util.click(xPos,yPos)
	CHUZHENG_current_duilie = CHUZHENG_current_duilie + 1
	if CHUZHENG_current_duilie >= _G["CONFIG_dui_lie_count"] then
		CHUZHENG_current_duilie = 0
	end
	SUBSTEP_chuzheng = 2
end

function subfunc_chuzheng_select_level()
	--touch -
	util.hudToast("选择等级")
	for i=1,max_level,1 do
		util.click(157,1146)
		mSleep(50)
	end
	--touch +
	for i=1,search_level,1 do
		util.click(1168,1145)
		mSleep(50)
	end
	SUBSTEP_chuzheng = 3 
end

function subfunc_chuzheng_click_blue_search()
	util.hudToast("点击右下角搜索")
	util.click(1815,1145)
	mSleep(500)
	x, y = findColorInRegionFuzzy(0x3b7286, 99, 
	1681, 
	1116, 
	1946, 
	1178,
	0, 0)
	if x > -1 then
		util.hudToast("资源搜索不到,降低等级继续搜索")
		search_level = search_level - 1
		if search_level < 1 then
			search_level = 1
		end
		SUBSTEP_chuzheng = 2
	else
		SUBSTEP_chuzheng = 4
		mSleep(1500)
	end
end

function func_close_alert_if_necessary()
	x, y = findColorInRegionFuzzy(0x37647b, 99, 
	730, 
	857, 
	1043, 
	916,
	0, 0)
	x1, y1= findColorInRegionFuzzy(0xbb9b45, 99, 
	1161, 
	858, 
	1466, 
	917,
	0, 0)
	if x > -1 and x1 > -1 then
		util.hudToast("检测到弹窗,确认关闭")
		util.click(x1,y1)
		mSleep(500)
	end
end

function subfunc_chuzheng_click_resource()
	util.hudToast("点击查找到的目标")
	util.click(1110,617)--点击资源
	mSleep(500)
	if CHUZHENG_function == 0 then--神兽
		x, y = findColorInRegionFuzzy(0x36647a, 99, 
		1622, 
		920, 
		1952, 
		1030,
		0, 0)
		x1, y1 = findColorInRegionFuzzy(0xf5edc7, 99, 
		1622, 
		920, 
		1952, 
		1030,
		0, 0)
		if x > -1 and x1 > -1 then
			util.hudToast("准备出战")
			util.click(x1,y1)
			SUBSTEP_chuzheng = 5
		else
			util.hudToast("升级科技后再来讨伐此神兽吧!")
			util.clickRightSpace()
			SUBSTEP_chuzheng = util.ERROR_CODE
		end
	elseif CHUZHENG_function == 1 then--贼兵
		x, y = findColorInRegionFuzzy(0xb59543, 99, 
		1410, 
		941, 
		1742, 
		1000,
		0, 0)
		if x > -1 then
			util.hudToast("准备出战")
			util.click(x,y)
			SUBSTEP_chuzheng = 5
		else
			util.hudToast("前置低等级贼兵没有讨伐")
			util.click(1590,973)
			mSleep(1500)
			subfunc_chuzheng_click_resource()
		end
	else--资源
		util.click(1372,508)--点击占领
		SUBSTEP_chuzheng = 5
	end
end

function subfunc_chuzheng_click_chuzheng()
	x1, y1 = findColorInRegionFuzzy(0x614c45, 99, 7, 5, 128, 87, 0, 0)
	x, y = findColorInRegionFuzzy(0xebd79c, 99, 7, 5, 128, 87, 0, 0)
	if x > -1 and x1 > -1 then--出发
		util.hudToast("点击出发")
		util.click(1997,1157)
		mSleep(1000)
		func_close_alert_if_necessary()
		util.closeMenuIfNecessary()
		SUBSTEP_chuzheng = util.ERROR_CODE
		else--行动力不足,无法出发
		for i = 1 , 2 , 1 do
			util.hudToast("行动力不足")
			util.clickRightSpace()
		end
		func_close_alert_if_necessary()
		util.closeMenuIfNecessary()
		SUBSTEP_chuzheng = util.ERROR_CODE
	end
end

function subfunc_chuzheng_main()
	mSleep(500)
	if SUBSTEP_chuzheng == 0 then
		subfunc_chuzheng_click_search()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == 1 then
		subfunc_chuzheng_select_resource()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == 2 then
		subfunc_chuzheng_select_level()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == 3 then
		subfunc_chuzheng_click_blue_search()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == 4 then
		subfunc_chuzheng_click_resource()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == 5 then
		subfunc_chuzheng_click_chuzheng()
		subfunc_chuzheng_main()
	elseif SUBSTEP_chuzheng == util.ERROR_CODE then
		SUBSTEP_chuzheng = 0
	end
end

function func_search_duilie()
	for i = 1 , CHUZHENG_max_duilie_count , 1 do
		x, y = findColorInRegionFuzzy(0x8bd340, 99, 
		183, 
		428 + CHUZHENG_position * CHUZHENG_v_padding, 
		395, 
		452 + CHUZHENG_position * CHUZHENG_v_padding,
		0, 0)
		if x > -1 then
			util.hudToast("寻找到可以出征的队列:"..(CHUZHENG_current_duilie + 1))
			subfunc_chuzheng_main()
		end
		CHUZHENG_position = CHUZHENG_position + 1
	end
	util.hudToast("暂时没有可以出征的队列")
	STEP_chuzheng = util.ERROR_CODE
end

function chuzheng.func_chuzheng_main()
mSleep(500)
	if STEP_chuzheng == 0 then
		func_chuzheng_open()
		chuzheng.func_chuzheng_main()
	elseif STEP_chuzheng == 1 then
		func_search_duilie()
		chuzheng.func_chuzheng_main()
	elseif STEP_chuzheng == util.ERROR_CODE then
		STEP_chuzheng = 0
		CHUZHENG_position = 0
	end
end

return chuzheng