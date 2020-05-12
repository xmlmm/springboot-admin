package com.mrxmgl.feign;

import com.mrxmgl.feign.hystric.DemoHystric;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "springboot-fygl", path="fygl/", fallback = DemoHystric.class)//定义feign的客户端
public interface IDemoClient {

    @RequestMapping(path = "/fygl/bgtz/testFeign", method= RequestMethod.POST, consumes = {"application/json;charset=UTF-8"}, produces= {"application/json;charset=UTF-8"})
    String demoService(@RequestParam(value = "name") String name);

}