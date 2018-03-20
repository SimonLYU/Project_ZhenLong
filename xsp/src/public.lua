require "util"
require "attack"

public = {}

function public.func_detect_out_of_city()
	util.hudToast("检测是否在城内")
	--
	x, y = findColorInRegionFuzzy(0xdbbb75, 99, 
		233, 
		1058, 
		306, 
		1127,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0x262423, 99, 
		233, 
		1058, 
		306, 
		1127,
		0, 0)
	x2, y2 = findColorInRegionFuzzy(0xf2edd6, 99, 
		233, 
		1058, 
		306, 
		1127,
		0, 0)
	--
	x3, y3 = findColorInRegionFuzzy(0xeecc7f, 99, 
		371, 
		1058, 
		445, 
		1127,
		0, 0)
	x4, y4 = findColorInRegionFuzzy(0x252423, 99, 
		371, 
		1058, 
		445, 
		1127,
		0, 0)
	x5, y5 = findColorInRegionFuzzy(0xfbf6de, 99, 
		371, 
		1058, 
		445, 
		1127,
		0, 0)
	--
	x6, y6 = findColorInRegionFuzzy(0xdaba72, 99, 
		497, 
		1058, 
		568, 
		1127,
		0, 0)
	x7, y7 = findColorInRegionFuzzy(0x252423, 99, 
		497, 
		1058, 
		568, 
		1127,
		0, 0)
	x8, y8 = findColorInRegionFuzzy(0xeee8d2	, 99, 
		497, 
		1058, 
		568, 
		1127,
		0, 0)
	if x > -1 and x1 > -1 and x2 > -1 and x3 > -1 and x4 > -1 and x5 > -1 and x6 > -1 and x7 > -1 and x8 > -1 then
		util.hudToast("检测到当前在城外")
		return 1
	else
		util.hudToast("检测到当前在城内")
		return 0
	end
end

function func_close_gonggao()
	x, y = findColorInRegionFuzzy(0x754d3b	, 99, 
		968, 
		128, 
		1232, 
		173,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xfefefe	, 99, 
		968, 
		128, 
		1232, 
		173,
		0, 0)
	x2, y2 = findColorInRegionFuzzy(0x3d1a13	, 99, 
		1806, 
		122, 
		1898, 
		200,
		0, 0)
	x3, y3 = findColorInRegionFuzzy(0x9c7734	, 99, 
		1806, 
		122, 
		1898, 
		200,
		0, 0)
	if x > -1 and x1 > -1 and x2 > -1 and x3 > -1 then
		util.hudToast("检测到公告,关闭!")
		util.click(x3,y3)
		mSleep(500)
	end
	
	x, y = findColorInRegionFuzzy(0x3a4359	, 99, 
		1050, 
		160, 
		1167, 
		211,
		0, 0)
	x1, y1 = findColorInRegionFuzzy(0xe9f7ff	, 99, 
		1050, 
		160, 
		1167, 
		211,
		0, 0)
	x2, y2 = findColorInRegionFuzzy(0x33150f	, 99, 
		1904, 
		137, 
		1998, 
		228,
		0, 0)
	x3, y3 = findColorInRegionFuzzy(0x977130	, 99, 
		1904, 
		137, 
		1998, 
		228,
		0, 0)
	if x > -1 and x1 > -1 and x2 > -1 and x3 > -1 then
		util.hudToast("检测到公告,关闭!")
		util.click(x3,y3)
		mSleep(500)
	end
end

function public.func_start_init()
	func_close_gonggao()
	util.closeMenuIfNecessary()
	if _G["config_attack"] == 1 then
		attack.func_attack_main()
	end
end

return public