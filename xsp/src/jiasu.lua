require "util"
require "public"

jiasu = {}
STEP_jiasu = 0

function func_jiasu_detect_redpoint()
	public.func_start_init()
	x, y = findColorInRegionFuzzy(0xaa3127, 99, 
		1917, 
		795, 
		1957, 
		831,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xfff8d7, 99, 
		1917, 
		795, 
		1957, 
		831,
		0, 0)
	x2, y2 = findColorInRegionFuzzy(0xeed084, 99, 
		1917, 
		795, 
		2026, 
		916,
		0, 0)
	x3, y3 = findColorInRegionFuzzy(0xe6e2cb, 99, 
		1917, 
		795, 
		2026, 
		916,
		0, 0)
	if x > -1 and x1 > -1 and x2 > -1 and x3 > -1 then--军团加速
		util.hudToast("进入军团帮助界面")
		util.click(1971,846)
		STEP_jiasu = 1
	else
		util.hudToast("当前无需军团加速")
		STEP_jiasu = util.ERROR_CODE
	end
end

function func_jiasu_click_help()
	x , y = findColorInRegionFuzzy(0xbe9f45, 99, 
		1852, 
		1125, 
		1092, 
		1183,
		0, 0)
	if x > -1 then
		util.hudToast("点击全部帮助")
		util.click(x,y)
		STEP_jiasu = util.ERROR_CODE
	else
		util.hudToast("当前无需军团帮助")
		STEP_jiasu = util.ERROR_CODE
	end
end

function jiasu.func_jiasu_main()
	mSleep(500)
	if STEP_jiasu == 0 then
		func_jiasu_detect_redpoint()
		jiasu.func_jiasu_main()
	elseif STEP_jiasu == 1 then
		func_jiasu_click_help()
		jiasu.func_jiasu_main()
	elseif STEP_jiasu == util.ERROR_CODE then
		util.closeMenuIfNecessary()
		STEP_jiasu = 0
	end
end

return jiasu