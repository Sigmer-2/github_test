package com.zlk.zlkproject.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.mapper.UserMapper;
import com.zlk.zlkproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author: zhc
 * @time: 2020/8/17 10:27
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Integer selectUserLogin(User user) {
        return userMapper.selectUserLogin(user);
    }

    @Override
    public Integer selectUserByName(String username) {
        return userMapper.selectUserByName(username);
    }

    @Override
    public Integer saveUser(User user) {
        return userMapper.saveUser(user);
    }
}
