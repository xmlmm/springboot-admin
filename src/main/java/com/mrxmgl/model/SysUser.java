package com.mrxmgl.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2019/12/21.
 */
public class SysUser implements Serializable{

    private Integer id;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}