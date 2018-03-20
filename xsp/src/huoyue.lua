require "util"
require "public"

huoyue = {}

STEP_huoyue = 0
HUOYUE_baoxiang_position_x = {510,631,788,990,1237,1520,1798,2082}
HUOYUE_baoxiang_position_y = 200
HUOYUE_baoxiang_position = 1

function func_huoyue_detect_redpoint()
	public.func_start_init()
	x, y = findColorInRegionFuzzy(0xaf2c10, 99, 
		1495, 
		107, 
		1538, 
		150,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xfcfaec, 99, 
		1495, 
		107, 
		1538, 
		150,
		0, 0)
	if x > -1 and x1 > -1 then--可以领取活跃奖励
		util.hudToast("进入领取活跃奖励界面")
		util.click(1560,173)
		STEP_huoyue = 1
	else
		util.hudToast("当前无需领取活跃奖励")
		STEP_huoyue = util.ERROR_CODE
	end
end

function func_huoyue_lingqu_jiangli()
	x, y = findColorInRegionFuzzy(0xc4a344, 99, 
		1883, 
		603, 
		2132, 
		666,
		0, 0)
	if x > -1 then--领取奖励
		util.hudToast("领取活跃度任务奖励")
		util.click(x,y)
		mSleep(1000)
		func_huoyue_lingqu_jiangli()
	else
		STEP_huoyue = 2
	end
end

function func_huoyue_lingqu_baoxiang()
	util.click(HUOYUE_baoxiang_position_x[HUOYUE_baoxiang_position] , HUOYUE_baoxiang_position_y)
	mSleep(500)
	x, y = findColorInRegionFuzzy(0xb59643, 99, 
		971, 
		947, 
		1241, 
		1013,
		0, 0)
	if x > -1 then--领取奖励
		util.hudToast("领取第"..HUOYUE_baoxiang_position.."个活跃度宝箱")
		util.click(x,y)
	else
	util.hudToast("跳过第"..HUOYUE_baoxiang_position.."个活跃度宝箱")
		util.clickRightSpace()
	end
	
	HUOYUE_baoxiang_position = HUOYUE_baoxiang_position + 1
	if HUOYUE_baoxiang_position > 8 then
		util.hudToast("活跃度宝箱已经全部领取完毕")
		util.closeMenuIfNecessary()
		STEP_huoyue = util.ERROR_CODE
	else
		mSleep(500)
		func_huoyue_lingqu_baoxiang()
	end
end

function huoyue.func_huoyue_main()
	mSleep(500)
	if STEP_huoyue == 0 then
		HUOYUE_baoxiang_position = 1
		func_huoyue_detect_redpoint()
		huoyue.func_huoyue_main()
	elseif STEP_huoyue == 1 then
		func_huoyue_lingqu_jiangli()
		huoyue.func_huoyue_main()
	elseif STEP_huoyue == 2 then
		func_huoyue_lingqu_baoxiang()
		huoyue.func_huoyue_main()
	elseif STEP_huoyue == util.ERROR_CODE then
		HUOYUE_baoxiang_position = 1
		STEP_huoyue = 0
	end
end

return huoyue