package com.zlk.zlkproject.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.service.UserService;
import com.zlk.zlkproject.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zlk.zlkproject.util.MD5Utils.md5Encrypt32Lower;


/**
 * @author: zhc
 * @time: 2020/8/17 10:23
 */
@RestController
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserService userService;

    //登陆
    @RequestMapping(value = "/login", method = RequestMethod.POST)

    public Map<String, Object> login(@RequestBody User user) throws Exception {
        System.out.println(user.toString());
        Map<String, Object> map = new HashMap<>();
        user.setPassword(md5Encrypt32Lower(user.getPassword()));
        Integer flag = userService.selectUserLogin(user);
        System.out.println(flag);
        if (flag == 1) {
            map.put("status", 1);
            System.out.println(map.get("status"));
            return map;
        } else {
            map.put("status", 0);
        }

        return map;
    }


    //注册
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public Map<String, Object> register(@RequestBody User user) {
        System.out.println(user.toString());

        Map<String, Object> map = new HashMap<>();
        //先查询数据库内有无此用户名
        Integer flag1 = userService.selectUserByName(user.getUsername());
        System.out.println(flag1);
        if (flag1 > 0) {
            map.put("status", -1);
            return map;
        }
        //md5加密
        user.setPassword(md5Encrypt32Lower(user.getPassword()));
        Integer flag = userService.saveUser(user);
        if (flag > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

}
