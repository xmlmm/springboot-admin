package com.mrxmgl.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.security.auth.Subject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 
 * @Title: BackendController.java
 * @Package com.mingrui.gcgl.backend.controller
 * @Description: 系统登录认证controller
 * @author Guy
 * @date 2016年8月14日 下午10:05:21
 */
@Controller
@RequestMapping(value = "/sys")
public class BackendController {

	@RequestMapping(value = "/index")
	public String index(Model model) {
		System.out.println("index------");
		return "index";
	}

	@RequestMapping(value = "/login")
	public String login(Model model) {
		System.out.println("login------");
		return "login";
	}

	@RequestMapping("/main")
	public String main(Model model,String modNo,String modChildNo) {
		Subject subject = SecurityUtils.getSubject();
		Session   session = SecurityUtils.getSubject().getSession();
		ActiveStaff activeStaff = (ActiveStaff) subject.getPrincipal();
		String[] modeArr = null;
		List<String> list = new ArrayList<String>();
		String operFlag = "1";
		if(StringUtils.isNotBlank(modChildNo)){
			modeArr = modChildNo.split(",");
		}
		if(null != modeArr && modeArr.length > 0){
			list = Arrays.asList(modeArr);
		}
		if((StringUtils.isNotBlank(modNo)) && (modNo.contains("31") ||modNo.contains("32") || modNo.contains("33") || modNo.contains("34")|| modNo.contains("35"))){
			operFlag = "2";
		}
		model.addAttribute("operFlag", operFlag);
		List<Module> menus = sysService.querySysByStaffId(this.getCurrentRole(),modNo,list);
		activeStaff.setMenus(menus);
		model.addAttribute("activeStaff", activeStaff);
		initUserCacheData();
		String clientType =  (String)session.getAttribute("clientType");
		model.addAttribute("CURRENT_BD_NAME", EhcacheHelper.get("CURRENT_BD_NAME_SELECTED_NAME"));
		model.addAttribute("CURRENT_PERIOD_NAME", EhcacheHelper.get("CURRENT_PERIOD_NAME"));
		if("app".equals(clientType)){// 手机端登录
			return "redirect:/app/User/index";
		}else{// pc端登录
			if("2".equals(operFlag) || "0906".equals(modChildNo) || "0908".equals(modChildNo) || "0909".equals(modChildNo) || "0919".equals(modChildNo)
					|| "10".equals(modNo) || "20".equals(modNo) || "21".equals(modNo) || "30".equals(modNo)
					|| "11".equals(modNo) || "17".equals(modNo) || "08".equals(modNo) || "23".equals(modNo)|| "25".equals(modNo)|| "26".equals(modNo)|| "27".equals(modNo)|| "28".equals(modNo)
					|| "03".equals(modNo)|| "12".equals(modNo)|| "13".equals(modNo)|| "14".equals(modNo)|| "16".equals(modNo)|| "19".equals(modNo)){
				if("12".equals(modNo)|| "13".equals(modNo)|| "16".equals(modNo) || "25".equals(modNo)){
					//更新物联网数据的采集时间为当天
					yhqtglService.updateWlwData();
				}
				return "mainXxgcPage";
			}
			if("18".equals(modNo)){
				return "mainCldwPage";
			}
			if (6 == activeStaff.getStaffRoleType()){
				return "jkzx";
			}else{
				return "main";
			}
		}
	}

}