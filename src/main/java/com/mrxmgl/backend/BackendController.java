package com.mrxmgl.backend;

import com.mrxmgl.feign.IDemoClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sys")
public class BackendController {

	@Autowired
	private IDemoClient iDemoClient;

	@RequestMapping(value = "/login")
	public String login() {
		String result = iDemoClient.demoService("springboot-admin服务尝试申请调用springboot-fygl服务");
		System.out.println("-----------------------"+result);
		return "login";
	}

}