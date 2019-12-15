package com.mrxmgl.feign.hystric;

import com.mrxmgl.feign.IDemoClient;
import org.springframework.stereotype.Component;

@Component
public class DemoHystric implements IDemoClient {

    /**
     * Hystrix 熔断-返回错误信息
     */
    @Override
    public String demoService(String name) {
        return  name+"失败！！！";
    }
}
