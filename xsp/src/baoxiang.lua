require "util"
require "public"

baoxiang = {}

STEP_baoxiang = 0

function func_baoxiang_detect_redpoint()
	public.func_start_init()
	x, y = findColorInRegionFuzzy(0xb12b11, 99, 
	2063, 
	795, 
	2106, 
	837,
	0, 0)
	x1, y1 = findColorInRegionFuzzy(0xfcfaec, 99, 
	2063, 
	795, 
	2106, 
	837,
	0, 0)
	x2, y2 = findColorInRegionFuzzy(0x8bab47, 99, 
	2083, 
	921, 
	2172, 
	942,
	0, 0)
	if x > -1 and x1 > -1 and x2 > -1 then--可以领取宝箱
		util.hudToast("点击宝箱")
		util.click(2133,865)
		STEP_baoxiang = 1
	else
		util.hudToast("当前无需领取宝箱")
		STEP_baoxiang = util.ERROR_CODE
	end
end

function func_baoxiang_click_lingqu()
	util.click(1100,790)
	STEP_baoxiang = util.ERROR_CODE
end

function baoxiang.func_baoxiang_main()
	mSleep(500)
	if STEP_baoxiang == 0 then
		func_baoxiang_detect_redpoint()
		baoxiang.func_baoxiang_main()
	elseif STEP_baoxiang == 1 then
		func_baoxiang_click_lingqu()
		baoxiang.func_baoxiang_main()
	elseif STEP_baoxiang == util.ERROR_CODE then
		STEP_baoxiang = 0
	end
end

return baoxiang