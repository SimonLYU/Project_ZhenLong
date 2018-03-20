require "util"
require "public"

zaobing = {}
STEP_zaobing = 0
SUB_STEP_zaobing = 0
max_bingying_coung = 5

bingying_x1 = 190
bingying_y1 = 428
bingying_x2 = 383
bingying_y2 = 452
bingying_v_padding = 73
bingying_position = 0

function func_zaobing_open()
	util.hudToast("开始自动造兵")
	public.func_start_init()
		for i = 1 , 2 ,1 do
		util.click(51,608)
		mSleep(500)
	end
	STEP_zaobing = 1
end

function subfunc_zaobing_click_xunlian()
	util.hudToast("进入兵营")
	util.click(1266,692)
	SUB_STEP_zaobing = 1
end

function subfunc_zaobing_click_blue_xunlian()
	util.hudToast("点击训练")
	x, y = findColorInRegionFuzzy(0x028374, 99, 
	1841, 
	1096, 
	2113, 
	1200,
	0, 0)
	if x > -1 then
		util.click(x,y)
	end
	SUB_STEP_zaobing = util.ERROR_CODE
end

function subfunc_zaobing_main()
	mSleep(500)
	if SUB_STEP_zaobing == 0 then
		subfunc_zaobing_click_xunlian()
		subfunc_zaobing_main()
	elseif SUB_STEP_zaobing == 1 then
		subfunc_zaobing_click_blue_xunlian()
		subfunc_zaobing_main()
	elseif SUB_STEP_zaobing == util.ERROR_CODE then
		--do nothing...
		util.closeMenuIfNecessary()
		SUB_STEP_zaobing = 0
	end
end

function func_zaobing_search_green()
	util.hudToast("寻找可用兵营")
	for i=1,max_bingying_coung,1 do
		x, y = findColorInRegionFuzzy(0x82c23f, 99, 
		bingying_x1, 
		bingying_y1 + bingying_position * bingying_v_padding, 
		bingying_x2, 
		bingying_y2 + bingying_position * bingying_v_padding,
		0, 0)
		if x > -1 then
			util.click(x,y)
			mSleep(1500)
			subfunc_zaobing_main()
		end
		bingying_position = bingying_position + 1
		mSleep(50)
	end
	util.hudToast("自动造兵结束")
	STEP_zaobing = util.ERROR_CODE
end

function zaobing.func_zaobing_main()
	mSleep(500)
	if STEP_zaobing == 0 then
		func_zaobing_open()
		zaobing.func_zaobing_main()
	elseif STEP_zaobing == 1 then
		func_zaobing_search_green()
		zaobing.func_zaobing_main()
	elseif STEP_zaobing == util.ERROR_CODE then
		STEP_zaobing = 0
		SUB_STEP_zaobing = 0
		bingying_position = 0
	end
end

return zaobing