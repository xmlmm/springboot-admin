package com.mrxmgl.controller;

import com.mrxmgl.feign.IDemoClient;
import com.mrxmgl.model.SysUser;
import com.mrxmgl.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/sys")
public class SysUserController {

	@Autowired
	private IDemoClient iDemoClient;

	@Autowired
	private ISysUserService iSysUserService;

	@RequestMapping(value = "/login")
	public String login(Model model) {
//		String result = iDemoClient.demoService("springboot-admin服务尝试申请调用springboot-fygl服务");
//		System.out.println("-----------------------"+result);
		List<SysUser> userList = iSysUserService.queryDatas();
		model.addAttribute("userList", userList);
		return "login";
	}

}