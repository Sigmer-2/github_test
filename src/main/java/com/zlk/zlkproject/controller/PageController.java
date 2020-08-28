package com.zlk.zlkproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: zhc
 * @time: 2020/8/17 10:23
 */
@Controller
public class PageController {
    //登录
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }
    //注册
    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }
    //流加载
    @RequestMapping(value = "/ask1")
    public String flow(){
        return "Home/Public/ask1";
    }
}
