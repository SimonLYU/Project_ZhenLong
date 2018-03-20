require "util"
require "public"

renwu = {}
STEP_renwu = 0

function func_renwu_detect_redpoint()
public.func_start_init()
	x, y = findColorInRegionFuzzy(0xb2372b, 99, 
		1886, 
		1088, 
		1925, 
		1128,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xf7eece, 99, 
		1886, 
		1088, 
		1925, 
		1128,
		0, 0)
	if x > -1 and x1 > -1 then
		util.hudToast("进入任务界面")
		util.click(1940,1153)
		STEP_renwu = 1
	else
		util.hudToast("当前没有可以领取的任务")
		STEP_renwu = util.ERROR_CODE
	end
end

function func_renwu_click_zhuxian_renwu()
	x, y = findColorInRegionFuzzy(0xc5a543, 99, 
		1900, 
		256, 
		2093, 
		326,
		0, 0)
	if x > -1 then
		util.hudToast("点击领取主线任务奖励")
		util.click(x,y)
		mSleep(1000)
		func_renwu_click_zhuxian_renwu()
	else
		STEP_renwu = 2 
	end
end

function func_renwu_click_normal_renwu()
	x, y = findColorInRegionFuzzy(0xc5a543, 99, 
		1900, 
		557, 
		2093, 
		620,
		0, 0)
	if x > -1 then
		util.hudToast("点击领取普通任务奖励")
		util.click(x,y)
		mSleep(1000)
		func_renwu_click_normal_renwu()
	else
		STEP_renwu = 3
	end
end

function func_renwu_detect_richang_redpoint()
	x, y = findColorInRegionFuzzy(0xad3429, 99, 
		110, 
		593, 
		160, 
		640,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xfdfbfb, 99, 
		110, 
		593, 
		160, 
		640,
		0, 0)
	if x > -1 and x1 > -1 then
		util.hudToast("准备领取军团日常任务")
		util.click(x,y)
		STEP_renwu = 4
	else
		STEP_renwu = util.ERROR_CODE
	end
end

function func_renwu_click_onekey_lingqu()
	x, y = findColorInRegionFuzzy(0xb69642, 99, 
		1092, 
		1128, 
		1291, 
		1188,
		0, 0)
	if x > -1 then
		util.hudToast("点击一键领取")
		util.click(x,y)
		STEP_renwu = util.ERROR_CODE
	else
		util.hudToast("已经没有可以领取的任务啦")
		STEP_renwu = util.ERROR_CODE
	end
end

function renwu.func_renwu_main()
	mSleep(500)
	if STEP_renwu == 0 then
		func_renwu_detect_redpoint()
		renwu.func_renwu_main()
	elseif STEP_renwu == 1 then
		func_renwu_click_zhuxian_renwu()
		renwu.func_renwu_main()
	elseif STEP_renwu == 2 then
		func_renwu_click_normal_renwu()
		renwu.func_renwu_main()
	elseif STEP_renwu == 3 then
		func_renwu_detect_richang_redpoint()
		renwu.func_renwu_main()
	elseif STEP_renwu == 4 then
		func_renwu_click_onekey_lingqu()
		renwu.func_renwu_main()
	elseif STEP_renwu == util.ERROR_CODE then
		util.closeMenuIfNecessary()
		STEP_renwu = 0
	end
end

return renwu
