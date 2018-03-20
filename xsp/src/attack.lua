require "util"

attack = {}
STEP_attack = 0

function func_attack_detect_attack()
  x, y = findColorInRegionFuzzy(0x931f10, 99, 
    1749, 
    809, 
    1852, 
    917,
    0, 0)
  x1, y1 = findColorInRegionFuzzy(0xf6efd8, 99, 
    1749, 
    809, 
    1852, 
    917,
    0, 0)
  x2, y2 = findColorInRegionFuzzy(0xb2372b, 99, 
    1751, 
    796, 
    1785, 
    834,
    0, 0)
  x3, y3 = findColorInRegionFuzzy(0xfef4d2, 99, 
    1751, 
    796, 
    1785, 
    834,
    0, 0)
  if x > -1 and  x1 > -1 and x2 > -1 and x3 > -1 then
    util.hudToast("检测到有敌情!")
    util.click(1800,855)
    STEP_attack = 1
  else
    func_attack_detect_attack2()
  end
end

function func_attack_detect_attack2()
  x, y = findColorInRegionFuzzy(0x931f10, 99, 
    1749 + 161, 
    809, 
    1852 + 161, 
    917,
    0, 0)
  x1, y1 = findColorInRegionFuzzy(0xf6efd8, 99, 
    1749 + 161, 
    809, 
    1852 + 161, 
    917,
    0, 0)
  x2, y2 = findColorInRegionFuzzy(0xb2372b, 99, 
    1751 + 161, 
    796, 
    1785 + 161, 
    834,
    0, 0)
  x3, y3 = findColorInRegionFuzzy(0xfef4d2, 99, 
    1751 + 161, 
    796, 
    1785 + 161, 
    834,
    0, 0)
  if x > -1 and  x1 > -1 and x2 > -1 and x3 > -1 then
    util.hudToast("检测到有敌情!")
    util.click(1960,855)
    STEP_attack = 1
  else
    STEP_attack = util.ERROR_CODE
  end
end

function func_attack_search_target()
  x, y = findColorInRegionFuzzy(0xabd850, 99, 
    622, 
    401, 
    1300, 
    431,
    0, 0)
  if x > -1 then
    util.hudToast("寻找被攻击的目标")
    util.click(x,y)
    STEP_attack = 2
  else
    util.hudToast("没有检测到被攻击的坐标")
    STEP_attack = util.ERROR_CODE
  end
end

function func_attack_click_target()
  util.hudToast("点击被攻打的目标")
  mSleep(1500)
  util.click(1265,600)
  STEP_attack = 3
end

function func_attack_click_zengyi()
  util.hudToast("点击增益")
  util.click(1047,460)
  STEP_attack = 4
end

function func_attack_select_mianzhan()
	util.hudToast("准备选择免战牌")
  util.click(1027,240)
  STEP_attack = 5
end

function func_attack_click_mianzhan()
  util.hudToast("点击免战牌")
  util.click(1618,532)
  STEP_attack = 6
end

function func_attack_detect_alert()
  x, y = findColorInRegionFuzzy(0x3b1913, 99, 
    1477, 
    237, 
    1578, 
    318,
    0, 0)
  x1, y1 = findColorInRegionFuzzy(0x9c7734, 99, 
    1477, 
    237, 
    1578, 
    318,
    0, 0)
  x2, y2 = findColorInRegionFuzzy(0x396a7f, 99, 
    715, 
    655, 
    1046, 
    953,
    0, 0)
  x3, y3 = findColorInRegionFuzzy(0xb19141, 99, 
    1153, 
    655, 
    1481, 
    953,
    0, 0)
  if x > -1 then
    util.hudToast("检测到付费弹窗,进行付费")
    util.click(x2,x2)
    STEP_attack = 7
  else
    STEP_attack = 7
  end
end

function func_attack_click_prepare_finish()
  util.hudToast("准备关闭界面")
  util.clickRightSpace()
  util.clickRightSpace()
  util.closeMenuIfNecessary()
  STEP_attack = util.ERROR_CODE
end

function attack.func_attack_main()
  mSleep(500)
  if STEP_attack == 0 then
    func_attack_detect_attack()
    attack.func_attack_main()
  elseif STEP_attack == 1 then
    func_attack_search_target()
    attack.func_attack_main()
  elseif STEP_attack == 2 then
    func_attack_click_target()
    attack.func_attack_main()
  elseif STEP_attack == 3 then
    func_attack_click_zengyi()
    attack.func_attack_main()
  elseif STEP_attack == 4 then
    func_attack_select_mianzhan()
    attack.func_attack_main()
  elseif STEP_attack == 5 then
    func_attack_click_mianzhan()
    attack.func_attack_main()
  elseif STEP_attack == 6 then
    func_attack_detect_alert()
    attack.func_attack_main()
  elseif STEP_attack == 7 then
    func_attack_click_prepare_finish()
    attack.func_attack_main()
  elseif STEP_attack == util.ERROR_CODE then
    STEP_attack = 0
  end
end

return attack