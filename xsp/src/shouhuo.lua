require "util"
require "public"

shouhuo = {}
STEP_shouhuo = 0

SHOUHUO_position_max = 8
SHOUHUO_position_x = {1763,1178,1505,973,1175,933,1353,1695}
SHOUHUO_position_y = {593,700,520,606,500,427,383,365}

function func_shouhuo_youxiajiao()
	public.func_start_init()
	if public.func_detect_out_of_city() == 1 then--在城外
		util.click(100,1057)
		mSleep(2000)
	else--在城内
		--do nothing...
	end
	util.hudToast("定位屏幕到右下角")
	util.move(1700,450,1050,450)
	mSleep(500)
	util.move(1700,450,1050,450)
	mSleep(500)
	util.move(1400,850,1400,450)
	mSleep(500)
	util.move(1400,850,1400,450)
	mSleep(500)
	STEP_shouhuo = 1
end

function func_shouhuo_click_targets()
	util.hudToast("依次收获右下角资源")
	for index = 1 , SHOUHUO_position_max,1 do
		util.click(SHOUHUO_position_x[index],SHOUHUO_position_y[index])
		mSleep(250)
	end
	STEP_shouhuo = util.ERROR_CODE
end

function shouhuo.func_shouhuo_main()
	mSleep(500)
	if STEP_shouhuo == 0 then
		func_shouhuo_youxiajiao()
		shouhuo.func_shouhuo_main()
	elseif STEP_shouhuo == 1 then
		func_shouhuo_click_targets()
		shouhuo.func_shouhuo_main()
	elseif STEP_shouhuo == util.ERROR_CODE then
		STEP_shouhuo = 0
	end
end

return shouhuo