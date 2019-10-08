package com.mrxmgl.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}