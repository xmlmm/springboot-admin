package com.mrxmgl.service.impl;

import com.mrxmgl.mapper.SysUserMapper;
import com.mrxmgl.model.SysUser;
import com.mrxmgl.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2019/12/21.
 */
@Service
public class SysUserServiceImpl implements ISysUserService{

    @Autowired
    private SysUserMapper sysUserMapper;

    public List<SysUser> queryDatas(){
        return sysUserMapper.queryDatas();
    }

}