package com.mrxmgl.mapper;

import com.mrxmgl.model.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SysUserMapper {

    List<SysUser> queryDatas();

}